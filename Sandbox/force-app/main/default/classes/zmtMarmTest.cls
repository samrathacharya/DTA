/* 
 * Generated by Overcast UTC 2021-11-19 02:57:31Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class zmtMarmTest {
    @istest
    private static void testzmtMarm() {
        zmtMarm actual = new zmtMarm();
        system.assertNotEquals(null, actual.MARM);
    }

    @istest
    private static void testMARM() {
        zmtMarm.MARM actual = new zmtMarm.MARM('a','a','a',0,0);

        system.assertEquals('a', actual.MANDT);
        system.assertEquals('a', actual.MATNR);
        system.assertEquals('a', actual.MEINH);
        system.assertEquals(0, actual.UMREZ);
        system.assertEquals(0, actual.UMREN);

        zmtMarm.MARM actual0 = new zmtMarm.MARM();
    }
    @istest
    private static void testrunQuery() {
        zmtMarm request = testSetup();
        overcast.Query query1 = new overcast.Query();
        query1.limit_x = 10;
        query1.offset = 10;
        
        zmtMarm response = request.runQuery(query1);
        system.assertEquals('a', response.MARM[0].MANDT);
        string requestid = request.runQueryAsync(query1, null, null, new Continuation(10));
    }

    private static zmtMarm testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('zmtMarm');
        zmtMarm request = new zmtMarm();
        zmtMarm.MARM value1 = new zmtMarm.MARM();
        value1.MANDT = 'a';
        request.MARM.add(value1);

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        zmtMarm input = new zmtMarm();
        zmtMarm.MARM value1 = new zmtMarm.MARM();
        value1.MANDT = 'a';
        input.MARM.add(value1);
        zmtMarm actual = (zmtMarm)JSON.deserialize(input.serialize(), zmtMarm.class);
        system.assertEquals('a', actual.MARM[0].MANDT);
    }

    @istest
    private static void testDeserialize() {
        zmtMarm output = new zmtMarm();
        zmtMarm.MARM value1 = new zmtMarm.MARM();
        value1.MANDT = 'a';
        output.MARM.add(value1);

        string s = output.serialize();
        zmtMarm actual = zmtMarm.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.MARM[0].MANDT);
    }

    @istest
    private static void testDeserializeError() {
        try {
            zmtMarm actual = zmtMarm.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (zmtMarm.zmtMarmException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        zmtMarm output = new zmtMarm();
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
        zmtMarm output = new zmtMarm();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        zmtMarm output2 = new zmtMarm();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        zmtMarm output = new zmtMarm();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('MARM'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('MARM', first.name);
    }

}