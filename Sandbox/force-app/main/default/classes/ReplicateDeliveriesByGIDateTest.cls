/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
public class ReplicateDeliveriesByGIDateTest {
    @isTest
    public static void TestReplicateDeliveriesSTO() {
        ReplicateDeliveriesByGIDate repDeliveries = new ReplicateDeliveriesByGIDate();
        overcast__ScheduleTask__c task = new overcast__ScheduleTask__c();
        task.overcast__scenarioInput__c = 'daily_STO';
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment('deliveryDocRep');
        task.overcast__Scenario__c = scen.Id;
        repDeliveries.run(task, null);  
        List<deliveryDocRep_IS_DLV_DATA_CONTROL__c> dlvControl = [SELECT ITEM__c from deliveryDocRep_IS_DLV_DATA_CONTROL__c where Name = 'daily_STO'];
        List<deliveryDocRep_IT_WADAT_IST__c> goodsIssue = [SELECT SIGN__c,OPTION__c from deliveryDocRep_IT_WADAT_IST__c where Name = 'daily_STO'];
        System.assert(dlvControl.size()> 0 , 'Item filter is not set');
        System.assertEquals(dlvControl[0].ITEM__c,'X', 'Filter value is not X');
        System.assertEquals(goodsIssue[0].SIGN__c,'I', 'Sign is not I');
    }
    
    @isTest
    public static void TestReplicateDeliveriesZREP() {
        ReplicateDeliveriesByGIDate repDeliveries = new ReplicateDeliveriesByGIDate();
        overcast__ScheduleTask__c task = new overcast__ScheduleTask__c();
        task.overcast__scenarioInput__c = 'daily_ZREP';
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment('deliveryDocRep');
        task.overcast__Scenario__c = scen.Id;
        repDeliveries.run(task, null);  
        List<deliveryDocRep_IS_DLV_DATA_CONTROL__c> dlvControl = [SELECT ITEM__c from deliveryDocRep_IS_DLV_DATA_CONTROL__c where Name = 'daily_ZREP'];
        List<deliveryDocRep_IT_ERDAT__c> docCreateDate = [SELECT SIGN__c,OPTION__c from deliveryDocRep_IT_ERDAT__c where Name = 'daily_ZREP'];
        System.assert(dlvControl.size()> 0 , 'Item filter is not set');
        System.assertEquals(dlvControl[0].ITEM__c,'X', 'Filter value is not X');
        System.assertEquals(docCreateDate[0].OPTION__c,'GE', 'Field is not greater or equal');
    }   
    
    @isTest
    public static void TestEmpty() {
        ReplicateDeliveriesByGIDate repDeliveries = new ReplicateDeliveriesByGIDate();
        overcast__ScheduleTask__c task = new overcast__ScheduleTask__c();
        repDeliveries.run(task, null);
        System.assert(true, 'always true');
    }
}