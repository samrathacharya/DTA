global with sharing class sapSalesOrderDetailsQuotePlugin implements overcast.ComponentPluginV3 {
    global sapSalesOrderDetailsQuotePlugin() {
        return;
    }
    
    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        return;
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

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
    @TestVisible
    private String testResponse;
    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        return;
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {

        List<Object> headers = (List<Object>)returnedData.get('ORDER_HEADERS_OUT');
        List<Object> conditions = (List<Object>)returnedData.get('ORDER_CONDITIONS_OUT');
        if (headers.size() != 1) {
            return;
        }
        Map<String,Object> header = (Map<String,Object>)headers[0];
        String pricProcedure = (String)header.get('SD_PRIC_PR');
        if (String.isEmpty(pricProcedure)) {
            return;
        }
        
        Map<String,String> partnerConvert = new Map<String,String>{ 'AG' => 'SP', 'WE' => 'SH', 'RE' => 'BP' , 'RG' => 'PY' };      
        List<Object> partners = (List<Object>)returnedData.get('ORDER_PARTNERS_OUT'); 
        String shipToPartner = '';
        for (Object partnObj : partners) {
            Map<String,Object> partnMap = (Map<String,Object>) partnObj;
            String partnRole = (String) partnMap.get('PARTN_ROLE');
            String partnExtValue = partnerConvert.get(partnRole);
            if(partnExtValue != null){
            	partnMap.put('PARTN_ROLE', partnExtValue);   
                if(partnRole == 'WE'){
                    shipToPartner = (String) partnMap.get('CUSTOMER');
                    returnedData.put('ovc_SHIPINFO', new Map<String, Object>{'SHIP_TO' => shipToPartner});
                }
            }
        }

        List<Object> orderItems = (List<Object>)returnedData.get('ORDER_ITEMS_OUT');
        for (Object itmObj : orderItems) {
            Map<String,Object> itemMap = (Map<String,Object>) itmObj;
            String itemCateg = (String) itemMap.get('ITEM_CATEG');
            if (itemCateg == 'ZAGN') {
                itemMap.put('ITEM_CATEG', '');
            }
        }          
        
        List<String> shipCondKeyFields = new List<String>{'DOC_TYPE','SALES_ORG','DISTR_CHAN'};
        List<String> shipCondKeyList = new List<String>();
        if((String) header.get('DOC_TYPE') == 'ZQT'){
        	header.put('DOC_TYPE', 'ZOR');    
        }
        
		//HeaderNote1 found only!
        List<Object> textLines = (List<Object>)returnedData.get('ORDER_TEXTLINES_OUT');
        String headerNote1 = '';
        for (Object textObj : textLines) {
            Map<String,Object> textMap = (Map<String,Object>) textObj;
            if ((String) textMap.get('TEXT_ID') == '0002' && (String) textMap.get('APPLOBJECT') == 'VBBK') {
            	headerNote1 += (String) textMap.get('LINE');
            }
        }
        header.put('HeaderNote1', headerNote1);    
    }
}