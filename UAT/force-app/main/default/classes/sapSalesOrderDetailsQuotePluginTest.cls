@IsTest
public with sharing class sapSalesOrderDetailsQuotePluginTest {
    @IsTest
    static void testEmptyMethod() {
        sapSalesOrderDetailsQuotePlugin plugin = new sapSalesOrderDetailsQuotePlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        plugin.BeforeScenarioCall(null, null, null, null);
        System.assert(true, 'always true');
    }

    @IsTest
    private static void testAfterScenarioCall() {
        Map<String, Object> returnData = new Map<String, Object>();
        returnData.put('ORDER_HEADERS_OUT', new List<Object>{ new Map<String, Object>{ 'DOC_NUMBER' => '0123456789' , 'CURREN_ISO' => 'AUD' , 'SD_PRIC_PR' => 'Test Procedure' , 'DOC_TYPE' => 'ZQT'} });
        returnData.put(
            'ORDER_CONDITIONS_OUT',
            new List<Object>{
                new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'COND_VALUE' => 100, 'COND_TYPE' => 'ZQMD', 'COND_COUNT' => '01' },
                new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'COND_VALUE' => 500, 'COND_TYPE' => 'ZFR0', 'COND_COUNT' => '01' }
            }
        );
        returnData.put(
            'ORDER_TEXTLINES_OUT',
            new List<Object>{
                new Map<String, Object>{ 'TEXT_ID' => '0002', 'APPLOBJECT' => 'VBBK', 'LINE' => 'TestLine0002', 'COND_COUNT' => '01' }
            }
        );
        returnData.put('ORDER_PARTNERS_OUT', new List<Object>{ 
            new Map<String, Object>{ 'PARTN_ROLE' => 'AG', 'CUSTOMER' => '1111111111' }, 
            new Map<String, Object>{ 'PARTN_ROLE' => 'WE', 'CUSTOMER' => '2222222222' },
            new Map<String, Object>{ 'PARTN_ROLE' => 'RE', 'CUSTOMER' => '3333333333' },
            new Map<String, Object>{ 'PARTN_ROLE' => 'RG', 'CUSTOMER' => '4444444444' }
        });
        returnData.put('ORDER_ITEMS_OUT', new List<Object>{ new Map<String, Object>{ 'ITM_NUMBER' => '000010', 'MATERIAL' => 'Test Material1' ,'ITEM_CATEG' => 'ZAGN'} });

        sapSalesOrderDetailsQuotePlugin plugin = new sapSalesOrderDetailsQuotePlugin();

        plugin.afterScenarioCall(returnData, null, null);

        List<Object> orderPartnersList = (List<Object>) returnData.get('ORDER_PARTNERS_OUT');
        List<Object> partnRoleList = new List<Object>();
        for (Object partnObj : orderPartnersList) {
            Map<String,Object> partnMap = (Map<String,Object>) partnObj;
            partnRoleList.add((String) partnMap.get('PARTN_ROLE'));
        }        
        
        List<Object> headers = (List<Object>)returnData.get('ORDER_HEADERS_OUT');
		Map<String, Object> headerOut = (Map<String, Object>) headers[0];   
        String headerNote1 = (String) headerOut.get('HeaderNote1');    
        String docType = (String) headerOut.get('DOC_TYPE'); 
        
        List<Object> itemsList = (List<Object>)returnData.get('ORDER_ITEMS_OUT');
		Map<String, Object> itemOut = (Map<String, Object>) itemsList[0];     
        
        System.assertEquals('TestLine0002', headerNote1, 'Header Note Text Info is different!');
        System.assertEquals(true, String.isBlank((String)itemOut.get('ITEM_CATEG')), 'Item categ. not set to blank!');
        System.assertEquals('ZOR', docType, 'Doc Type is not ZOR!');
        System.assertEquals(true, partnRoleList.contains('SP'), 'Partner Role Conversion is not successful!');
    }
}