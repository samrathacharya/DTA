/* 
 * Generated by Overcast UTC 2021-12-08 01:23:35Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class OrderUserStatusTest {
    @istest
    private static void testOrderUserStatus() {
        OrderUserStatus actual = new OrderUserStatus();
        system.assertNotEquals(null, actual.JEST);
    }

    @istest
    private static void testJEST() {
        OrderUserStatusJEST actual = new OrderUserStatusJEST();

        actual.MANDT = 'a';
        actual.OBJNR = 'a';
        actual.STAT_x = 'a';
        actual.INACT = 'a';
        actual.CHGNR = 'a';
        actual.x_DATAAGING = Date.newInstance(2000,1,1);
        system.assertEquals('a', actual.MANDT);
        system.assertEquals('a', actual.OBJNR);
        system.assertEquals('a', actual.STAT_x);
        system.assertEquals('a', actual.INACT);
        system.assertEquals('a', actual.CHGNR);
        system.assertEquals(Date.newInstance(2000,1,1), actual.x_DATAAGING);
    }
    @istest
    private static void testrunQuery() {
        OrderUserStatus request = testSetup();
        overcast.Query query1 = new overcast.Query();
        query1.limit_x = 10;
        query1.offset = 10;
        
        OrderUserStatus response = request.runQuery(query1);
        system.assertEquals('a', response.JEST[0].MANDT);
        string requestid = request.runQueryAsync(query1, null, null, new Continuation(10));
    }

    private static OrderUserStatus testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('OrderUserStatus');
        OrderUserStatus request = new OrderUserStatus();
        OrderUserStatusJEST value1 = new OrderUserStatusJEST();
        value1.MANDT = 'a';
        request.JEST.add(value1);

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        OrderUserStatus input = new OrderUserStatus();
        OrderUserStatusJEST value1 = new OrderUserStatusJEST();
        value1.MANDT = 'a';
        input.JEST.add(value1);
        OrderUserStatus actual = (OrderUserStatus)JSON.deserialize(input.serialize(), OrderUserStatus.class);
        system.assertEquals('a', actual.JEST[0].MANDT);
    }

    @istest
    private static void testDeserialize() {
        OrderUserStatus output = new OrderUserStatus();
        OrderUserStatusJEST value1 = new OrderUserStatusJEST();
        value1.MANDT = 'a';
        output.JEST.add(value1);

        string s = output.serialize();
        OrderUserStatus actual = OrderUserStatus.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.JEST[0].MANDT);
    }

    @istest
    private static void testDeserializeError() {
        try {
            OrderUserStatus actual = OrderUserStatus.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (OrderUserStatus.OrderUserStatusException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        OrderUserStatus output = new OrderUserStatus();
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
        OrderUserStatus output = new OrderUserStatus();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        OrderUserStatus output2 = new OrderUserStatus();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        OrderUserStatus output = new OrderUserStatus();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('JEST'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('JEST', first.name);
    }

    
    @isTest
    static void testRunInvocableMethod() {
        overcast__Scenario__c scenario = overcast.TestingUtilities.setupTestEnvironment('OrderUserStatus');
        overcast__Run__c run = new overcast__Run__c(overcast__Scenario__c = scenario.Id, overcast__Mode__c = 'Run', overcast__Operation__c = 'Read', overcast__Input__c = 'X', overcast__Manual__c = true);
        insert run;
        OrderUserStatus.Parameters params = new OrderUserStatus.Parameters();
        params.flowInterviewGuid = 'X';
        params.query = new overcast.Query();
        params.Logger = null;
        params.doNotCommitLogs = false;
        params.testResponse = '{"output": ' + JSON.serialize(new OrderUserStatus()) + '}';
        List<OrderUserStatus.Parameters> paramList = new List<OrderUserStatus.Parameters>{ params };

        Test.startTest();
        List<OrderUserStatus.Result> results = OrderUserStatus.runInvocableMethod(paramList);
        Test.stopTest();

        System.assertEquals(1, results.size());
    }
}