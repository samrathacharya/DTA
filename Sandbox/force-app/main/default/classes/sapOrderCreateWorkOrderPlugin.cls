global with sharing class sapOrderCreateWorkOrderPlugin implements overcast.ComponentPluginV3 {
	private overcast.Logger logger;    
    @TestVisible
    private static String testSAPOrderStatus;   
	@TestVisible
	private String recordId;    
    global sapOrderCreateWorkOrderPlugin() {
        return;
    }
    global void setLogger(overcast.Logger logger) {
        this.logger = logger;
    }
    
	@TestVisible
	private overcast.ComponentDefinition.Component cmp;
  
    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        this.cmp = cmp;
    }

    global void afterReferenceValuesLoaded(Id recordId, String componentName, Map<String, Map<String, Object>> referenceValues) {
        return;
    }

    global void afterReferenceValuesLoaded(
        Id recordId,
        String componentName,
        Map<String, Map<String, Object>> referenceValues,
        Map<String, List<Map<String, Object>>> referenceChildValues
    ) {
        return;
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        this.recordId = recordId;
        List<Object> headerConditions = (List<Object>) importParameters.get('ovcHeaderConditions');        
		//ConditionsIn
		List<Object> condObject = new List<Object>();
		//List<Object> condXObject = new List<Object>();
        List<String> discountConds = new List<String> {'ZFRF','ZQMD'};
        if(headerConditions != null){
            for (Object headerCondition : headerConditions) {
                Map<String, Object> conditionLine = (Map<String, Object>) headerCondition;
                if(discountConds.contains((String)conditionLine.get('CURRENCY_x'))){
                	conditionLine.put('conditionLine',null);    
                }
                else{
                	conditionLine.put('conditionLine','AUD');       
                }
                Map<String, Object> condInfo = new Map<String, Object>{
                    'ITM_NUMBER' => '000000',
                    'COND_TYPE' => conditionLine.get('COND_TYPE'),
                    'COND_VALUE' => conditionLine.get('COND_VALUE'),
                    'CURRENCY_x' => conditionLine.get('conditionLine')
                };
                condObject.add(condInfo);    
            }               
            importParameters.put('ORDER_CONDITIONS_IN', condObject);     
            /*
            Map<String, Object> condXInfo = new Map<String, Object>{
                'ITM_NUMBER' => '000000',
                'COND_TYPE' => conditionLine.get('COND_TYPE'),
                'COND_VALUE' => 'X',
                'CURRENCY_x' => conditionLine.get('CURRENCY_x')
            };
            condXObject.add(condXInfo);
            */
    
            //importParameters.put('ORDER_CONDITIONS_INX', condXObject);               
        }
        
        //Text Handling
		for (overcast.ComponentDefinition.Section section : cmp.sections) {
			if (section.structureName == 'HeaderNotes') {
                List<Object> dtOrderObj = new List<Object>();
				for (overcast.ComponentDefinition.Field field : section.fields) {
                    String sTextId = (String) field.InputOptions.componentAttributes.get(
                        'TextId'
                    );
                    Map<String,Object> headerTextMap = (Map<String,Object>) importParameters.get('HeaderNotes');
                    if(headerTextMap != null){
                        String textLine = (String) headerTextMap.get(field.name);
                        if(!String.isBlank(textLine)){
                            Map<String, String> textInfo = new Map<String, String>{
                                'ITM_NUMBER' => '000000',
                                'TEXT_ID' => sTextId,
                                'TEXT_LINE' => textLine,
                                'LANGU' => 'EN'
                            };
                            dtOrderObj.add(textInfo);                        
                        }                        
                    }
				} 
                importParameters.put('ORDER_TEXT', dtOrderObj);
            }
        }       
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        Map<String, Object> salesOrderInfo = (Map<String, Object>) returnedData.get('BAPI_SALESORDER_CREATEFROMDAT2');
        String salesDocNo = (String) salesOrderInfo.get('SALESDOCUMENT');
        if(!String.isBlank(salesDocNo)){
        	List<String> blockedItemStatusList = getSalesOrderUserStatus(salesDocNo,logger);    
            if(blockedItemStatusList.size()> 0){
                String blockedItemNo = String.join(new List<String>(blockedItemStatusList), ',');
            	List<Object> returnXList = (List<Object>) returnedData.get('RETURN_x');
                Map<String, Object> itemStatusWarn = new Map<String, Object>{ 'TYPE_x' => 'W', 'MESSAGE' => 'Item awaiting approval '+blockedItemNo};
                returnXList.add(itemStatusWarn);
            }
        }
        Map<String, Object> orderHeaderIn = (Map<String, Object>) returnedData.get('ORDER_HEADER_IN');
        String purchNo = (String) orderHeaderIn.get('PURCH_NO_C');
        if(!String.isBlank(purchNo)){
        	setData(purchNo,false);    
        }     
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
    
    @TestVisible
    private OrderUserStatus testOrderStatus;
    @TestVisible
    private List<String> getSalesOrderUserStatus(
        String salesDocNo,
        overcast.logger logger    
    ){
        List<String> salesOrderItemBlockedList = new List<String>();
		if (salesDocNo == null) {
			return salesOrderItemBlockedList;
		}  
		String objSearchString = 'VB'+salesDocNo;
        
        OrderUserStatus request = new OrderUserStatus();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(
 			new overcast.Predicate(
				'OBJNR',
				overcast.Predicate.FilterType.STARTS_WITH ,
				objSearchString         
            )
        );
        //Check stat E0002
        pred.add(
 			new overcast.Predicate(
				'STAT_x',
				overcast.Predicate.FilterType.EQUALS ,
				'E0002'        
            )
        );
        
        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        OrderUserStatus respObj;        
        //Overcast.Logger loggerX = new Overcast.Logger('OrderUserStatus');
        if (Test.isRunningTest()) {
            request.loadAsyncResponse(testSAPOrderStatus);
            respObj = request;
        } else {
            respObj = request.runQuery(q, logger, null);
        }
		List<Object> jestList = (List<Object>) respObj.get('JEST');               
		
        for(Object userStatusObj : jestList){
            Map<String,Object> userStatusMap = (Map<String,Object>) userStatusObj;
			String blockedObj = (String) userStatusMap.get('OBJNR');
            String blockedItem = blockedObj.substringAfter(objSearchString);
            salesOrderItemBlockedList.add(blockedItem);      
        }
        return salesOrderItemBlockedList;
    } 
    
	//DatabaseAccess interface implementation
	@TestVisible
	private static IDatabaseAccess databaseAccess {
		get {
			// prettier-ignore
			return databaseAccess == null ? (databaseAccess = new DatabaseAccess()) : databaseAccess;
		}
		set {
			databaseAccess = value;
		}
	}    
	@TestVisible
    private interface IDatabaseAccess{
        Case getCase(String id);
        void updateCaseRecord(Case record);
    }
    private without sharing class DatabaseAccess implements IDatabaseAccess{
        public Case getCase(String id){
        	Case cs = new Case();
            if(id != null){
                cs = [SELECT id, Purchase_Order_Number__c FROM Case WHERE Id = :id WITH SECURITY_ENFORCED];
            }
            return cs;
        }  
        public void updateCaseRecord(Case record){
        	update record;
        }
    }
    
	private void setData(String purchaseOrderNo, Boolean hasError) {
		//Case Update
		Case cs = databaseAccess.getCase(this.recordId);
        	
		if (!hasError) {
			cs.Purchase_Order_Number__c = purchaseOrderNo;
		} 
		databaseAccess.updateCaseRecord(cs);
	}    

}