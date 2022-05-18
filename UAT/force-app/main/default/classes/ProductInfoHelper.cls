public with sharing class ProductInfoHelper {
   
     public static Map<String, String> fetchAllUnitsOfMeasure() {
        Map<String, String> allUoMs = new Map<String, String>();

		List<UOM_Map__mdt> uomList = [SELECT MasterLabel, DeveloperName FROM UOM_Map__mdt];
        for (UOM_Map__mdt uom: uomList) {
            allUoMs.put(uom.DeveloperName, uom.MasterLabel);
        }
        return allUoMs;
    }

     public static List<String> fetchAvailableUoMs(Id pbEntryId) {
        PricebookEntry pbEntry = [SELECT Product2.AvailableUOMs__c FROM PricebookEntry
                         		  WHERE Id=:pbEntryId];
        List<String> uoms = new List<String>();
        String availableUOMs = pbEntry.Product2.AvailableUOMs__c;
        if(!String.isBlank(availableUOMs)){
	        uoms = availableUOMs.split(',');
    	}
         system.debug('Available UOMs' + uoms);
        return uoms;
    }
    
    public static String fetchProductInfo(Id pbEntryId) {
       PriceBookEntry pbEntry = [select Product2.Name from PricebookEntry where id =: pbEntryId ];
       return pbEntry.Product2.Name;
    }
    
    public static String fetchPlantCode(Id plantId) {
        Device_plant__c plant = [select id, Name from Device_plant__c where id =: plantId];
        return plant.Name;
    }
    
}