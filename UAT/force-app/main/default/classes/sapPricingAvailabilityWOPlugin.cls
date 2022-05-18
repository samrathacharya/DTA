global with sharing class sapPricingAvailabilityWOPlugin implements overcast.ComponentPluginV3 {
    private Map<String, Id> itemMap = new Map<String, Id>();
    private Map<String, Object> itemDateMap = new Map<String, Object>();

    global sapPricingAvailabilityWOPlugin() {
    }

    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
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

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        System.debug(ex.getMessage());
        return true;
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        applyLogicBeforeCall(recordId, referenceFieldValues, importParameters, settings, this.itemMap, this.itemDateMap);
    }

    global void applyLogicBeforeCall(
        Id recordId,
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
            if (header.containsKey('REQ_DATE_H') && header.get('REQ_DATE_H') != null) {
                Datetime reqDateTime = (Datetime) header.get('REQ_DATE_H');
                reqDateHeader = reqDateTime.date();
            }
        }
        String discountCondition = settings.containsKey('DiscountCondition') ? (String) settings.get('DiscountCondition') : '';
        Boolean getLineItemFromRefVal = settings.containsKey('ItemSource') ? ((String) settings.get('ItemSource')).toLowerCase() == 'custom' : false;

        List<Map<String, Object>> orderItems = new List<Map<String, Object>>();
        if (getLineItemFromRefVal) {
            if (referenceFieldValues.containsKey('ORDER_ITEMS_IN')) {
                orderItems = (List<Map<String, Object>>) referenceFieldValues.get('ORDER_ITEMS_IN');
                for (Map<String, Object> itm : orderItems) {
                    if (String.isNotBlank(discountCondition)) {
                        itm.put('COND_TYPE', discountCondition);
                    }
                    if (itm.containsKey('COND_VALUE')) {
                        Decimal dsc = (Decimal) itm.get('COND_VALUE');
                        dsc = dsc * (dsc != 0 ? -1 : 1);
                        itm.put('COND_VALUE', dsc);
                    }
                    if (itm.containsKey('REQ_QTY')) {
                        itm.put('REQ_QTY', (Decimal) itm.get('REQ_QTY') * 1000);
                    }
                    if (itm.containsKey('REQ_DATE')) {
                        if (itm.get('REQ_DATE') == null) {
                            itm.put('REQ_DATE', reqDateHeader);
                        }
                    } else {
                        itm.put('REQ_DATE', reqDateHeader);
                    }
                    if (itm.containsKey('Configurations')) {
                        Map<String, List<Map<String, String>>> cfgs = (Map<String, List<Map<String, String>>>) JSON.deserializeStrict(
                            (String) itm.get('Configurations'),
                            Map<String, List<Map<String, String>>>.class
                        );
                        if (cfgs.keySet().contains('Set') && !cfgs.get('Set').isEmpty()) {
                            itm.put('Configurations', cfgs.get('Set'));
                        }
                    }
                }
            }
        }

        for (Map<String, Object> itm : orderItems) {
            itemMap.put((String) itm.get('ITM_NUMBER'), (Id) itm.get('ovc_ID_FIELD'));
            itemDateMap.put((String) itm.get('ITM_NUMBER'), itm.get('REQ_DATE'));

            itm.put('PO_ITM_NO', itm.get('ITM_NUMBER'));
            itm.put('TARGET_QTY', itm.get('REQ_QTY'));

            //Handle configurations
            if (itm.containsKey('Configurations')) {
                Object itmNumber = itm.get('ITM_NUMBER');
                List<Object> configs = (List<Object>) itm.remove('Configurations');
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
        }

        importParameters.put('ORDER_ITEMS_IN', orderItems);
        //Add configuration data if available
        if (!cfgVals.isEmpty()) {
            importParameters.put('ORDER_CFGS_VALUE', cfgVals);
            importParameters.put('ORDER_CFGS_INST', cfgInsts);
            importParameters.put('ORDER_CFGS_REF', cfgRefs);
        }
        System.debug('orderItems');
        System.debug(JSON.serializePretty(orderItems));
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        system.debug('RETURN_x');
        System.debug(JSON.serializePretty(returnedData.get('RETURN_x')));

        List<WorkOrderLineItem> workOrderLineItems = new List<WorkOrderLineItem>();
        WorkOrder wkOrder;
        if (!itemMap.isEmpty()) {
            workOrderLineItems.addAll(databaseAccess.getWorkOrderLineItems(new Set<Id>(itemMap.values())));
            if (!workOrderLineItems.isEmpty()) {
                wkOrder = databaseAccess.getWorkOrder(workOrderLineItems[0].WorkOrderId);
            }
        }
        applyLogicAfterCall(returnedData, cmp, settings, wkOrder, workOrderLineItems);

        if (!workOrderLineItems.isEmpty()) {
            databaseAccess.updateWorkOrderLineItem(workOrderLineItems);
        }
        if (wkOrder != null) {
            databaseAccess.updateWorkOrder(wkOrder);
        }
        System.debug('workOrderLineItems');
        System.debug(JSON.serializePretty(workOrderLineItems));
        System.debug('wkOrder');
        System.debug(JSON.serializePretty(wkOrder));
    }

    global void applyLogicAfterCall(
        Map<String, Object> returnedData,
        overcast.ComponentDefinition.Component cmp,
        Map<String, Object> settings,
        SObject parentRecord,
        List<SObject> itemRecords
    ) {
        Boolean toSetPrice = Boolean.valueOf(settings.get('AutoApplyPrices'));

        List<Object> itemList = (List<Object>) returnedData.get('ORDER_ITEMS_OUT');
        if (itemList != null && !itemList.isEmpty()) {
            String netValField = 'NET_VALUE1';
            // Enable configurable override for the field to use for net value from SAP
            /*if (String.isNotBlank((String) settings.get('netValueField'))) {
                netValField = (String) settings.get('netValueField');
            }*/
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
                Decimal subTtl1 = (Decimal) itm.get(netValField);
                Decimal sapPrice = (subTtl1 != null && reqQty != null && reqQty > 0) ? subTtl1 / reqQty : subTtl1;
                itm.put('ocf_SAPTotal', subTtl1);
                itm.put('ocf_SAPQuantity', reqQty);
                itm.put('ocf_SAPPrice', sapPrice);
                itm.put('ocf_ReqDate', itemDateMap.get((String) itm.get('PO_ITM_NO')));

                workOrderLineIdPrice.put(itemMap.get((String) itm.get('ITM_NUMBER')), sapPrice);
            }
            returnedData.put('ORDER_ITEMS_OUT', itemList);
            if (toSetPrice) {
                for (SObject wol : itemRecords) {
                    wol.put('UnitPrice', workOrderLineIdPrice.get(wol.Id));
                    wol.put('ovcSAP_Pricing_Status__c', 'Set');
                }
                if (parentRecord != null) {
                    parentRecord.put('ovcSAP_Message__c', '');
                }
            }
        } else if (toSetPrice) {
            for (SObject wol : itemRecords) {
                wol.put('ovcSAP_Pricing_Status__c', 'Error');
            }
            Map<String, Object> returnMsg = (Map<String, Object>) returnedData.get('RETURN_x');
            if (parentRecord != null) {
                parentRecord.put('ovcSAP_Message__c', returnMsg?.get('MESSAGE'));
            }
        }
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
        List<WorkOrderLineItem> getWorkOrderLineItems(set<Id> workOrderLineIds);
        void updateWorkOrderLineItem(List<WorkOrderLineItem> records);
        WorkOrder getWorkOrder(Id workOrderId);
        void updateWorkOrder(WorkOrder record);
    }

    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public List<WorkOrderLineItem> getWorkOrderLineItems(set<Id> workOrderLineIds) {
            return [
                SELECT Id, UnitPrice, ovcSAP_Pricing_Status__c, WorkOrderId
                FROM WorkOrderLineItem
                WHERE Id IN :workOrderLineIds
                WITH SECURITY_ENFORCED
            ];
        }

        public void updateWorkOrderLineItem(List<WorkOrderLineItem> records) {
            update records;
        }

        public WorkOrder getWorkOrder(Id workOrderId) {
            return [SELECT Id, ovcSAP_Message__c FROM WorkOrder WHERE Id = :workOrderId WITH SECURITY_ENFORCED];
        }

        public void updateWorkOrder(WorkOrder record) {
            update record;
        }
    }
}