public with sharing class NewProductController {

    @AuraEnabled
    public static Opportunity getOpportunity(Id opportunityId) {
        // Perform isAccessible() checks here
        return [SELECT Id FROM Opportunity WHERE Id = :opportunityId];
    }
    
    @AuraEnabled
    public static OpportunityLineItem createOLI(OpportunityLineItem oli, Id opportunityId) {
        // Perform isAccessible() and isUpdateable() checks here
        oli.OpportunityId = opportunityId;
        fetchLatestPrice(oli, opportunityId);
        insert oli;
        return oli; 
    }
    
    @AuraEnabled
    public static OpportunityLineItem updateOLI(OpportunityLineItem oli) {
        fetchLatestPrice(oli, oli.opportunityId);
        update oli;
        return oli;
    }
    
    //TODO null checks
    @AuraEnabled
    public static List<String> fetchAvailableUoMs(Id pbEntryId) {
        PricebookEntry pbEntry = [SELECT Product2.AvailableUOMs__c FROM PricebookEntry
                         		  WHERE Id=:pbEntryId];
        List<String> uoms = new List<String>();
        String availableUOMs = pbEntry.Product2.AvailableUOMs__c;
        if(!String.isBlank(availableUOMs)){
	        uoms = availableUOMs.split(',');
    	}
        return uoms;
    }

    @AuraEnabled
    public static Map<String, String> fetchAllUnitsOfMeasure() {
        Map<String, String> allUoMs = new Map<String, String>();

		List<UOM_Map__mdt> uomList = [SELECT MasterLabel, DeveloperName FROM UOM_Map__mdt];
        for (UOM_Map__mdt uom: uomList) {
            allUoMs.put(uom.DeveloperName, uom.MasterLabel);
        }
        return allUoMs;
    }
    
    @TestVisible
    private static void fetchLatestPrice(OpportunityLineItem d, Id opportunityId) {
        
        if (null == d || String.isBlank(d.UOM__c) || null == d.Quantity 
                || d.Quantity < 1.0 || d.UOM__c.equals('None') 
                || d.UOM__c.equals('-None-')) {
               throw new AuraHandledException('Invalid Input. Please check Quantity/UOM');
        }
        
        //Post client side validation: make price request
        Boolean saveReturn;
		PriceRequest priceRequest = new PriceRequest();

        //Build Price Request object from parameters: ConfigParams, Header, ProductList

        //Request: SAP Pricing web service HTTP configuration parameters
		priceRequest.configParams.timeout = 30000;
        
        Opportunity theOpp = [SELECT Id, Account.Customer_Number__c, Sales_Organisation_Code__c,
	                              Distribution_Channel_Code__c, Division__c
                              FROM Opportunity
                              WHERE Id = :opportunityId];
        
        if (null == theOpp) {
            throw new AuraHandledException('No Opportunity defined for Opportunity Products');
        }
		
        PricebookEntry pbEntry = [SELECT Id, Product2.Product_Code_Id__c 
                                  FROM PricebookEntry
                                  WHERE Id = :d.PricebookEntryId];
        
        //Request:HEADER
		priceRequest.header.customerNumber = theOpp.Account.Customer_Number__c; //'0001001998';
        priceRequest.header.salesOrg = theOpp.Sales_Organisation_Code__c; //'1000';
        priceRequest.header.distributionChannel = theOpp.Distribution_Channel_Code__c; //'10';
        priceRequest.header.division = theOpp.Division__c; //'00';

        //Request:PRODUCTS
		List<ProductLineItem> requestProductList = new List<ProductLineItem>();
		ProductLineItem product = new ProductLineItem();
        product.productCode = pbEntry.Product2.Product_Code_Id__c; //'AR-7200';
        product.quantity = String.valueOf(d.Quantity); //'1';
        product.uom = d.UOM__c; //'BX';
        requestProductList.add(product); 
        Map<Integer,ProductLineItem> itemNoProductMap = new Map<Integer,ProductLineItem> ();
		itemNoProductMap.put(1, product);
		priceRequest.productList = requestProductList;
		priceRequest.productMap = itemNoProductMap;
        //SAP web service callout
		PriceResponse priceResponse = new PriceResponse();
		SAPWSCallout callout = new SAPWSCallout();
        priceResponse = callout.getQuotes(priceRequest);
        
        //Update shoppingCart with UnitPrice or error
        if (priceResponse.responseStatus.result.equals('SUCCESS')) {
            Map<String,OpportunityLineItem> responseProdLineItems = priceResponse.productLineItems;
           // ProductLineItem productLineItem = responseProducts.get(0);
           OpportunityLineItem productLineItem = responseProdLineItems.values()[0];
            if (productLineItem.quantity != 0.0) { //Avoid division by zero
                d.UnitPrice = productLineItem.UnitPrice;//Decimal.valueOf(productLineItem.quantity);
               d.UnitPrice = d.UnitPrice.setScale(2, RoundingMode.HALF_UP);
               
            }            
        } else { //ERROR
            String responseErrorStr = 
                'Error in request [' + priceResponse.responseStatus.errorSource + '].' + 
                'Error in [' + priceResponse.responseStatus.erringEntity + '].' + 
                'Error Detail: [' + priceResponse.responseStatus.errorDetail + '].' ;
            throw new AuraHandledException(responseErrorStr);
        }
    }    

}