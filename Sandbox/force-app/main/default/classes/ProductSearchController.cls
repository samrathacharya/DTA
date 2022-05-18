public with sharing class ProductSearchController {
    
    @AuraEnabled
    public static String checkAvailability(String plantCode, String pbEntryId, String uom) { 
		system.debug(plantCode + ' ' + pbEntryId + ' ' + uom);
        SAPWSCallout wscallout = new SAPWSCallout();
        ProductAvailabilityRequest avlRequest = new ProductAvailabilityRequest();
        avlRequest.plantCode = ProductInfoHelper.fetchPlantCode(plantCode);
        avlRequest.productName= ProductInfoHelper.fetchProductInfo(pbEntryId);
        avlRequest.uom = uom;
        ProductAvailabilityResponse response = new ProductAvailabilityResponse();
        List<ProductAvailabilityRequest> requests = new  List<ProductAvailabilityRequest>();
        requests.add(avlRequest);
        Map<String,ProductAvailabilityResponse> responseMap = SAPWSCallout.getAvailability(requests);
        if(responseMap.size() > 0) {
            response = responseMap.get(avlRequest.productName);
        }
        response.productCode = avlRequest.productName; 
        system.debug('Response' + response.availability + response.availableQuantity);
        return JSON.serialize(response);
    }

    @AuraEnabled
    public static List<String> fetchAvailableUoMs (Id pbEntryId) {

        return ProductInfoHelper.fetchAvailableUoMs(pbEntryId);
    }
 
    @AuraEnabled
    public static  Map<String, String> fetchAllUnitsOfMeasure(){
        return ProductInfoHelper.fetchAllUnitsOfMeasure(); 
      
    }
}