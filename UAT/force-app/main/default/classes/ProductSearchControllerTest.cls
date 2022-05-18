@isTest
public class ProductSearchControllerTest {
	@isTest
    public static void testCheckAvailability() {
        //public static String checkAvailability(String plantCode, String pbEntryId, String uom) { 
        Product2 product = new Product2(Name = 'Test product 123', Product_Code_ID__c = 'Test Product', IsActive =true);
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        
        ///*
        Device_Plant__c plant = new Device_Plant__c(name = 'P121', isActive__c = true );
        insert plant;
        List<PricebookEntry> standardPriceList = new List<PricebookEntry>();
        standardPriceList = [select id from PricebookEntry where Product2Id =: product.Id and 
                                        Pricebook2Id =: pricebookId and isActive = true limit 1];
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice = standardPriceList[0];
        ProductSearchController.checkAvailability(plant.id, standardPrice.Id, 'EA');
    }
    
    @isTest
    //public static List<String> fetchAvailableUoMs (Id pbEntryId) {
    public static void testFetchAvailableUoMs() {
        Product2 product = new Product2(Name = 'Test product 123', Product_Code_ID__c = 'Test Product', IsActive =true);
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        
        ///*
        Device_Plant__c plant = new Device_Plant__c(name = 'P121', isActive__c = true );
        insert plant;
        List<PricebookEntry> standardPriceList = new List<PricebookEntry>();
        standardPriceList = [select id from PricebookEntry where Product2Id =: product.Id and 
                                        Pricebook2Id =: pricebookId and isActive = true limit 1];
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice = standardPriceList[0];
        ProductSearchController.fetchAvailableUoMs(standardPrice.Id);
    }
    
    @isTest
    public static void testFetchAllUOMs() {
        //fetchAllUnitsOfMeasure
        Product2 product = new Product2(Name = 'Test product 123', Product_Code_ID__c = 'Test Product', IsActive =true);
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        
        ///*
        Device_Plant__c plant = new Device_Plant__c(name = 'P121', isActive__c = true );
        insert plant;
        ProductSearchController.fetchAllUnitsOfMeasure();
        
    }
}