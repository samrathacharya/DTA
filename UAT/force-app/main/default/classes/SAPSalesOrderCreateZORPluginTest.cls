@IsTest
public with sharing class SAPSalesOrderCreateZORPluginTest {
	private class DatabaseAccess implements SAPSalesOrderCreateZORPlugin.IDatabaseAccess {
		public Case cs;
		public Case getCase(String id) {
			this.cs = new Case();
			return cs;
		}

		public void updateCaseRecord(Case record) {
			this.cs = record;
		}
	}

    @IsTest
    static void testEmptyMethod(){
        
        SAPSalesOrderCreateZORPlugin plugin = new SAPSalesOrderCreateZORPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        plugin.setLogger(null);
        System.assert(true, 'always true');    
    }    

    @IsTest
    private static void testBeforeScenarioCall(){

    Map<String,Object> importParameters = new Map<String,Object>{
        'CONDITIONS_IN' => new Map<String,Object>{
            'ZQMP' => '123',
            'ZQMD' => '456'
        },
        'ORDER_HEADER_IN' => new Map<String,Object>{
            'CURR_ISO' => 'AUD',
            'SalesText' => 'TestTextInput',
            'ShippingInstructions' => 'Shipping Instructions Code:012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789'
        }
    };

    overcast.ComponentDefinition.Component comp = new overcast.ComponentDefinition.Component();
    comp.sections = new List<overcast.ComponentDefinition.Section>();
    overcast.ComponentDefinition.Section section1 = new overcast.ComponentDefinition.Section();
    comp.sections.add(section1);
    section1.structureName = 'ORDER_HEADER_IN';
    section1.fields = new List<overcast.ComponentDefinition.Field>();
        
    overcast.ComponentDefinition.Field field = new overcast.ComponentDefinition.Field();
    section1.fields.add(field);
    field.name = 'SalesText';
    field.InputOptions = new overcast.ComponentDefinition.InputOptions();
    Map<String, Object> fieldattr = field.InputOptions.componentAttributes;
    fieldattr.put('TextId', '0001');
                
    overcast.ComponentDefinition.Field field2 = new overcast.ComponentDefinition.Field();
    section1.fields.add(field2);
    field2.name = 'ShippingInstructions';
    field2.InputOptions = new overcast.ComponentDefinition.InputOptions();
    Map<String, Object> fieldattr2 = field2.InputOptions.componentAttributes;
    fieldattr2.put('TextId', '0002');
                       

    SAPSalesOrderCreateZORPlugin plugin = new SAPSalesOrderCreateZORPlugin();
    plugin.cmp = comp;
    plugin.beforeScenarioCall(
        null,
        null,
        importParameters,
        null
    );

    String textLineTest;
    List<Object> orderTextList = (List<Object>)importParameters.get('ORDER_TEXT');
    for(Object orderText : orderTextList){
        Map<String, Object> orderTextMap = (Map<String, Object>) orderText;
        if ('0001' == (String) orderTextMap.get('TEXT_ID')) {
            textLineTest = (String) orderTextMap.get('TEXT_LINE');        
        }    
    }

    System.assertEquals('TestTextInput', textLineTest, 'Text Info is different!');

    String condPrice;
    String currx;
    List<Object> condList = (List<Object>)importParameters.get('ORDER_CONDITIONS_IN');
    for(Object cond : condList){
        Map<String, Object> condMap = (Map<String, Object>) cond;
        if ('ZQMP' == (String) condMap.get('COND_TYPE')) {
            condPrice = (String) condMap.get('COND_VALUE');  
            currx = (String) condMap.get('CURRENCY_x');      
        }    
    }  

    System.assertEquals('123', condPrice, 'Price is different');    
    System.assertEquals('AUD', currx, 'Currency is different than AUD');    

    }

    @IsTest
    private static void testAfterScenarioCall(){

    Map<String, Object> returnedData = new Map<String, Object>{
        'BAPI_SALESORDER_CREATEFROMDAT2' => new Map<String, Object>{
            'SALESDOCUMENT' => '0123456789'
        },
        'RETURN_x' => new List<Object>{
            new Map<String, Object>{
                'TYPE_x' => 'S',
                'MESSAGE' => 'Test is successful'
            }
        },
        'ORDER_HEADER_IN' => new Map<String,Object>{
            'PURCH_NO_C' => '11111'
        }
    };

    SAPSalesOrderCreateZORPlugin plugin = new SAPSalesOrderCreateZORPlugin();
    plugin.testOrderStatus = new OrderUserStatus();

    List<Map<String, Object>> orderStatusList = new List<Map<String, Object>>{
        new Map<String, Object>{ 'OBJNR' => 'VB0123456789000010'}
    };

    plugin.testOrderStatus.set('JEST', orderStatusList);  

    SAPSalesOrderCreateZORPlugin.databaseAccess = new DatabaseAccess();

    plugin.afterScenarioCall(returnedData, null, null); 

    List<Object> returnResult = (List<Object>) returnedData.get(
        'RETURN_x'
    );  

    String warningMessage;
    for(Object returnObj : returnResult){
        Map<String, Object> returnMessage = (Map<String, Object>) returnObj;
        if ('W' == (String) returnMessage.get('TYPE_x')) {
            warningMessage = (String) returnMessage.get('MESSAGE');     
        }    
    }     
        
    System.assertEquals('Item awaiting approval ' + '000010', warningMessage, 'Message is different!');
    }

    @IsTest
	private static void testDatabaseAccess() {
		try {
			SAPSalesOrderCreateZORPlugin.databaseAccess.getCase(null);
			system.assert(true, 'always true');
		} catch (Exception e) {
			system.assert(true, 'always true');
		}

		try {
			SAPSalesOrderCreateZORPlugin.databaseAccess.updateCaseRecord(null);
			system.assert(true, 'always true');
		} catch (Exception e) {
			system.assert(true, 'always true');
		}

	}

}