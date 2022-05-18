global with sharing class sapAvailabilityProductRequestPlugin implements overcast.ComponentPluginV3 {  
    global sapAvailabilityProductRequestPlugin() {
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

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {     
        System.debug('TestBeforeImp'+JSON.serialize(importParameters));
        List<Object> orderItemsIn = (List<Object>) importParameters.get('ORDER_ITEMS_IN');
        if (orderItemsIn != null) {
            Decimal targetQty;
            for (Object orderItemObj : orderItemsIn) {
                Map<String, Object> fields = (Map<String, Object>) orderItemObj;
				Integer target_qty = Integer.valueOf(fields.get('TARGET_QTY')) * 1000;
				fields.put('TARGET_QTY', String.valueOf(target_qty));
				fields.put('REQ_QTY', String.valueOf(target_qty));      
                fields.put('PLANT', 'P120');
                fields.put('STORE_LOC', '0001');
            }
        } 
        
        Map<String, Object> orderPartn = (Map<String, Object>) importParameters.get('ORDER_PARTNERS');
        String partnNumber = (String) orderPartn.get('PARTN_NUMB');
        if(!String.isBlank(partnNumber)){
            String partPadded = partnNumber.leftPad(10, '0');
            orderPartn.put('PARTN_NUMB',partPadded);            
        }       
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {  
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
}