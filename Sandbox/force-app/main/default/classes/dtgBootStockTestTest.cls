/* 
 * Generated by Overcast UTC 2022-02-09 06:25:50Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class dtgBootStockTestTest {
    @istest
    private static void testdtgBootStockTest() {
        dtgBootStockTest actual = new dtgBootStockTest();
        system.assertNotEquals(null, actual.A_MatlStkInAcctMod);
    }

    @istest
    private static void testA_MatlStkInAcctMod() {
        dtgBootStockTestA_MatlStkInAcctMod actual = new dtgBootStockTestA_MatlStkInAcctMod();

        actual.Material = 'a';
        actual.Plant = 'a';
        actual.StorageLocation = 'a';
        actual.Batch = 'a';
        actual.Supplier = 'a';
        actual.Customer = 'a';
        actual.WBSElementInternalID = 'a';
        actual.SDDocument = 'a';
        actual.SDDocumentItem = 'a';
        actual.InventorySpecialStockType = 'a';
        actual.InventoryStockType = 'a';
        actual.MaterialBaseUnit = 'a';
        actual.MatlWrhsStkQtyInMatlBaseUnit = 0;
        system.assertEquals('a', actual.Material);
        system.assertEquals('a', actual.Plant);
        system.assertEquals('a', actual.StorageLocation);
        system.assertEquals('a', actual.Batch);
        system.assertEquals('a', actual.Supplier);
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.WBSElementInternalID);
        system.assertEquals('a', actual.SDDocument);
        system.assertEquals('a', actual.SDDocumentItem);
        system.assertEquals('a', actual.InventorySpecialStockType);
        system.assertEquals('a', actual.InventoryStockType);
        system.assertEquals('a', actual.MaterialBaseUnit);
        system.assertEquals(0, actual.MatlWrhsStkQtyInMatlBaseUnit);
    }
    @istest
    private static void testrunQuery() {
        dtgBootStockTest request = testSetup();
        overcast.Query query1 = new overcast.Query();
        query1.limit_x = 10;
        query1.offset = 10;
        
        dtgBootStockTest response = request.runQuery(query1);
        system.assertEquals('a', response.A_MatlStkInAcctMod[0].Material);
        string requestid = request.runQueryAsync(query1, null, null, new Continuation(10));
    }

    @istest
    private static void testrunInsert() {
        dtgBootStockTest request = testSetup();
        dtgBootStockTest response = request.runInsert();
        system.assertEquals('a', response.A_MatlStkInAcctMod[0].Material);
        string requestid = request.runInsertAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunUpdate() {
        dtgBootStockTest request = testSetup();
        dtgBootStockTest response = request.runUpdate();
        system.assertEquals('a', response.A_MatlStkInAcctMod[0].Material);
        string requestid = request.runUpdateAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunDelete() {
        dtgBootStockTest request = testSetup();
        dtgBootStockTest response = request.runDelete();
        system.assertEquals('a', response.A_MatlStkInAcctMod[0].Material);
        string requestid = request.runDeleteAsync(null, null, new Continuation(10));
    }

    private static dtgBootStockTest testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('dtgBootStockTest');
        dtgBootStockTest request = new dtgBootStockTest();
        dtgBootStockTestA_MatlStkInAcctMod value1 = new dtgBootStockTestA_MatlStkInAcctMod();
        value1.Material = 'a';
        request.A_MatlStkInAcctMod.add(value1);

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        dtgBootStockTest input = new dtgBootStockTest();
        dtgBootStockTestA_MatlStkInAcctMod value1 = new dtgBootStockTestA_MatlStkInAcctMod();
        value1.Material = 'a';
        input.A_MatlStkInAcctMod.add(value1);
        dtgBootStockTest actual = (dtgBootStockTest)JSON.deserialize(input.serialize(), dtgBootStockTest.class);
        system.assertEquals('a', actual.A_MatlStkInAcctMod[0].Material);
    }

    @istest
    private static void testDeserialize() {
        dtgBootStockTest output = new dtgBootStockTest();
        dtgBootStockTestA_MatlStkInAcctMod value1 = new dtgBootStockTestA_MatlStkInAcctMod();
        value1.Material = 'a';
        output.A_MatlStkInAcctMod.add(value1);

        string s = output.serialize();
        dtgBootStockTest actual = dtgBootStockTest.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.A_MatlStkInAcctMod[0].Material);
    }

    @istest
    private static void testDeserializeError() {
        try {
            dtgBootStockTest actual = dtgBootStockTest.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (dtgBootStockTest.dtgBootStockTestException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        dtgBootStockTest output = new dtgBootStockTest();
        output.set('SAMPLE1', new map<string, object>{
            'FIELD1' => 'VALUE1'
        });
        
        system.assertEquals(null, output.get('NOVAL'));
        
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));		
    }
    
    @istest
    private static void testLoadAsyncResponse() {
        dtgBootStockTest output = new dtgBootStockTest();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        dtgBootStockTest output2 = new dtgBootStockTest();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        dtgBootStockTest output = new dtgBootStockTest();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('A_MatlStkInAcctMod'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('A_MatlStkInAcctMod', first.name);
    }

    
    @isTest
    static void testRunInvocableMethod() {
        overcast__Scenario__c scenario = overcast.TestingUtilities.setupTestEnvironment('dtgBootStockTest');
        overcast__Run__c run = new overcast__Run__c(overcast__Scenario__c = scenario.Id, overcast__Mode__c = 'Run', overcast__Operation__c = 'Read', overcast__Input__c = 'X', overcast__Manual__c = true);
        insert run;
        dtgBootStockTest.Parameters params = new dtgBootStockTest.Parameters();
        params.flowInterviewGuid = 'X';
        params.query = new overcast.Query();
        params.requestData = new dtgBootStockTest();
        params.operation = 'Query';
        params.Logger = null;
        params.doNotCommitLogs = false;
        params.testResponse = '{"output": ' + JSON.serialize(new dtgBootStockTest()) + '}';
        List<dtgBootStockTest.Parameters> paramList = new List<dtgBootStockTest.Parameters>{ params };

        Test.startTest();
        List<dtgBootStockTest.Result> results = dtgBootStockTest.runInvocableMethod(paramList);
        Test.stopTest();

        System.assertEquals(1, results.size());
    }
}