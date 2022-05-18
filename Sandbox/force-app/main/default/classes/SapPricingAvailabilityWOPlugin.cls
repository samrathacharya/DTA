/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * sapPricingAvailabilityWOPlugin is used by the Overcast component sapPricingCheckWorkOrder which
 * sets SAP Pricing to the Work Order Line Items on a Work Order record.
 */
global with sharing class SapPricingAvailabilityWOPlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private Map<String, Id> itemMap = new Map<String, Id>();
    @TestVisible
    private Map<String, Object> itemDateMap = new Map<String, Object>();
    @TestVisible
    private String recordId;
    @TestVisible
    Boolean autoApplyPrices = false;

    global SapPricingAvailabilityWOPlugin() {
    }

    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        this.recordId = recordId;
    }

    global void afterReferenceValuesLoaded(Id recordId, String componentName, Map<String, Map<String, Object>> referenceValues) {
    }

    global void afterReferenceValuesLoaded(
        Id recordId,
        String componentName,
        Map<String, Map<String, Object>> referenceValues,
        Map<String, List<Map<String, Object>>> referenceChildValues
    ) {
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        Object applyPricesSetting = settings.get('AutoApplyPrices');
        if (applyPricesSetting != null) {
            this.autoApplyPrices = Boolean.valueOf(applyPricesSetting);
        }
        applyLogicBeforeCall(referenceFieldValues, importParameters, settings, this.itemMap, this.itemDateMap);
    }

    global static void applyLogicBeforeCall(
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings,
        Map<String, Id> itemMap,
        Map<String, Object> itemDateMap
    ) {
        Date reqDateHeader = Date.today();
        List<Map<String, Object>> cfgRefs = new List<Map<String, Object>>();
        List<Map<String, Object>> cfgInsts = new List<Map<String, Object>>();
        List<Map<String, Object>> cfgVals = new List<Map<String, Object>>();

        if (referenceFieldValues.containsKey('ORDER_HEADER_IN')) {
            Map<String, Object> header = (Map<String, Object>) referenceFieldValues.get('ORDER_HEADER_IN');
            Object reqDate = header.get('REQ_DATE_H');
            if (reqDate != null) {
                Datetime reqDateTime = (Datetime) reqDate;
                reqDateHeader = reqDateTime.date();
            }
        }
        String discountCondition = settings.containsKey('DiscountCondition') ? (String) settings.get('DiscountCondition') : '';
        Boolean getLineItemFromRefVal = settings.containsKey('ItemSource') ? ((String) settings.get('ItemSource')).toLowerCase() == 'custom' : false;

        List<Map<String, Object>> orderItems = new List<Map<String, Object>>();
        Object orderItemsObj = referenceFieldValues.get('ORDER_ITEMS_IN');
        if (getLineItemFromRefVal && orderItemsObj != null) {
            orderItems = (List<Map<String, Object>>) orderItemsObj;
            for (Map<String, Object> itm : orderItems) {
                if (String.isNotBlank(discountCondition)) {
                    itm.put('COND_TYPE', discountCondition);
                }
                Object condVal = itm.get('COND_VALUE');
                if (condVal != null) {
                    Decimal dsc = (Decimal) condVal;
                    dsc = dsc * (dsc != 0 ? -1 : 1);
                    itm.put('COND_VALUE', dsc);
                }
                Object reqQty = itm.get('REQ_QTY');
                if (reqQty != null) {
                    itm.put('REQ_QTY', (Decimal) reqQty * 1000);
                }
                Object reqDate = itm.get('REQ_DATE');
                if (reqDate == null) {
                    itm.put('REQ_DATE', reqDateHeader);
                }
                Object configurations = itm.get('Configurations');
                if (configurations != null) {
                    Map<String, List<Map<String, String>>> cfgs = (Map<String, List<Map<String, String>>>) JSON.deserializeStrict(
                        (String) configurations,
                        Map<String, List<Map<String, String>>>.class
                    );
                    List<Map<String, String>> cfgsSet = cfgs.get('Set');
                    if (cfgsSet != null && !cfgsSet.isEmpty()) {
                        itm.put('Configurations', cfgsSet);
                    }
                }
            }
        }

        for (Map<String, Object> itm : orderItems) {
            itemMap.put((String) itm.get('ITM_NUMBER'), (Id) itm.get('ovc_ID_FIELD'));
            itemDateMap.put((String) itm.get('ITM_NUMBER'), itm.get('REQ_DATE'));

            itm.put('PO_ITM_NO', itm.get('ITM_NUMBER'));
            itm.put('TARGET_QTY', itm.get('REQ_QTY'));

            Object itmNumber = itm.get('ITM_NUMBER');
            List<Object> configs = (List<Object>) itm.remove('Configurations');
            //Handle configurations
            if (configs != null && !configs.isEmpty()) {
                cfgRefs.add(new Map<String, Object>{ 'CONFIG_ID' => itmNumber, 'ROOT_ID' => itmNumber, 'POSEX' => itmNumber });
                cfgInsts.add(
                    new Map<String, Object>{
                        'CONFIG_ID' => itmNumber,
                        'INST_ID' => itmNumber,
                        'OBJ_TYPE' => 'MARA',
                        'CLASS_TYPE' => '300',
                        'OBJ_KEY' => itm.get('MATERIAL')
                    }
                );
                for (Object config : configs) {
                    Map<String, Object> cfg = (Map<String, Object>) config;
                    cfgVals.add(
                        new Map<String, Object>{
                            'CONFIG_ID' => itmNumber,
                            'INST_ID' => itmNumber,
                            'CHARC' => cfg.get('Char'),
                            'VALUE' => cfg.get('Val')
                        }
                    );
                }
            }
        }

        importParameters.put('ORDER_ITEMS_IN', orderItems);
        //Add configuration data if available
        if (!cfgVals.isEmpty()) {
            importParameters.put('ORDER_CFGS_VALUE', cfgVals);
            importParameters.put('ORDER_CFGS_INST', cfgInsts);
            importParameters.put('ORDER_CFGS_REF', cfgRefs);
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<WorkOrderLineItem> workOrderLineItems = new List<WorkOrderLineItem>();
        WorkOrder wkOrder;
        if (!itemMap.isEmpty()) {
            workOrderLineItems.addAll(databaseAccess.getWorkOrderLineItems(new Set<Id>(itemMap.values())));
        }
        if (String.isNotBlank(this.recordId)) {
            wkOrder = databaseAccess.getWorkOrder(this.recordId);
        }
        applyLogicAfterCall(returnedData, this.itemMap, this.itemDateMap, wkOrder, workOrderLineItems, this.autoApplyPrices);
        if (!workOrderLineItems.isEmpty()) {
            databaseAccess.updateWorkOrderLineItem(workOrderLineItems);
        }
        if (wkOrder != null) {
            databaseAccess.updateWorkOrder(wkOrder);
        }
    }

    global static void applyLogicAfterCall(
        Map<String, Object> returnedData,
        Map<String, Id> itemMap,
        Map<String, Object> itemDateMap,
        SObject parentRecord,
        List<SObject> itemRecords,
        Boolean autoApplyPrices
    ) {
        List<Object> itemList = (List<Object>) returnedData.get('ORDER_ITEMS_OUT');
        if (itemList != null && !itemList.isEmpty()) {
            Map<Id, Decimal> workOrderLineIdPrice = new Map<Id, Decimal>();
            set<Id> workOrderLineIds = new Set<Id>();
            for (Object item : itemList) {
                Map<String, Object> itm = (Map<String, Object>) item;
                itm.put('Id', itemMap.get((String) itm.get('ITM_NUMBER')));
                workOrderLineIds.add(itemMap.get((String) itm.get('ITM_NUMBER')));

                Decimal reqQty = (Decimal) itm.get('REQ_QTY');
                if (reqQty == null || reqQty == 0) {
                    // Handle cases where BAPI returns quantity in TARGET_QTY instead of REQ_QTY
                    reqQty = (Decimal) itm.get('TARGET_QTY');
                }
                Decimal subTtl1 = (Decimal) itm.get('NET_VALUE1');
                Decimal sapPrice = (subTtl1 != null && reqQty != null && reqQty > 0) ? subTtl1 / reqQty : subTtl1;
                itm.put('ocf_SAPTotal', subTtl1);
                itm.put('ocf_SAPQuantity', reqQty);
                itm.put('ocf_SAPPrice', sapPrice);
                itm.put('ocf_ReqDate', itemDateMap.get((String) itm.get('PO_ITM_NO')));

                workOrderLineIdPrice.put(itemMap.get((String) itm.get('ITM_NUMBER')), sapPrice);
            }
            returnedData.put('ORDER_ITEMS_OUT', itemList);
            if (autoApplyPrices) {
                for (SObject itemRecord : itemRecords) {
                    itemRecord.put('UnitPrice', workOrderLineIdPrice.get(itemRecord.Id));
                    itemRecord.put('ovcSAP_Pricing_Status__c', 'Set');
                }
                if (parentRecord != null) {
                    parentRecord.put('ovcSAP_Message__c', '');
                }
            }
        } else if (autoApplyPrices) {
            for (SObject itemRecord : itemRecords) {
                itemRecord.put('ovcSAP_Pricing_Status__c', 'Error');
            }
            Map<String, Object> returnMsg = (Map<String, Object>) returnedData.get('RETURN_x');
            if (parentRecord != null) {
                parentRecord.put('ovcSAP_Message__c', returnMsg?.get('MESSAGE'));
            }
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        if (String.isNotBlank(this.recordId) && this.autoApplyPrices) {
            WorkOrder wkOrder = databaseAccess.getWorkOrder(this.recordId);
            if (wkOrder != null) {
                wkOrder.ovcSAP_Message__c = ex.getMessage().left(255);
                databaseAccess.updateWorkOrder(wkOrder);
            }
        }
        return true;
    }

    //DatabaseAccess interface implementation
    @TestVisible
    private static IDatabaseAccess databaseAccess {
        get {
            // prettier-ignore
            return databaseAccess == null ? (databaseAccess = new DatabaseAccess()) : databaseAccess;
        }
        set {
            databaseAccess = value;
        }
    }
    @TestVisible
    private interface IDatabaseAccess {
        List<WorkOrderLineItem> getWorkOrderLineItems(set<Id> lineItemIds);
        void updateWorkOrderLineItem(List<WorkOrderLineItem> wkOrderLineItems);
        WorkOrder getWorkOrder(Id wkOrderId);
        void updateWorkOrder(WorkOrder wkOrder);
    }

    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public List<WorkOrderLineItem> getWorkOrderLineItems(set<Id> lineItemIds) {
            return [
                SELECT Id, UnitPrice, ovcSAP_Pricing_Status__c, WorkOrderId
                FROM WorkOrderLineItem
                WHERE Id IN :lineItemIds
                WITH SECURITY_ENFORCED
            ];
        }

        public void updateWorkOrderLineItem(List<WorkOrderLineItem> wkOrderLineItems) {
            update wkOrderLineItems;
        }

        public WorkOrder getWorkOrder(Id wkOrderId) {
            List<WorkOrder> wkOrderList = [SELECT Id, ovcSAP_Message__c FROM WorkOrder WHERE Id = :wkOrderId WITH SECURITY_ENFORCED];
            return wkOrderList.isEmpty() ? null : wkOrderList[0];
        }

        public void updateWorkOrder(WorkOrder wkOrder) {
            update wkOrder;
        }
    }
}