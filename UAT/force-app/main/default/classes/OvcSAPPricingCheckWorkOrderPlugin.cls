/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcSAPPricingCheckWorkOrderPlugin is used by the Overcast component ovcSAPPricingCheckWorkOrder which
 * sets SAP Pricing to the Work Order Line Items on a Work Order record.
 */
global with sharing class OvcSAPPricingCheckWorkOrderPlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private Map<String, Id> itemMap = new Map<String, Id>();
    @TestVisible
    private String recordId;
    @TestVisible
    Boolean autoApplyPrices = false;
    overcast.sapPricingAvailabilityPlugin managedPlugin;

    global OvcSAPPricingCheckWorkOrderPlugin() {
        managedPlugin = new overcast.sapPricingAvailabilityPlugin();
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
        Object applyPricesSetting = settings.remove('AutoApplyPrices');
        if (applyPricesSetting != null) {
            this.autoApplyPrices = Boolean.valueOf(applyPricesSetting);
        }
        this.managedPlugin.beforeScenarioCall(recordId, referenceFieldValues, importParameters, settings);
        saveItemData(referenceFieldValues, this.itemMap);
    }

    global static void saveItemData(Map<String, Object> referenceFieldValues, Map<String, Id> itemMap) {
        List<Map<String, Object>> itemsIn = (List<Map<String, Object>>) referenceFieldValues.get('ORDER_ITEMS_IN');
        if (itemsIn != null) {
            for (Map<String, Object> itemIn : itemsIn) {
                String itemNo = (String) itemIn.get('ITM_NUMBER');
                if (String.isNotBlank(itemNo)) {
                    itemMap.put(itemNo, (Id) itemIn.get('ovc_ID_FIELD'));
                }
            }
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        this.managedPlugin.afterScenarioCall(returnedData, null, settings);
        if (!this.autoApplyPrices) {
            return;
        }
        Map<Id, WorkOrderLineItem> wkOrderItemMap = new Map<Id, WorkOrderLineItem>(
            databaseAccess.getWorkOrderLineItems(new Set<Id>(this.itemMap.values()))
        );
        WorkOrder wkOrder = databaseAccess.getWorkOrder(this.recordId);
        setDataInRecords(returnedData, this.itemMap, wkOrder, wkOrderItemMap);
        if (!wkOrderItemMap.isEmpty()) {
            databaseAccess.updateWorkOrderLineItem(wkOrderItemMap.values());
        }
        if (wkOrder != null) {
            databaseAccess.updateWorkOrder(wkOrder);
        }
    }

    global static void setDataInRecords(
        Map<String, Object> returnedData,
        Map<String, Id> itemMap,
        SObject parentRecord,
        Map<Id, SObject> itemRecordsMap
    ) {
        Map<String, Object> returnMsg = (Map<String, Object>) returnedData?.get('RETURN_x');
        if (parentRecord != null && returnMsg != null && returnMsg.containsKey('MESSAGE')) {
            setValueInSObjectField(parentRecord, 'ovcSAP_Message__c', returnMsg.get('MESSAGE'));
        }
        if (itemRecordsMap == null) {
            return;
        }
        List<Object> itemsOut = (List<Object>) returnedData?.get('ORDER_ITEMS_OUT');
        if (itemsOut == null || itemsOut.isEmpty()) {
            for (SObject itemRecord : itemRecordsMap.values()) {
                setValueInSObjectField(itemRecord, 'ovcSAP_Pricing_Status__c', 'Error');
            }
        } else {
            Map<String, Decimal> itemSAPPriceMap = new Map<String, Decimal>();
            Map<String, Decimal> itemSAPTaxMap = new Map<String, Decimal>();
            for (Object itemOut : itemsOut) {
                Map<String, Object> itmOut = (Map<String, Object>) itemOut;
                String itemNo = (String) itmOut.get('ITM_NUMBER');
                if (String.isNotBlank(itemNo)) {
                    itemSAPPriceMap.put(itemNo, (Decimal) itmOut.get('ocf_SAPPrice'));
                    itemSAPTaxMap.put(itemNo, (Decimal) itmOut.get('TX_DOC_CUR'));
                }
            }
            for (String itemNo : itemMap.keySet()) {
                SObject itemRecord = itemRecordsMap.get(itemMap.get(itemNo));
                if (itemRecord != null) {
                    setValueInSObjectField(itemRecord, 'UnitPrice', itemSAPPriceMap.get(itemNo));
                    setValueInSObjectField(itemRecord, 'ovcSAP_Tax__c', itemSAPTaxMap.get(itemNo)); // For Work Order Line Item
                    setValueInSObjectField(itemRecord, 'Tax__c', itemSAPTaxMap.get(itemNo)); // For Contract Line Item
                    setValueInSObjectField(itemRecord, 'ovcSAP_Pricing_Status__c', 'Set');
                }
            }
        }
    }

    private static void setValueInSObjectField(SObject record, String field, Object value) {
        if (record != null && String.isNotBlank(field)) {
            Map<String, Schema.SObjectField> fieldsMap = record.getSObjectType().getDescribe().fields.getMap();
            if (fieldsMap.containsKey(field)) {
                record.put(field, value);
            }
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        if (this.autoApplyPrices) {
            WorkOrder wkOrder = databaseAccess.getWorkOrder(this.recordId);
            if (wkOrder != null) {
                wkOrder.ovcSAP_Message__c = ex.getMessage().left(255);
                databaseAccess.updateWorkOrder(wkOrder);
            } else {
                System.debug(ex.getMessage());
            }
        }
        return true;
    }

    //DatabaseAccess interface implementation
    @TestVisible
    private static IDatabaseAccess databaseAccess {
        get {
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
            // prettier-ignore
            return [ SELECT Id, WorkOrderId, UnitPrice, ovcSAP_Pricing_Status__c, ovcSAP_Tax__c FROM WorkOrderLineItem WHERE Id IN :lineItemIds WITH SECURITY_ENFORCED ];
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