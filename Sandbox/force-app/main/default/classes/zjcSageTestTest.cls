/* 
 * Generated by Overcast UTC 2021-11-22 06:40:36Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class zjcSageTestTest {
    @istest
    private static void testzjcSageTest() {
        zjcSageTest actual = new zjcSageTest();
        system.assertNotEquals(null, actual.ZCRM_GET_EMPLOYEE_ABSENCE);
        system.assertNotEquals(null, actual.E_TAB_LEAVE);
    }

    @istest
    private static void testZCRM_GET_EMPLOYEE_ABSENCE() {
        zjcSageTest.ZCRM_GET_EMPLOYEE_ABSENCE actual = new zjcSageTest.ZCRM_GET_EMPLOYEE_ABSENCE('a');

        system.assertEquals('a', actual.E_LOG_EMAIL);

        zjcSageTest.ZCRM_GET_EMPLOYEE_ABSENCE actual0 = new zjcSageTest.ZCRM_GET_EMPLOYEE_ABSENCE();
    }
    @istest
    private static void testE_TAB_LEAVE() {
        zjcSageTest.E_TAB_LEAVE actual = new zjcSageTest.E_TAB_LEAVE('a',Date.newInstance(2000,1,1),Date.newInstance(2000,1,1),'a');

        system.assertEquals('a', actual.ESS_NUMBER);
        system.assertEquals(Date.newInstance(2000,1,1), actual.LEAVE_START);
        system.assertEquals(Date.newInstance(2000,1,1), actual.LEAVE_END);
        system.assertEquals('a', actual.LEAVE_TYPE);

        zjcSageTest.E_TAB_LEAVE actual0 = new zjcSageTest.E_TAB_LEAVE();
    }

    @istest
    private static void testRun() {
        zjcSageTest request = testSetup();
        zjcSageTest response = request.run();
        system.assertEquals('a', response.ZCRM_GET_EMPLOYEE_ABSENCE.E_LOG_EMAIL);
        string requestid = request.runAsync(null, null, new Continuation(10));
    }

    private static zjcSageTest testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('zjcSageTest');
        zjcSageTest request = new zjcSageTest();
        request.ZCRM_GET_EMPLOYEE_ABSENCE.E_LOG_EMAIL = 'a';

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        zjcSageTest input = new zjcSageTest();
        input.ZCRM_GET_EMPLOYEE_ABSENCE.E_LOG_EMAIL = 'a';
        zjcSageTest actual = (zjcSageTest)JSON.deserialize(input.serialize(), zjcSageTest.class);
        system.assertEquals('a', actual.ZCRM_GET_EMPLOYEE_ABSENCE.E_LOG_EMAIL);
    }

    @istest
    private static void testDeserialize() {
        zjcSageTest output = new zjcSageTest();
        output.ZCRM_GET_EMPLOYEE_ABSENCE.E_LOG_EMAIL = 'a';

        string s = output.serialize();
        zjcSageTest actual = zjcSageTest.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.ZCRM_GET_EMPLOYEE_ABSENCE.E_LOG_EMAIL);
    }

    @istest
    private static void testDeserializeError() {
        try {
            zjcSageTest actual = zjcSageTest.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (zjcSageTest.zjcSageTestException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        zjcSageTest output = new zjcSageTest();
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
        zjcSageTest output = new zjcSageTest();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        zjcSageTest output2 = new zjcSageTest();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        zjcSageTest output = new zjcSageTest();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('ZCRM_GET_EMPLOYEE_ABSENCE'));
        system.assert(keys.contains('E_TAB_LEAVE'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('ZCRM_GET_EMPLOYEE_ABSENCE', first.name);
    }

}