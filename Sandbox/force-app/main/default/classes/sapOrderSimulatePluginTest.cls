/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
public with sharing class sapOrderSimulatePluginTest {
    @IsTest
    static void testEmptyMethod() {
        sapOrderSimulatePlugin plugin = new sapOrderSimulatePlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        System.assert(true, 'always true');
    }

    @IsTest
    private static void pluginBeforeScenarioCall() {
        sapOrderSimulatePlugin plugin = new sapOrderSimulatePlugin();
        String ovcShiptoCheck = '0001000000';
        Map<String, Object> ovcPrevPartnersMap = new Map<String, Object>{
            'ShiptoBP' => '0001006277',
            'SoldtoBP' => '0001006277',
            'BilltoBP' => '0001006277'
        };
        String ovcPrevPartners = JSON.serialize(ovcPrevPartnersMap);
        Map<String, Object> matTransGrpPrev = new Map<String, Object>{ 'CAB-ORANGE-CABLE' => '01' };
        String ovcMatGroup = Json.serialize(matTransGrpPrev);
        //Request Data
        Map<String, Object> inp = new Map<String, Object>{
            'ORDER_HEADER_IN' => new Map<String, Object>{
                'ovcShCheckHeader' => ovcShiptoCheck,
                'ovcPrevPartners' => ovcPrevPartners,
                'ovcMatTransGrp' => ovcMatGroup
            },
            'ORDER_SCHEDULE_IN' => new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'ovcDelivery_Block' => 'Y1' } },
            'ocf_PARTNERS' => new Map<String, Object>{ 'ocf_SHIPTO' => '0001002374', 'ocf_SOLDTO' => '0001002374', 'ocf_BILLTO' => '0001002374' },
       		'ORDER_PARTNERS' =>
            new List<Object>{
                new Map<String, Object>{ 'PARTN_ROLE' => 'SP', 'PARTN_NUMB' => '0001002374' }
            }                
        };
        Map<String, Object> importParameters = new Map<String, Object>();
        importParameters.put('ocf_PageData', inp);

        List<Object> inpItemsList = new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'ovcDelivery_Block' => 'Y1' } };
        importParameters.put('ORDER_ITEMS_IN', inpItemsList);

        List<Object> inpSchedList = new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000' } };
        importParameters.put('ORDER_SCHEDULE_IN', inpSchedList);

        Map<String, Object> referenceFieldValues = new Map<String, Object>();
        referenceFieldValues.put('ORDER_PARTNERS', new List<Object>{ new Map<String, Object>{ 'PARTN_ROLE' => 'SH', 'PARTN_NUMB' => '0001006277' } });
      
        /*sapOrderSimulatePlugin.Partner testPartnerSold = new sapOrderSimulatePlugin.Partner();
        testPartnerSold.testCustomerMasterSold = new CustomerMasterPartner();
        List<Map<String, Object>> partnerListSoldTo = new List<Map<String, Object>>{
            new Map<String, Object>{ 'PARVW' => 'AG', 'KUNNR' => '0001025518', 'DEFPA' => 'X' }
        };
        testPartnerSold.testCustomerMasterSold.set('KNVP', partnerListSoldTo);        
        plugin.orderSearchPartner = testPartnerSold; */       
        
        plugin.beforeScenarioCall(null, referenceFieldValues, importParameters, null);

        List<Object> orderScheds = (List<Object>) importParameters.get('ORDER_SCHEDULE_IN');
        String dlvBlockCode;
        for (Object orderSchedObj : orderScheds) {
            Map<String, Object> orderSchedIn = (Map<String, Object>) orderSchedObj;
            dlvBlockCode = (String) orderSchedIn.get('REQ_DLV_BL');
        }

        List<Object> orderPartnerList = (List<Object>) importParameters.get('ORDER_PARTNERS');
        System.assertEquals(1, orderPartnerList.size(), 'Order Partner size is not 1!');
        System.assertEquals(3, plugin.ovcPrevPagePartners.size(), 'Order Partner size is not 3!');
        System.assertEquals('Y1', dlvBlockCode, 'Block is not expected!');        
    }

    @IsTest
    private static void pluginAfterScenarioCall() {
        sapOrderSimulatePlugin plugin = new sapOrderSimulatePlugin();
        //plugin.defaultSPPartner = '0001025517';
        Map<String, Object> returnedData = new Map<String, Object>();
        plugin.ovcPrevPagePartners = new Map<String, Object>{
            'ShiptoBP' => '0001006277',
            'SoldtoBP' => '0001006277',
            'BilltoBP' => '0001006277'
        };
        Map<String, Object> matTransGrpPrev = new Map<String, Object>{ 'CAB-ORANGE-CABLE' => '01' };

        returnedData.put('ORDER_HEADER_IN', new Map<String, Object>{ 'SALES_ORG' => '1000', 'DISTR_CHAN' => '10', 'DIVISION' => '00' });
        returnedData.put('SHIP_TO_PARTY', new Map<String, Object>{ 'SHIP_COND' => '01', 'SHIP_TO' => '0001006277' });
        returnedData.put('SOLD_TO_PARTY', new Map<String, Object>{ 'SOLD_TO' => '0001006277' });
        returnedData.put('BILLING_PARTY', new Map<String, Object>{ 'PAYER' => '0001025518' });        
        returnedData.put('RETURN_x', new Map<String, Object>{ 'TYPE_x' => 'S' , 'CODE' => '111', 'MESSAGE' => 'Transaction is successful'});
        returnedData.put(
            'ORDER_ITEMS_OUT',
            new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'SHIP_POINT' => '1100', 'MATERIAL' => 'CAB-Test2' } }
        );
        returnedData.put(
            'ORDER_SCHEDULE_EX',
            new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'MS_DATE' => Date.newInstance(2021, 10, 21) } }
        );

       /* returnedData.put(
            'ORDER_PARTNERS',
            new List<Object>{
                new Map<String, Object>{ 'PARTN_ROLE' => 'SP', 'PARTN_NUMB' => '0001002374' },
                new Map<String, Object>{ 'PARTN_ROLE' => 'SH', 'PARTN_NUMB' => '0001002374' }
            }
        ); */      
       
        sapOrderSimulatePlugin.Partner testPartnerBillPayer = new sapOrderSimulatePlugin.Partner();
        testPartnerBillPayer.testCustomerMasterBill = new CustomerMasterPartner();
        List<Map<String, Object>> partnerListSoldTo = new List<Map<String, Object>>{
            new Map<String, Object>{ 'PARVW' => 'RE', 'KUNN2' => '0001025518', 'DEFPA' => 'X' },
            new Map<String, Object>{ 'PARVW' => 'RG', 'KUNN2' => '0001025519', 'DEFPA' => 'X' }
        };
        testPartnerBillPayer.testCustomerMasterBill.set('KNVP', partnerListSoldTo);        
        plugin.orderSearchPartner = testPartnerBillPayer;           

        plugin.testShipPointDeparture = new ShippingPointsRT();
        List<Map<String, Object>> shipDepartureList = new List<Map<String, Object>>{
            new Map<String, Object>{ 'VSTEL' => '1100', 'ALAND' => 'AU', 'AZONE' => 'NSWD-BLRSE' }
        };
        plugin.testShipPointDeparture.set('TVST', shipDepartureList);

        plugin.testShipInstrSpNote = new BusinessPartnerRT();
        List<Map<String, Object>> salesAreaTextList = new List<Map<String, Object>>{
            new Map<String, Object>{
                'Customer' => '1006277',
                'LongTextID' => '0002',
                'SalesOrganization' => '1000',
                'DistributionChannel' => '10',
                'Division' => '00',
                'Language' => 'EN',
                'LongText' => 'Shipping text for test'
            },
             new Map<String, Object>{
                 'Customer' => '1006277',
                'LongTextID' => '0001',
                'SalesOrganization' => '1000',
                'DistributionChannel' => '10',
                'Division' => '00',
                'Language' => 'EN',
                'LongText' => 'Sales Note Text Test'
            }              
        };
        plugin.testShipInstrSpNote.set('A_CustomerSalesAreaText', salesAreaTextList);
        plugin.afterScenarioCall(returnedData, null, null);

        Map<String, Object> ordHeader = (Map<String, Object>) returnedData.get('ORDER_HEADER_IN');
        System.assertEquals('0001025518', ordHeader.get('ovcBillPartner'), 'Bill to is wrong!');
        System.assertEquals('Shipping text for test', ordHeader.get('ovcShipInst'), 'Text is different!');
        System.assertEquals('Sales Note Text Test', ordHeader.get('ovcSalesNote'), 'Sales Note text is different!');
    }
    
    @IsTest
    private static void pluginAfterScenarioCallError() {
        sapOrderSimulatePlugin plugin = new sapOrderSimulatePlugin();
        //plugin.defaultSPPartner = '0001025517';
        Map<String, Object> returnedData = new Map<String, Object>();
        plugin.ovcPrevPagePartners = new Map<String, Object>{
            'ShiptoBP' => '0001006277',
            'SoldtoBP' => '0001006277',
            'BilltoBP' => '0001006277'
        };
        Map<String, Object> inp = new Map<String, Object>(); 
        inp.put('ORDER_HEADER_IN',new Map<String, Object>{ 'SALES_ORG' => '1000', 'DISTR_CHAN' => '10', 'DIVISION' => '00' , 'ovcPrevPartners' => JSON.serialize(plugin.ovcPrevPagePartners)});
        plugin.importMap.put('ocf_PageData', inp);
        
        Map<String, Object> matTransGrpPrev = new Map<String, Object>{ 'CAB-ORANGE-CABLE' => '01' };

        returnedData.put('ORDER_HEADER_IN', new Map<String, Object>{ 'SALES_ORG' => '1000', 'DISTR_CHAN' => '10', 'DIVISION' => '00' });
        returnedData.put('SHIP_TO_PARTY', new Map<String, Object>{ 'SHIP_COND' => '01','SHIP_TO' => '0001006277' });
        returnedData.put('SOLD_TO_PARTY', new Map<String, Object>{ 'SOLD_TO' => '0001006277' });
        returnedData.put('BILLING_PARTY', new Map<String, Object>{ 'PAYER' => '0001025518' });
        returnedData.put('RETURN_x', new Map<String, Object>{ 'TYPE_x' => 'E' ,'CODE' => 'VP113', 'MESSAGE' => 'Transaction has error'});
        returnedData.put(
            'ORDER_ITEMS_OUT',
            new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'SHIP_POINT' => '1100', 'MATERIAL' => 'CAB-Test2' } }
        );
        returnedData.put(
            'ORDER_SCHEDULE_EX',
            new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '001000', 'MS_DATE' => Date.newInstance(2021, 10, 21) } }
        );

        /*returnedData.put(
            'ORDER_PARTNERS',
            new List<Object>{
                new Map<String, Object>{ 'PARTN_ROLE' => 'SP', 'PARTN_NUMB' => '0001002374' },
                new Map<String, Object>{ 'PARTN_ROLE' => 'SH', 'PARTN_NUMB' => '0001002374' }
            }
        ); */      
       
        sapOrderSimulatePlugin.Partner testPartnerBillPayer = new sapOrderSimulatePlugin.Partner();
        testPartnerBillPayer.testCustomerMasterBill = new CustomerMasterPartner();
        List<Map<String, Object>> partnerListSoldTo = new List<Map<String, Object>>{
            new Map<String, Object>{ 'PARVW' => 'RE', 'KUNN2' => '0001025518', 'DEFPA' => 'X' },
            new Map<String, Object>{ 'PARVW' => 'RG', 'KUNN2' => '0001025519', 'DEFPA' => 'X' }
        };
        testPartnerBillPayer.testCustomerMasterBill.set('KNVP', partnerListSoldTo);        
        plugin.orderSearchPartner = testPartnerBillPayer;             
        

        plugin.testShipPointDeparture = new ShippingPointsRT();
        List<Map<String, Object>> shipDepartureList = new List<Map<String, Object>>{
            new Map<String, Object>{ 'VSTEL' => '1100', 'ALAND' => 'AU', 'AZONE' => 'NSWD-BLRSE' }
        };
        plugin.testShipPointDeparture.set('TVST', shipDepartureList);

        plugin.testShipInstrSpNote = new BusinessPartnerRT();
        List<Map<String, Object>> salesAreaTextList = new List<Map<String, Object>>{
            new Map<String, Object>{
                'Customer' => '1006277',
                'LongTextID' => '0002',
                'SalesOrganization' => '1000',
                'DistributionChannel' => '10',
                'Division' => '00',
                'Language' => 'EN',
                'LongText' => 'Shipping text for test'
            },
             new Map<String, Object>{
                 'Customer' => '1006277',
                'LongTextID' => '0001',
                'SalesOrganization' => '1000',
                'DistributionChannel' => '10',
                'Division' => '00',
                'Language' => 'EN',
                'LongText' => 'Sales Note Text Test'
            }              
        };
        plugin.testShipInstrSpNote.set('A_CustomerSalesAreaText', salesAreaTextList);
        plugin.afterScenarioCall(returnedData, null, null);
        
        Map<String, Object> ordHeader = (Map<String, Object>) returnedData.get('ORDER_HEADER_IN');
        System.assertEquals('0001025518', ordHeader.get('ovcBillPartner'), 'Bill to is wrong!');
    }
    
}