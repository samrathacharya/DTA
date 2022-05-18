/* 
 * Generated by Overcast UTC 2022-01-12 04:15:35Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class PriceInquiryCalculateTest {
    @istest
    private static void testPriceInquiryCalculate() {
        PriceInquiryCalculate actual = new PriceInquiryCalculate();
        system.assertNotEquals(null, actual.PIQ_CALCULATE);
        system.assertNotEquals(null, actual.ES_DESCRIPTION);
        system.assertNotEquals(null, actual.ET_CUST_COND_TYPES);
        system.assertNotEquals(null, actual.ET_CUST_PROCEDURE);
        system.assertNotEquals(null, actual.ET_MESSAGE);
        system.assertNotEquals(null, actual.ET_RESULT);
        system.assertNotEquals(null, actual.ET_RESULT_EXT);
        system.assertNotEquals(null, actual.IS_CONTROL);
        system.assertNotEquals(null, actual.IS_GLOBAL);
        system.assertNotEquals(null, actual.IT_HEAD);
        system.assertNotEquals(null, actual.IT_ITEM);
    }

    @istest
    private static void testPIQ_CALCULATE() {
        PriceInquiryCalculate.PIQ_CALCULATE actual = new PriceInquiryCalculate.PIQ_CALCULATE('a');

        system.assertEquals('a', actual.IV_CALLER_ID);

        PriceInquiryCalculate.PIQ_CALCULATE actual0 = new PriceInquiryCalculate.PIQ_CALCULATE();
    }
    @istest
    private static void testES_DESCRIPTION() {
        PriceInquiryCalculate.ES_DESCRIPTION actual = new PriceInquiryCalculate.ES_DESCRIPTION();


        PriceInquiryCalculate.ES_DESCRIPTION actual0 = new PriceInquiryCalculate.ES_DESCRIPTION();
    }
    @istest
    private static void testSTEP_DESCR() {
        PriceInquiryCalculate.STEP_DESCR actual = new PriceInquiryCalculate.STEP_DESCR('a','a','a','a','a','a');

        system.assertEquals('a', actual.SPRAS);
        system.assertEquals('a', actual.KALSM);
        system.assertEquals('a', actual.STUNR);
        system.assertEquals('a', actual.ZAEHK);
        system.assertEquals('a', actual.KSCHL);
        system.assertEquals('a', actual.VTEXT);

        PriceInquiryCalculate.STEP_DESCR actual0 = new PriceInquiryCalculate.STEP_DESCR();
    }
    @istest
    private static void testET_CUST_COND_TYPES() {
        PriceInquiryCalculate.ET_CUST_COND_TYPES actual = new PriceInquiryCalculate.ET_CUST_COND_TYPES('a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a');

        actual.KAEND_MEH = 'a';
        actual.IDXUP = 'a';
        actual.RUKOR = 'a';
        actual.BOVER = 'a';
        actual.KPRDT = 'a';
        actual.STFKZ = 'a';
        actual.PRECH = 'a';
        actual.BNKWE = 'a';
        actual.AKTKO = 'a';
        actual.VKKAL = 'a';
        actual.VKOBL = 'a';
        actual.RKAPPL = 'a';
        actual.RKSCHL = 'a';
        actual.BERGL = 'a';
        actual.VHART = 'a';
        actual.RDIFA = 'a';
        actual.KFKIV = 'a';
        actual.KVARC = 'a';
        actual.KMENG = 'a';
        actual.MDFLG = 'a';
        actual.KTREL = 'a';
        actual.BNKTK = 'a';
        actual.KFRST = 'a';
        actual.TXTGR = 'a';
        actual.TDID = 'a';
        actual.KDELE = 'a';
        actual.KBFLAG = null;
        actual.PURP = 'a';
        actual.DTASRC = 'a';
        actual.IS_CPF_ENABLED = 'a';
        actual.IS_QTYCNVFCT_ENABLED = 'a';
        actual.CCS_USAGE = 'a';
        actual.VAL_ZERO = 'a';
        actual.IS_CPE_ENABLED = 'a';
        actual.OIGRNET = 'a';
        actual.OIINVCYC = 'a';
        actual.OIREPORT = 'a';
        actual.OIHEAD = 'a';
        actual.OIITEM = 'a';
        actual.OIERRHAN = 'a';
        actual.OIDATA = 'a';
        actual.OIA_SPLTIV = 'a';
        actual.OIRCONDCL = 'a';
        actual.OIU_EP = 'a';
        actual.WTY_KONDM = 'a';
        actual.WTY_KATEG = 'a';
        system.assertEquals('a', actual.MANDT);
        system.assertEquals('a', actual.KAPPL);
        system.assertEquals('a', actual.KSCHL);
        system.assertEquals('a', actual.KRECH);
        system.assertEquals('a', actual.KZBZG);
        system.assertEquals('a', actual.KNTYP);
        system.assertEquals('a', actual.KONAU);
        system.assertEquals('a', actual.KMANU);
        system.assertEquals('a', actual.GRZGF);
        system.assertEquals('a', actual.GRLNR);
        system.assertEquals('a', actual.GRMEN);
        system.assertEquals('a', actual.GANZZ);
        system.assertEquals('a', actual.KGRPE);
        system.assertEquals('a', actual.KRELI);
        system.assertEquals('a', actual.KDUPL);
        system.assertEquals('a', actual.KRUEK);
        system.assertEquals('a', actual.KOUPD);
        system.assertEquals('a', actual.SOSTA);
        system.assertEquals('a', actual.KOFRS);
        system.assertEquals('a', actual.KALSM);
        system.assertEquals('a', actual.KZNEP);
        system.assertEquals('a', actual.KOAID);
        system.assertEquals('a', actual.KKOPF);
        system.assertEquals('a', actual.KPOSI);
        system.assertEquals('a', actual.KNEGA);
        system.assertEquals('a', actual.TXPRF);
        system.assertEquals('a', actual.KSTPR);
        system.assertEquals('a', actual.KAEND_BTR);
        system.assertEquals('a', actual.KAEND_WRT);
        system.assertEquals('a', actual.KAEND_UFK);
        system.assertEquals('a', actual.KAEND_RCH);
        system.assertEquals('a', actual.KAEND_LOE);
        system.assertEquals('a', actual.KAEND_MEH);
        system.assertEquals('a', actual.IDXUP);
        system.assertEquals('a', actual.RUKOR);
        system.assertEquals('a', actual.BOVER);
        system.assertEquals('a', actual.KPRDT);
        system.assertEquals('a', actual.STFKZ);
        system.assertEquals('a', actual.PRECH);
        system.assertEquals('a', actual.BNKWE);
        system.assertEquals('a', actual.AKTKO);
        system.assertEquals('a', actual.VKKAL);
        system.assertEquals('a', actual.VKOBL);
        system.assertEquals('a', actual.RKAPPL);
        system.assertEquals('a', actual.RKSCHL);
        system.assertEquals('a', actual.BERGL);
        system.assertEquals('a', actual.VHART);
        system.assertEquals('a', actual.RDIFA);
        system.assertEquals('a', actual.KFKIV);
        system.assertEquals('a', actual.KVARC);
        system.assertEquals('a', actual.KMENG);
        system.assertEquals('a', actual.MDFLG);
        system.assertEquals('a', actual.KTREL);
        system.assertEquals('a', actual.BNKTK);
        system.assertEquals('a', actual.KFRST);
        system.assertEquals('a', actual.TXTGR);
        system.assertEquals('a', actual.TDID);
        system.assertEquals('a', actual.KDELE);
        system.assertEquals(null, actual.KBFLAG);
        system.assertEquals('a', actual.PURP);
        system.assertEquals('a', actual.DTASRC);
        system.assertEquals('a', actual.IS_CPF_ENABLED);
        system.assertEquals('a', actual.IS_QTYCNVFCT_ENABLED);
        system.assertEquals('a', actual.CCS_USAGE);
        system.assertEquals('a', actual.VAL_ZERO);
        system.assertEquals('a', actual.IS_CPE_ENABLED);
        system.assertEquals('a', actual.OIGRNET);
        system.assertEquals('a', actual.OIINVCYC);
        system.assertEquals('a', actual.OIREPORT);
        system.assertEquals('a', actual.OIHEAD);
        system.assertEquals('a', actual.OIITEM);
        system.assertEquals('a', actual.OIERRHAN);
        system.assertEquals('a', actual.OIDATA);
        system.assertEquals('a', actual.OIA_SPLTIV);
        system.assertEquals('a', actual.OIRCONDCL);
        system.assertEquals('a', actual.OIU_EP);
        system.assertEquals('a', actual.WTY_KONDM);
        system.assertEquals('a', actual.WTY_KATEG);

        PriceInquiryCalculate.ET_CUST_COND_TYPES actual0 = new PriceInquiryCalculate.ET_CUST_COND_TYPES();
    }
    @istest
    private static void testET_CUST_PROCEDURE() {
        PriceInquiryCalculate.ET_CUST_PROCEDURE actual = new PriceInquiryCalculate.ET_CUST_PROCEDURE('a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a');

        system.assertEquals('a', actual.MANDT);
        system.assertEquals('a', actual.KVEWE);
        system.assertEquals('a', actual.KAPPL);
        system.assertEquals('a', actual.KALSM);
        system.assertEquals('a', actual.STUNR);
        system.assertEquals('a', actual.ZAEHK);
        system.assertEquals('a', actual.KSCHL);
        system.assertEquals('a', actual.STUNB);
        system.assertEquals('a', actual.STUN2);
        system.assertEquals('a', actual.KAUTO);
        system.assertEquals('a', actual.KOBED);
        system.assertEquals('a', actual.KZWIW);
        system.assertEquals('a', actual.KSTAT);
        system.assertEquals('a', actual.KOFRM);
        system.assertEquals('a', actual.KOFRA);
        system.assertEquals('a', actual.KVSL1);
        system.assertEquals('a', actual.KVSL2);
        system.assertEquals('a', actual.DRUKZ);
        system.assertEquals('a', actual.KOBLI);
        system.assertEquals('a', actual.IS_ACCT_DETN_RELEVANT);
        system.assertEquals('a', actual.x_SAPCEM_CONV_ME);

        PriceInquiryCalculate.ET_CUST_PROCEDURE actual0 = new PriceInquiryCalculate.ET_CUST_PROCEDURE();
    }
    @istest
    private static void testET_MESSAGE() {
        PriceInquiryCalculate.ET_MESSAGE actual = new PriceInquiryCalculate.ET_MESSAGE('a','a','a','a','a','a','a','a','a','a','a',0,'a','a');

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

        PriceInquiryCalculate.ET_MESSAGE actual0 = new PriceInquiryCalculate.ET_MESSAGE();
    }
    @istest
    private static void testET_RESULT() {
        PriceInquiryCalculate.ET_RESULT actual = new PriceInquiryCalculate.ET_RESULT('a','a','a','a');

        system.assertEquals('a', actual.VBELN);
        system.assertEquals('a', actual.KUNNR);
        system.assertEquals('a', actual.KALSM);
        system.assertEquals('a', actual.WAERK);

        PriceInquiryCalculate.ET_RESULT actual0 = new PriceInquiryCalculate.ET_RESULT();
    }
    @istest
    private static void testITEM() {
        PriceInquiryCalculate.ITEM actual = new PriceInquiryCalculate.ITEM('a','a','a','a','a','a',0,'a','a','a','a',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'a');

        system.assertEquals('a', actual.KPOSN);
        system.assertEquals('a', actual.MATNR);
        system.assertEquals('a', actual.VRKME);
        system.assertEquals('a', actual.PRSOK);
        system.assertEquals('a', actual.PSTYV);
        system.assertEquals('a', actual.WERKS);
        system.assertEquals(0, actual.KPEIN);
        system.assertEquals('a', actual.KMEIN);
        system.assertEquals('a', actual.GEWEI);
        system.assertEquals('a', actual.VOLEH);
        system.assertEquals('a', actual.SCALEDET_STATUS);
        system.assertEquals(0, actual.MGAME);
        system.assertEquals(0, actual.NETPR);
        system.assertEquals(0, actual.NETWR);
        system.assertEquals(0, actual.BRTWR);
        system.assertEquals(0, actual.MWSBP);
        system.assertEquals(0, actual.KZWI1);
        system.assertEquals(0, actual.KZWI2);
        system.assertEquals(0, actual.KZWI3);
        system.assertEquals(0, actual.KZWI4);
        system.assertEquals(0, actual.KZWI5);
        system.assertEquals(0, actual.KZWI6);
        system.assertEquals(0, actual.BONBA);
        system.assertEquals(0, actual.PREVA);
        system.assertEquals(0, actual.CMPRE);
        system.assertEquals(0, actual.WAVWR);
        system.assertEquals(0, actual.BRGEW);
        system.assertEquals(0, actual.NTGEW);
        system.assertEquals(0, actual.VOLUM);
        system.assertEquals('a', actual.DUMMY_PRCS_RESULT_MULTI_ITEM_E);

        PriceInquiryCalculate.ITEM actual0 = new PriceInquiryCalculate.ITEM();
    }
    @istest
    private static void testCOND() {
        PriceInquiryCalculate.COND actual = new PriceInquiryCalculate.COND('a','a','a','a',0,'a','a','a',0,0);

        system.assertEquals('a', actual.STUNR);
        system.assertEquals('a', actual.ZAEHK);
        system.assertEquals('a', actual.KSCHL);
        system.assertEquals('a', actual.WAERS);
        system.assertEquals(0, actual.KPEIN);
        system.assertEquals('a', actual.KMEIN);
        system.assertEquals('a', actual.KRECH);
        system.assertEquals('a', actual.KINAK);
        system.assertEquals(0, actual.KBETR);
        system.assertEquals(0, actual.KWERT);

        PriceInquiryCalculate.COND actual0 = new PriceInquiryCalculate.COND();
    }
    @istest
    private static void testET_RESULT_EXT() {
        PriceInquiryCalculate.ET_RESULT_EXT actual = new PriceInquiryCalculate.ET_RESULT_EXT('a','a','a','a');

        system.assertEquals('a', actual.VBELN);
        system.assertEquals('a', actual.KUNNR);
        system.assertEquals('a', actual.KALSM);
        system.assertEquals('a', actual.WAERK);

        PriceInquiryCalculate.ET_RESULT_EXT actual0 = new PriceInquiryCalculate.ET_RESULT_EXT();
    }
    @istest
    private static void testITEM2() {
        PriceInquiryCalculate.ITEM2 actual = new PriceInquiryCalculate.ITEM2('a','a','a','a','a','a',0,'a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a');

        system.assertEquals('a', actual.KPOSN);
        system.assertEquals('a', actual.MATNR);
        system.assertEquals('a', actual.VRKME);
        system.assertEquals('a', actual.PRSOK);
        system.assertEquals('a', actual.PSTYV);
        system.assertEquals('a', actual.WERKS);
        system.assertEquals(0, actual.KPEIN);
        system.assertEquals('a', actual.KMEIN);
        system.assertEquals('a', actual.GEWEI);
        system.assertEquals('a', actual.VOLEH);
        system.assertEquals('a', actual.SCALEDET_STATUS);
        system.assertEquals('a', actual.MGAME);
        system.assertEquals('a', actual.NETPR);
        system.assertEquals('a', actual.NETWR);
        system.assertEquals('a', actual.BRTWR);
        system.assertEquals('a', actual.MWSBP);
        system.assertEquals('a', actual.KZWI1);
        system.assertEquals('a', actual.KZWI2);
        system.assertEquals('a', actual.KZWI3);
        system.assertEquals('a', actual.KZWI4);
        system.assertEquals('a', actual.KZWI5);
        system.assertEquals('a', actual.KZWI6);
        system.assertEquals('a', actual.BONBA);
        system.assertEquals('a', actual.PREVA);
        system.assertEquals('a', actual.CMPRE);
        system.assertEquals('a', actual.WAVWR);
        system.assertEquals('a', actual.BRGEW);
        system.assertEquals('a', actual.NTGEW);
        system.assertEquals('a', actual.VOLUM);
        system.assertEquals('a', actual.DUMMY_PRCS_RESULT_MULTI_ITEM_E);

        PriceInquiryCalculate.ITEM2 actual0 = new PriceInquiryCalculate.ITEM2();
    }
    @istest
    private static void testCOND2() {
        PriceInquiryCalculate.COND2 actual = new PriceInquiryCalculate.COND2('a','a','a','a',0,'a','a','a','a','a');

        system.assertEquals('a', actual.STUNR);
        system.assertEquals('a', actual.ZAEHK);
        system.assertEquals('a', actual.KSCHL);
        system.assertEquals('a', actual.WAERS);
        system.assertEquals(0, actual.KPEIN);
        system.assertEquals('a', actual.KMEIN);
        system.assertEquals('a', actual.KRECH);
        system.assertEquals('a', actual.KINAK);
        system.assertEquals('a', actual.KBETR);
        system.assertEquals('a', actual.KWERT);

        PriceInquiryCalculate.COND2 actual0 = new PriceInquiryCalculate.COND2();
    }
    @istest
    private static void testIS_CONTROL() {
        PriceInquiryCalculate.IS_CONTROL actual = new PriceInquiryCalculate.IS_CONTROL('a','a','a','a','a','a','a');

        system.assertEquals('a', actual.EXTERNAL_FORMAT);
        system.assertEquals('a', actual.GROUP_PROCESSING);
        system.assertEquals('a', actual.PRICE_DETAILS);
        system.assertEquals('a', actual.KALSM_VARIANT);
        system.assertEquals('a', actual.CALC_FXD_AMNT_GRP_COND_ON_ITEM);
        system.assertEquals('a', actual.DET_CUSTOMIZING);
        system.assertEquals('a', actual.PRC_SIMULATION);

        PriceInquiryCalculate.IS_CONTROL actual0 = new PriceInquiryCalculate.IS_CONTROL();
    }
    @istest
    private static void testPRICING_CONTROL() {
        PriceInquiryCalculate.PRICING_CONTROL actual = new PriceInquiryCalculate.PRICING_CONTROL('a','a','a');

        system.assertEquals('a', actual.GET_SCALE_LEVELS);
        system.assertEquals('a', actual.MAX_SCALE_LEVELS);
        system.assertEquals('a', actual.PRIC_DETAIL_VAR);

        PriceInquiryCalculate.PRICING_CONTROL actual0 = new PriceInquiryCalculate.PRICING_CONTROL();
    }
    @istest
    private static void testIS_GLOBAL() {
        PriceInquiryCalculate.IS_GLOBAL actual = new PriceInquiryCalculate.IS_GLOBAL(Date.newInstance(2000,1,1),'a','a','a','a');

        system.assertEquals(Date.newInstance(2000,1,1), actual.PRSDT);
        system.assertEquals('a', actual.AUART);
        system.assertEquals('a', actual.VKORG);
        system.assertEquals('a', actual.VTWEG);
        system.assertEquals('a', actual.SPART);

        PriceInquiryCalculate.IS_GLOBAL actual0 = new PriceInquiryCalculate.IS_GLOBAL();
    }
    @istest
    private static void testCALLER_DATA() {
        PriceInquiryCalculate.CALLER_DATA actual = new PriceInquiryCalculate.CALLER_DATA('a','a');

        system.assertEquals('a', actual.NAME);
        system.assertEquals('a', actual.VALUE);

        PriceInquiryCalculate.CALLER_DATA actual0 = new PriceInquiryCalculate.CALLER_DATA();
    }
    @istest
    private static void testIT_HEAD() {
        PriceInquiryCalculate.IT_HEAD actual = new PriceInquiryCalculate.IT_HEAD('a','a','a');

        system.assertEquals('a', actual.VBELN);
        system.assertEquals('a', actual.KUNNR);
        system.assertEquals('a', actual.SPRAS);

        PriceInquiryCalculate.IT_HEAD actual0 = new PriceInquiryCalculate.IT_HEAD();
    }
    @istest
    private static void testCALLER_DATA2() {
        PriceInquiryCalculate.CALLER_DATA2 actual = new PriceInquiryCalculate.CALLER_DATA2('a','a');

        system.assertEquals('a', actual.NAME);
        system.assertEquals('a', actual.VALUE);

        PriceInquiryCalculate.CALLER_DATA2 actual0 = new PriceInquiryCalculate.CALLER_DATA2();
    }
    @istest
    private static void testIT_ITEM() {
        PriceInquiryCalculate.IT_ITEM actual = new PriceInquiryCalculate.IT_ITEM('a','a',0,'a');

        system.assertEquals('a', actual.KPOSN);
        system.assertEquals('a', actual.MATNR);
        system.assertEquals(0, actual.MGAME);
        system.assertEquals('a', actual.VRKME);

        PriceInquiryCalculate.IT_ITEM actual0 = new PriceInquiryCalculate.IT_ITEM();
    }
    @istest
    private static void testVARCOND() {
        PriceInquiryCalculate.VARCOND actual = new PriceInquiryCalculate.VARCOND('a',0);

        system.assertEquals('a', actual.VARCOND);
        system.assertEquals(0, actual.FACTOR);

        PriceInquiryCalculate.VARCOND actual0 = new PriceInquiryCalculate.VARCOND();
    }
    @istest
    private static void testCALLER_DATA3() {
        PriceInquiryCalculate.CALLER_DATA3 actual = new PriceInquiryCalculate.CALLER_DATA3('a','a');

        system.assertEquals('a', actual.NAME);
        system.assertEquals('a', actual.VALUE);

        PriceInquiryCalculate.CALLER_DATA3 actual0 = new PriceInquiryCalculate.CALLER_DATA3();
    }

    @istest
    private static void testRun() {
        PriceInquiryCalculate request = testSetup();
        PriceInquiryCalculate response = request.run();
        system.assertEquals('a', response.PIQ_CALCULATE.IV_CALLER_ID);
        string requestid = request.runAsync(null, null, new Continuation(10));
    }

    private static PriceInquiryCalculate testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('PriceInquiryCalculate');
        PriceInquiryCalculate request = new PriceInquiryCalculate();
        request.PIQ_CALCULATE.IV_CALLER_ID = 'a';

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        PriceInquiryCalculate input = new PriceInquiryCalculate();
        input.PIQ_CALCULATE.IV_CALLER_ID = 'a';
        PriceInquiryCalculate actual = (PriceInquiryCalculate)JSON.deserialize(input.serialize(), PriceInquiryCalculate.class);
        system.assertEquals('a', actual.PIQ_CALCULATE.IV_CALLER_ID);
    }

    @istest
    private static void testDeserialize() {
        PriceInquiryCalculate output = new PriceInquiryCalculate();
        output.PIQ_CALCULATE.IV_CALLER_ID = 'a';

        string s = output.serialize();
        PriceInquiryCalculate actual = PriceInquiryCalculate.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.PIQ_CALCULATE.IV_CALLER_ID);
    }

    @istest
    private static void testDeserializeError() {
        try {
            PriceInquiryCalculate actual = PriceInquiryCalculate.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (PriceInquiryCalculate.PriceInquiryCalculateException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        PriceInquiryCalculate output = new PriceInquiryCalculate();
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
        PriceInquiryCalculate output = new PriceInquiryCalculate();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        PriceInquiryCalculate output2 = new PriceInquiryCalculate();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        PriceInquiryCalculate output = new PriceInquiryCalculate();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('PIQ_CALCULATE'));
        system.assert(keys.contains('ES_DESCRIPTION.STEP_DESCR'));
        system.assert(keys.contains('ET_CUST_COND_TYPES'));
        system.assert(keys.contains('ET_CUST_PROCEDURE'));
        system.assert(keys.contains('ET_MESSAGE'));
        system.assert(keys.contains('ET_RESULT'));
        system.assert(keys.contains('ET_RESULT.ITEM'));
        system.assert(keys.contains('ET_RESULT.ITEM.COND'));
        system.assert(keys.contains('ET_RESULT_EXT'));
        system.assert(keys.contains('ET_RESULT_EXT.ITEM'));
        system.assert(keys.contains('ET_RESULT_EXT.ITEM.COND'));
        system.assert(keys.contains('IS_CONTROL'));
        system.assert(keys.contains('IS_CONTROL.PRICING_CONTROL'));
        system.assert(keys.contains('IS_GLOBAL'));
        system.assert(keys.contains('IS_GLOBAL.CALLER_DATA'));
        system.assert(keys.contains('IT_HEAD'));
        system.assert(keys.contains('IT_HEAD.CALLER_DATA'));
        system.assert(keys.contains('IT_ITEM'));
        system.assert(keys.contains('IT_ITEM.VARCOND'));
        system.assert(keys.contains('IT_ITEM.CALLER_DATA'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('PIQ_CALCULATE', first.name);
        output.set('@prop1', 'a');
        output.set('@prop2.prop2-1', 'b');
        output.set('@prop2.prop2-2', 'c');
        system.assertEquals('a', output.get('@prop1'));
        system.assertEquals('b', output.get('@prop2.prop2-1'));
        system.assertEquals('c', output.get('@prop2.prop2-2'));
        system.assertEquals(null, output.get(null));
        system.assertEquals(null, output.get('@prop2.prop2-3'));
        system.assertEquals(null, output.get('@prop3'));
    }

}