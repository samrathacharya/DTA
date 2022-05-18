/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
private class SapPricingAvailabilityWOPluginTest {
    private class DatabaseAccess implements SapPricingAvailabilityWOPlugin.IDatabaseAccess {
        WorkOrder parentRecord;
        List<WorkOrderLineItem> itemRecords;

        public List<WorkOrderLineItem> getWorkOrderLineItems(set<Id> lineItemIds) {
            return new List<WorkOrderLineItem>{ new WorkOrderLineItem() };
        }

        public void updateWorkOrderLineItem(List<WorkOrderLineItem> wkOrderLineItems) {
            this.itemRecords = wkOrderLineItems;
        }

        public WorkOrder getWorkOrder(Id wkOrderId) {
            return new WorkOrder();
        }

        public void updateWorkOrder(WorkOrder wkOrder) {
            this.parentRecord = wkOrder;
        }
    }

    @isTest
    static void testPluginMethods() {
        //Test database access methods
        System.assertEquals(new List<WorkOrderLineItem>(), SapPricingAvailabilityWOPlugin.databaseAccess.getWorkOrderLineItems(null));
        System.assertEquals(null, SapPricingAvailabilityWOPlugin.databaseAccess.getWorkOrder(null));

        DatabaseAccess db = new DatabaseAccess();
        SapPricingAvailabilityWOPlugin.databaseAccess = db;
        SapPricingAvailabilityWOPlugin plugin = new SapPricingAvailabilityWOPlugin();

        //Test empty plugin methods
        try {
            plugin.afterReferenceValuesLoaded(null, null, null);
            plugin.afterReferenceValuesLoaded(null, null, null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false);
        }

        // Test afterComponentMetadataLoaded()
        Id recordId = Id.valueOf('001xa000003DIlo');
        plugin.afterComponentMetadataLoaded(recordId, null);
        System.assertEquals(recordId, plugin.recordId);

        // Test beforeScenarioCall()
        Map<String, Object> refFieldVals = new Map<String, Object>();
        Map<String, Object> header = new Map<String, Object>{ 'REQ_DATE_H' => Datetime.now() };
        refFieldVals.put('ORDER_HEADER_IN', header);
        Map<String, Object> itemIn = new Map<String, Object>{
            'ITM_NUMBER' => '1',
            'ovc_ID_FIELD' => '001xa000003DIlo',
            'MATERIAL' => 'ABC',
            'COND_VALUE' => 1,
            'REQ_QTY' => 1,
            'REQ_DATE' => Datetime.now(),
            'Configurations' => JSON.serialize(
                new Map<String, List<Map<String, String>>>{
                    'Set' => new List<Map<String, String>>{ new Map<String, String>{ 'Char' => 'x', 'Val' => 'x' } }
                }
            )
        };
        refFieldVals.put('ORDER_ITEMS_IN', new List<Map<String, Object>>{ itemIn });
        Map<String, Object> settings = new Map<String, Object>{ 'DiscountCondition' => 'd', 'ItemSource' => 'custom', 'AutoApplyPrices' => true };
        Map<String, Object> importParams = new Map<String, Object>();
        plugin.beforeScenarioCall(recordId, refFieldVals, importParams, settings);
        System.assert(!importParams.isEmpty());
        System.assert(!plugin.itemMap.isEmpty());
        System.assert(!plugin.itemDateMap.isEmpty());
        System.assert(plugin.autoApplyPrices);

        String errorMsg = 'Error occurred';
        Map<String, Object> retData = new Map<String, Object>{ 'RETURN_x' => new Map<String, Object>{ 'MESSAGE' => errorMsg } };

        //Test afterScenarioCall() without ORDER_ITEMS_OUT
        plugin.afterScenarioCall(retData, null, settings);
        System.assertNotEquals(null, db.parentRecord);
        System.assertEquals(errorMsg, db.parentRecord.ovcSAP_Message__c);
        System.assertNotEquals(null, db.itemRecords);
        System.assertEquals(1, db.itemRecords.size());
        System.assertEquals('Error', db.itemRecords[0].ovcSAP_Pricing_Status__c);

        Map<String, Object> itemOut = new Map<String, Object>{ 'ITM_NUMBER' => '1', 'TARGET_QTY' => 1, 'PO_ITM_NO' => '1' };
        retData = new Map<String, Object>{ 'ORDER_ITEMS_OUT' => new List<Object>{ itemOut } };
        plugin.afterScenarioCall(retData, null, settings);

        //Test afterScenarioCall() with ORDER_ITEMS_OUT
        System.assertNotEquals(null, db.parentRecord);
        System.assertEquals('', db.parentRecord.ovcSAP_Message__c);
        System.assertNotEquals(null, db.itemRecords);
        System.assertEquals(1, db.itemRecords.size());
        System.assertEquals('Set', db.itemRecords[0].ovcSAP_Pricing_Status__c);

        // Test onScenarioException()
        plugin.onScenarioException(new sapSalesOrderSimulate.sapSalesOrderSimulateException('a'.repeat(300)), null);
        System.assertNotEquals(null, db.parentRecord);
        System.assertEquals('a'.repeat(255), db.parentRecord.ovcSAP_Message__c);
    }
}