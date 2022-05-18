@IsTest
public with sharing class OvcSAPSalesOrderDetailsCasePluginTest {
    @IsTest
    static void testEmptyMethod() {
        OvcSAPSalesOrderDetailsCasePlugin plugin = new OvcSAPSalesOrderDetailsCasePlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        plugin.BeforeScenarioCall(null, null, null, null);
        System.assert(true, 'always true');
    }

    @IsTest
    private static void testAfterScenarioCall() {
        Map<String, Object> returnedData = new Map<String, Object>();
        returnedData.put('ORDER_HEADERS_OUT', new List<Object>{ new Map<String, Object>{ 'DOC_NUMBER' => '0123456789' } });
        returnedData.put(
            'ORDER_CONDITIONS_OUT',
            new List<Object>{
                new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'COND_VALUE' => 100, 'COND_TYPE' => 'ZQMD', 'COND_COUNT' => '01' },
                new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'COND_VALUE' => 500, 'COND_TYPE' => 'ZFR0', 'COND_COUNT' => '01' }
            }
        );
        returnedData.put(
            'ORDER_TEXTLINES_OUT',
            new List<Object>{
                new Map<String, Object>{ 'TEXT_ID' => '0002', 'APPLOBJECT' => 'VBBK', 'LINE' => 'TestLine0002', 'COND_COUNT' => '01' },
                new Map<String, Object>{ 'TEXT_ID' => 'V002', 'APPLOBJECT' => 'VBBK', 'LINE' => 'TestLineV002', 'COND_COUNT' => '01' },
                new Map<String, Object>{ 'TEXT_ID' => 'ZSPI', 'APPLOBJECT' => 'VBBK', 'LINE' => 'TextZSPI' },
                new Map<String, Object>{ 'TEXT_ID' => '0012', 'APPLOBJECT' => 'VBBK', 'LINE' => 'Text0012' }
            }
        );
        returnedData.put('ORDER_PARTNERS_OUT', new List<Object>{ new Map<String, Object>{ 'PARTN_ROLE' => 'AG', 'CUSTOMER' => '1112223334' } });
        returnedData.put('ORDER_ITEMS_OUT', new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '000010', 'MATERIAL' => 'Test Material1' } });
        returnedData.put(
            'ORDER_FLOWS_OUT',
            new List<Object>{
                new Map<String, Object>{ 'PRECSDDOC' => 'TestPrDoc1', 'DOCCATEGOR' => 'M', 'SUBSSDDOC' => '9876543210' },
                new Map<String, Object>{ 'PRECSDDOC' => 'TestPrDoc2', 'DOCCATEGOR' => 'J', 'SUBSSDDOC' => '2222222222' }
            }
        );

        OvcSAPSalesOrderDetailsCasePlugin plugin = new OvcSAPSalesOrderDetailsCasePlugin();

        plugin.testOrderStatus = new OrderUserStatus();
        List<Map<String, Object>> orderStatusList = new List<Map<String, Object>>{ new Map<String, Object>{ 'OBJNR' => 'VB0123456789000010' } };
        plugin.testOrderStatus.set('JEST', orderStatusList);

        plugin.afterScenarioCall(returnedData, null, null);
        
        List<Object> invoiceList = (List<Object>) returnedData.get('ovcInvoice');
        List<Object> orderflows = (List<Object>) returnedData.get('ORDER_FLOWS_OUT');  

        List<Object> orderItemsList = (List<Object>) returnedData.get('ORDER_ITEMS_OUT');    
        Boolean pricingBlockExist = false;
        for (Object orderItem : orderItemsList) {
            Map<String,Object> orderItemMap = (Map<String,Object>) orderItem;
            String itemNumber = (String) orderItemMap.get('ITM_NUMBER');
            if(itemNumber == '000010' ){
               String pricingBlock = (String) orderItemMap.get('ovcPricingBlock');
               if(!String.isBlank(pricingBlock)){
                    pricingBlockExist = true ;
               }
            }                
        }  

        Map<String,Object> ovcConditionMap = (Map<String,Object>) returnedData.get('ovc_CONDITIONS');
        Decimal zfr0Condition = (Decimal) ovcConditionMap.get('ZFR0');
        
        List<Object> headers = (List<Object>)returnedData.get('ORDER_HEADERS_OUT');
		Map<String, Object> headerOut = (Map<String, Object>) headers[0];   
        String zspiText = (String) headerOut.get('CarrierSpecialInstructions');          

        System.assertEquals(1, invoiceList.size(), 'Expected text list size is different than 1!');
        System.assertEquals(true, pricingBlockExist, 'Pricing block info not available!');
        System.assertEquals(1, orderflows.size(), 'Removal not happened!');
        System.assertEquals(500, zfr0Condition, 'Conditions value is different than expected!');
        System.assertEquals('TextZSPI', zspiText, 'ZSPI Text Info is different!');
    }
}