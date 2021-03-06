/* 
 * Generated by Overcast UTC 2022-01-27 05:51:04Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class sapInvoiceListTest {
    @istest
    private static void testsapInvoiceList() {
        sapInvoiceList actual = new sapInvoiceList();
        system.assertNotEquals(null, actual.BAPI_WEBINVOICE_GETLIST);
        system.assertNotEquals(null, actual.RETURN_x);
        system.assertNotEquals(null, actual.WEBINVOICEDOCUMENTLIST);
    }

    @istest
    private static void testBAPI_WEBINVOICE_GETLIST() {
        sapInvoiceList.BAPI_WEBINVOICE_GETLIST actual = new sapInvoiceList.BAPI_WEBINVOICE_GETLIST('a','a','a',Date.newInstance(2000,1,1),Date.newInstance(2000,1,1),'a',0,'a','a','a','a');

        system.assertEquals('a', actual.BILLINGDOC_FROM);
        system.assertEquals('a', actual.BILLINGDOC_TO);
        system.assertEquals('a', actual.COMPANYCODE);
        system.assertEquals(Date.newInstance(2000,1,1), actual.DATE_FROM);
        system.assertEquals(Date.newInstance(2000,1,1), actual.DATE_TO);
        system.assertEquals('a', actual.LANGU);
        system.assertEquals(0, actual.MAXROWS);
        system.assertEquals('a', actual.PARTNER_NUMBER);
        system.assertEquals('a', actual.PARTNER_ROLE);
        system.assertEquals('a', actual.REFDOC_FROM);
        system.assertEquals('a', actual.REFDOC_TO);

        sapInvoiceList.BAPI_WEBINVOICE_GETLIST actual0 = new sapInvoiceList.BAPI_WEBINVOICE_GETLIST();
    }
    @istest
    private static void testRETURN_x() {
        sapInvoiceList.RETURN_x actual = new sapInvoiceList.RETURN_x('a','a','a','a','a','a','a','a','a','a','a',0,'a','a');

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

        sapInvoiceList.RETURN_x actual0 = new sapInvoiceList.RETURN_x();
    }
    @istest
    private static void testWEBINVOICEDOCUMENTLIST() {
        sapInvoiceList.WEBINVOICEDOCUMENTLIST actual = new sapInvoiceList.WEBINVOICEDOCUMENTLIST('a','a','a','a','a','a','a','a','a',0,'a','a',0,'a',Date.newInstance(2000,1,1),'a','a','a','a','a','a','a','a',Date.newInstance(2000,1,1),Date.newInstance(2000,1,1),Date.newInstance(2000,1,1),Date.newInstance(2000,1,1),0,0,'a','a','a');

        actual.SD_DOC_CAT_LONG = 'a';
        actual.INCOTERMSV_TEXT = 'a';
        system.assertEquals('a', actual.BILLINGDOC);
        system.assertEquals('a', actual.BILL_TYPE);
        system.assertEquals('a', actual.BILL_TYPE_TEXT);
        system.assertEquals('a', actual.BILLCATEG);
        system.assertEquals('a', actual.BILLCATEG_TEXT);
        system.assertEquals('a', actual.SD_DOC_CAT);
        system.assertEquals('a', actual.SD_DOC_CAT_TEXT);
        system.assertEquals('a', actual.CURRENCY_x);
        system.assertEquals('a', actual.CURRENCY_ISO);
        system.assertEquals(0, actual.NET_VALUE);
        system.assertEquals('a', actual.SOLD_TO);
        system.assertEquals('a', actual.PAYER);
        system.assertEquals(0, actual.TAX_AMOUNT);
        system.assertEquals('a', actual.CANCELLED);
        system.assertEquals(Date.newInstance(2000,1,1), actual.BILL_DATE);
        system.assertEquals('a', actual.INCOTERMS1);
        system.assertEquals('a', actual.INCOTERMS1_TEXT);
        system.assertEquals('a', actual.INCOTERMS2);
        system.assertEquals('a', actual.PMNTTRMS);
        system.assertEquals('a', actual.PMNTTRMS_TEXT);
        system.assertEquals('a', actual.COMP_CODE);
        system.assertEquals('a', actual.COMP_NAME);
        system.assertEquals('a', actual.REFERENCE);
        system.assertEquals(Date.newInstance(2000,1,1), actual.BLINE_DATE);
        system.assertEquals(Date.newInstance(2000,1,1), actual.DSCT_DATE1);
        system.assertEquals(Date.newInstance(2000,1,1), actual.DSCT_DATE2);
        system.assertEquals(Date.newInstance(2000,1,1), actual.NET_DATE);
        system.assertEquals(0, actual.DSCT_PCT1);
        system.assertEquals(0, actual.DSCT_PCT2);
        system.assertEquals('a', actual.INCOTERMSV);
        system.assertEquals('a', actual.INCOTERMS2L);
        system.assertEquals('a', actual.INCOTERMS3L);
        system.assertEquals('a', actual.SD_DOC_CAT_LONG);
        system.assertEquals('a', actual.INCOTERMSV_TEXT);

        sapInvoiceList.WEBINVOICEDOCUMENTLIST actual0 = new sapInvoiceList.WEBINVOICEDOCUMENTLIST();
    }

    @istest
    private static void testRun() {
        sapInvoiceList request = testSetup();
        sapInvoiceList response = request.run();
        system.assertEquals('a', response.BAPI_WEBINVOICE_GETLIST.BILLINGDOC_FROM);
        string requestid = request.runAsync(null, null, new Continuation(10));
    }

    private static sapInvoiceList testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('sapInvoiceList');
        sapInvoiceList request = new sapInvoiceList();
        request.BAPI_WEBINVOICE_GETLIST.BILLINGDOC_FROM = 'a';

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        sapInvoiceList input = new sapInvoiceList();
        input.BAPI_WEBINVOICE_GETLIST.BILLINGDOC_FROM = 'a';
        sapInvoiceList actual = (sapInvoiceList)JSON.deserialize(input.serialize(), sapInvoiceList.class);
        system.assertEquals('a', actual.BAPI_WEBINVOICE_GETLIST.BILLINGDOC_FROM);
    }

    @istest
    private static void testDeserialize() {
        sapInvoiceList output = new sapInvoiceList();
        output.BAPI_WEBINVOICE_GETLIST.BILLINGDOC_FROM = 'a';

        string s = output.serialize();
        sapInvoiceList actual = sapInvoiceList.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.BAPI_WEBINVOICE_GETLIST.BILLINGDOC_FROM);
    }

    @istest
    private static void testDeserializeError() {
        try {
            sapInvoiceList actual = sapInvoiceList.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (sapInvoiceList.sapInvoiceListException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        sapInvoiceList output = new sapInvoiceList();
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
        sapInvoiceList output = new sapInvoiceList();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        sapInvoiceList output2 = new sapInvoiceList();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        sapInvoiceList output = new sapInvoiceList();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('BAPI_WEBINVOICE_GETLIST'));
        system.assert(keys.contains('RETURN_x'));
        system.assert(keys.contains('WEBINVOICEDOCUMENTLIST'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('BAPI_WEBINVOICE_GETLIST', first.name);
    }

}