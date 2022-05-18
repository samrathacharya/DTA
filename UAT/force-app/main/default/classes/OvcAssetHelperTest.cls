/*
 * Copyright © 2019 Vigience Co., Ltd. All Rights Reserved
 *
 * SAP Asset Replication Utility TEST
 */
@istest
public class OvcAssetHelperTest {
    @istest
    private static void testGetPartnerMap() {
        Account acc = new Account(Name = 'test Accout');
        insert acc;

        String objNumber = '123456';
        ovcSapPMPartner__c pmpartner = new ovcSapPMPartner__c();
        pmpartner.ovcObjectNumber__c = objNumber;
        pmpartner.ovcPartnerFunction__c = 'WE';
        pmpartner.ovcAccount__c = acc.Id;
        insert pmpartner;

        Set<String> objectKeys = new Set<String>();
        objectKeys.add(objNumber);

        Map<String, Id> objMap = OvcAssetHelper.getPartnerMap(objectKeys, null);

        System.assertEquals(acc.Id, objMap.get(objNumber));
    }

    @istest
    private static void testGetAssetMap() {
        Account acc = new Account(Name = 'test Accout');
        insert acc;

        String objNumber = '123456';
        Asset ass = new Asset(Name = 'test Asset', ovcSapNumber__c = objNumber, AccountId = acc.Id, SerialNumber = 'XYZ123');
        insert ass;

        Set<String> objectKeys = new Set<String>();
        objectKeys.add(objNumber);

        Map<String, Asset> assMap = OvcAssetHelper.getAssetMap(objectKeys);

        Asset assval = assMap.get(objNumber);
        System.assertEquals(ass.Id, assval.Id);
    }

    @istest
    private static void testExecuteScenarioQueue() {
        string scenarioName = 'sapCustomerReplication';
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment(scenarioName);
        boolean isSuccess;
        overcast.EpgwWebServices.Operation ope;

        Test.startTest();
        try {
            OvcAssetHelper.ExecuteScenarioQueue request = new OvcAssetHelper.ExecuteScenarioQueue(scenarioName, 'testInput');
            request.execute(null);
            isSuccess = true;
            ope = request.operation;
        } catch (Exception e) {
            isSuccess = false;
        }
        Test.stopTest();

        System.assertEquals(true, isSuccess);
        System.assertEquals(overcast.EpgwWebServices.Operation.EpgwRead, ope);
    }

    @istest
    private static void testExecuteScenarioQueue2() {
        string scenarioName = 'sapCustomerReplication';
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment(scenarioName);
        boolean isSuccess;
        overcast.EpgwWebServices.Operation ope;

        Test.startTest();
        try {
            OvcAssetHelper.ExecuteScenarioQueue request = new OvcAssetHelper.ExecuteScenarioQueue(
                scenarioName,
                'testInput',
                overcast.EpgwWebServices.Operation.EpgwCreate
            );
            request.execute(null);
            isSuccess = true;
            ope = request.operation;
        } catch (Exception e) {
            isSuccess = false;
        }
        Test.stopTest();

        System.assertEquals(true, isSuccess);
        System.assertEquals(overcast.EpgwWebServices.Operation.EpgwCreate, ope);
    }
}