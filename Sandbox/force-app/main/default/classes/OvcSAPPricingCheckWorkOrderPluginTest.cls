/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
private class OvcSAPPricingCheckWorkOrderPluginTest {
    static final String WORKORDER_ID = '0WO1s000000UNzhGAG';
    static final String WORKORDERITEM_ID = '1WL1s000000P3ohGAC';
    private class DatabaseAccess implements OvcSAPPricingCheckWorkOrderPlugin.IDatabaseAccess {
        WorkOrder parentRecord;
        List<WorkOrderLineItem> itemRecords;
        Boolean parentRecordIsNull = false;

        public List<WorkOrderLineItem> getWorkOrderLineItems(set<Id> lineItemIds) {
            return new List<WorkOrderLineItem>{ new WorkOrderLineItem(Id = WORKORDERITEM_ID) };
        }

        public void updateWorkOrderLineItem(List<WorkOrderLineItem> wkOrderLineItems) {
            this.itemRecords = wkOrderLineItems;
        }

        public WorkOrder getWorkOrder(Id wkOrderId) {
            return parentRecordIsNull ? null : new WorkOrder(Id = WORKORDER_ID);
        }

        public void updateWorkOrder(WorkOrder wkOrder) {
            this.parentRecord = wkOrder;
        }
    }

    @isTest
    static void assertAfterReferenceValuesLoadedThrowsNoException() {
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        try {
            plugin.afterReferenceValuesLoaded(null, null, null);
            plugin.afterReferenceValuesLoaded(null, null, null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false, 'AfterReferenceValuesLoaded threw an exception when called with null');
        }
    }

    @isTest
    static void assertRecordIdIsSetAfterComponentMetadataLoaded() {
        Id recordId = Id.valueOf(WORKORDER_ID);
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.afterComponentMetadataLoaded(recordId, null);
        System.assertEquals(recordId, plugin.recordId);
    }

    @isTest
    static void assertAutoApplyPricesIsSetBeforeScenarioCall() {
        Map<String, Object> settings = new Map<String, Object>{ 'ItemSource' => 'custom', 'AutoApplyPrices' => null };
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.beforeScenarioCall(null, new Map<String, Object>(), new Map<String, Object>(), settings);
        System.assert(!plugin.autoApplyPrices);

        settings.put('AutoApplyPrices', 'true');
        plugin.beforeScenarioCall(null, new Map<String, Object>(), new Map<String, Object>(), settings);
        System.assert(plugin.autoApplyPrices);
    }

    @isTest
    static void assertItemDataIsSavedBeforeScenarioCall() {
        Map<String, Object> settings = new Map<String, Object>{ 'ItemSource' => 'custom' };
        List<Map<String, Object>> itemsIn = new List<Map<String, Object>>();
        for (Integer i = 1; i <= 3; i++) {
            itemsIn.add(new Map<String, Object>{ 'ITM_NUMBER' => String.valueOf(i), 'ovc_ID_FIELD' => '0WO1s000000UNzhGAG' });
        }
        Map<String, Object> refFieldVals = new Map<String, Object>{ 'ORDER_ITEMS_IN' => itemsIn };
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.beforeScenarioCall(null, refFieldVals, new Map<String, Object>(), settings);
        System.assertEquals(3, plugin.itemMap.size());
    }

    static DatabaseAccess setTestInterfaceClass() {
        DatabaseAccess db = new DatabaseAccess();
        OvcSAPPricingCheckWorkOrderPlugin.databaseAccess = db;
        return db;
    }

    @isTest
    static void assertNoRecordsAffectedAfterCallForNoAutoApplyPrices() {
        DatabaseAccess db = setTestInterfaceClass();
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.afterScenarioCall(new Map<String, Object>(), null, new Map<String, Object>());
        System.assert(!plugin.autoApplyPrices);
        System.assertEquals(null, db.parentRecord);
        System.assertEquals(null, db.itemRecords);
    }

    @isTest
    static void assertErrorDataIsSetInRecordsforNoItemsOut() {
        DatabaseAccess db = setTestInterfaceClass();
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.autoApplyPrices = true;
        plugin.itemMap = new Map<String, Id>{ '001000' => WORKORDERITEM_ID };
        plugin.recordId = WORKORDER_ID;
        Map<String, Object> retData = new Map<String, Object>{ 'RETURN_x' => new Map<String, Object>{ 'MESSAGE' => 'Error' } };
        plugin.afterScenarioCall(retData, null, new Map<String, Object>());
        System.assertEquals('Error', db.parentRecord?.ovcSAP_Message__c);
        System.assertNotEquals(null, db.itemRecords);
        System.assertEquals(1, db.itemRecords.size());
        System.assertEquals('Error', db.itemRecords[0].ovcSAP_Pricing_Status__c);
    }

    @isTest
    static void assertPricingDataIsSetInRecordsforItemsOut() {
        DatabaseAccess db = setTestInterfaceClass();
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.autoApplyPrices = true;
        plugin.itemMap = new Map<String, Id>{ '001000' => WORKORDERITEM_ID };
        plugin.recordId = WORKORDER_ID;
        List<Object> itemsOut = new List<Object>{
            new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'TARGET_QTY' => 1, 'NET_VALUE1' => 55, 'TX_DOC_CUR' => 5.5 }
        };
        Map<String, Object> retData = new Map<String, Object>{
            'RETURN_x' => new Map<String, Object>{ 'MESSAGE' => null },
            'ORDER_ITEMS_OUT' => itemsOut
        };
        plugin.afterScenarioCall(retData, null, new Map<String, Object>());
        System.assertNotEquals(null, db.parentRecord);
        System.assert(String.isBlank(db.parentRecord?.ovcSAP_Message__c));
        System.assertNotEquals(null, db.itemRecords);
        System.assertEquals(1, db.itemRecords.size());
        System.assertEquals('Set', db.itemRecords[0].ovcSAP_Pricing_Status__c);
        System.assertEquals(55, db.itemRecords[0].UnitPrice);
        System.assertEquals(5.5, db.itemRecords[0].ovcSAP_Tax__c);
    }

    @isTest
    static void assertNoRecordsAffectedOnScenarioExceptionForNoAutoApplyPrices() {
        DatabaseAccess db = setTestInterfaceClass();
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.onScenarioException(new sapSalesOrderSimulate.sapSalesOrderSimulateException('Error'), null);
        System.assertEquals(null, db.parentRecord);
    }

    @isTest
    static void assertNoMessageIsSavedOnScenarioExceptionForNullRecord() {
        DatabaseAccess db = new DatabaseAccess();
        db.parentRecordIsNull = true;
        OvcSAPPricingCheckWorkOrderPlugin.databaseAccess = db;
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.autoApplyPrices = true;
        plugin.onScenarioException(new sapSalesOrderSimulate.sapSalesOrderSimulateException('Error'), null);
        System.assertEquals(null, db.parentRecord);
    }

    @isTest
    static void assertTruncatedMessageIsSavedOnScenarioException() {
        DatabaseAccess db = setTestInterfaceClass();
        OvcSAPPricingCheckWorkOrderPlugin plugin = new OvcSAPPricingCheckWorkOrderPlugin();
        plugin.autoApplyPrices = true;
        plugin.onScenarioException(new sapSalesOrderSimulate.sapSalesOrderSimulateException('a'.repeat(300)), null);
        System.assertNotEquals(null, db.parentRecord);
        System.assertEquals('a'.repeat(255), db.parentRecord.ovcSAP_Message__c);
    }

    @isTest
    static void assertNoRecordsAreReturnedFromPluginInterfaceGetMethods() {
        System.assertEquals(new List<WorkOrderLineItem>(), OvcSAPPricingCheckWorkOrderPlugin.databaseAccess.getWorkOrderLineItems(null));
        System.assertEquals(null, OvcSAPPricingCheckWorkOrderPlugin.databaseAccess.getWorkOrder(null));
    }
}