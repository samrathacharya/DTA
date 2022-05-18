/* 
 * Generated by Overcast UTC 2022-01-31 07:40:12Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class PostalCodeTransportZoneRTTest {
    @istest
    private static void testPostalCodeTransportZoneRT() {
        PostalCodeTransportZoneRT actual = new PostalCodeTransportZoneRT();
        system.assertNotEquals(null, actual.ZSD_GET_TRANSPORT_ZONE);
        system.assertNotEquals(null, actual.ES_RETURN);
    }

    @istest
    private static void testZSD_GET_TRANSPORT_ZONE() {
        PostalCodeTransportZoneRT.ZSD_GET_TRANSPORT_ZONE actual = new PostalCodeTransportZoneRT.ZSD_GET_TRANSPORT_ZONE('a','a','a');

        system.assertEquals('a', actual.EV_LZONE);
        system.assertEquals('a', actual.IV_CTRY);
        system.assertEquals('a', actual.IV_POST_CODE);

        PostalCodeTransportZoneRT.ZSD_GET_TRANSPORT_ZONE actual0 = new PostalCodeTransportZoneRT.ZSD_GET_TRANSPORT_ZONE();
    }
    @istest
    private static void testES_RETURN() {
        PostalCodeTransportZoneRT.ES_RETURN actual = new PostalCodeTransportZoneRT.ES_RETURN('a','a','a','a','a','a','a','a','a','a','a',0,'a','a');

        system.assertEquals('a', actual.TYPE_x);
        system.assertEquals('a', actual.ID);
        system.assertEquals('a', actual.NUMBER_x);
        system.assertEquals('a', actual.MESSAGE);
        system.assertEquals('a', actual.LOG_NO);
        system.assertEquals('a', actual.LOG_MSG_NO);
        system.assertEquals('a', actual.MESSAGE_V1);
        system.assertEquals('a', actual.MESSAGE_V2);
        system.assertEquals('a', actual.MESSAGE_V3);
        system.assertEquals('a', actual.MESSAGE_V4);
        system.assertEquals('a', actual.PARAMETER);
        system.assertEquals(0, actual.ROW);
        system.assertEquals('a', actual.FIELD);
        system.assertEquals('a', actual.SYSTEM_x);

        PostalCodeTransportZoneRT.ES_RETURN actual0 = new PostalCodeTransportZoneRT.ES_RETURN();
    }

    @istest
    private static void testRun() {
        PostalCodeTransportZoneRT request = testSetup();
        PostalCodeTransportZoneRT response = request.run();
        system.assertEquals('a', response.ZSD_GET_TRANSPORT_ZONE.EV_LZONE);
        string requestid = request.runAsync(null, null, new Continuation(10));
    }

    private static PostalCodeTransportZoneRT testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('PostalCodeTransportZoneRT');
        PostalCodeTransportZoneRT request = new PostalCodeTransportZoneRT();
        request.ZSD_GET_TRANSPORT_ZONE.EV_LZONE = 'a';

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        PostalCodeTransportZoneRT input = new PostalCodeTransportZoneRT();
        input.ZSD_GET_TRANSPORT_ZONE.EV_LZONE = 'a';
        PostalCodeTransportZoneRT actual = (PostalCodeTransportZoneRT)JSON.deserialize(input.serialize(), PostalCodeTransportZoneRT.class);
        system.assertEquals('a', actual.ZSD_GET_TRANSPORT_ZONE.EV_LZONE);
    }

    @istest
    private static void testDeserialize() {
        PostalCodeTransportZoneRT output = new PostalCodeTransportZoneRT();
        output.ZSD_GET_TRANSPORT_ZONE.EV_LZONE = 'a';

        string s = output.serialize();
        PostalCodeTransportZoneRT actual = PostalCodeTransportZoneRT.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.ZSD_GET_TRANSPORT_ZONE.EV_LZONE);
    }

    @istest
    private static void testDeserializeError() {
        try {
            PostalCodeTransportZoneRT actual = PostalCodeTransportZoneRT.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (PostalCodeTransportZoneRT.PostalCodeTransportZoneRTException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        PostalCodeTransportZoneRT output = new PostalCodeTransportZoneRT();
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
        PostalCodeTransportZoneRT output = new PostalCodeTransportZoneRT();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        PostalCodeTransportZoneRT output2 = new PostalCodeTransportZoneRT();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        PostalCodeTransportZoneRT output = new PostalCodeTransportZoneRT();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('ZSD_GET_TRANSPORT_ZONE'));
        system.assert(keys.contains('ES_RETURN'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('ZSD_GET_TRANSPORT_ZONE', first.name);
    }

}