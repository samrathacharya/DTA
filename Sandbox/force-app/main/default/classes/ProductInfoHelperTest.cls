@isTest
public class ProductInfoHelperTest {
    @isTest
    public static void testFetchAllUnitsOfMeasure () {
      ProductInfoHelper.fetchAllUnitsOfMeasure();
    }

	@isTest
    public static void testFetchAvailableUoMs () {
        Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'Test123';
        pricebook.IsActive = true;
        insert pricebook;
         Product2 product = new Product2(Name = 'Test product 123',Product_Code_ID__c = 'Test Product', IsActive =true);
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        
        ///*
        List<PricebookEntry> standardPriceList = new List<PricebookEntry>();
        standardPriceList = [select id from PricebookEntry where Product2Id =: product.Id and 
                                        Pricebook2Id =: pricebookId and isActive = true limit 1];
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice = standardPriceList[0]; 
        ProductInfoHelper.fetchAvailableUoMs(standardPrice.Id);
    }
	
    @isTest
    public static void testFetchProductInfo() {
        //fetchProductInfo
         Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'Test123';
        pricebook.IsActive = true;
        insert pricebook;
         Product2 product = new Product2(Name = 'Test product 123', Product_Code_ID__c = 'Test Product', IsActive =true);
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        
        ///*
        List<PricebookEntry> standardPriceList = new List<PricebookEntry>();
        standardPriceList = [select id from PricebookEntry where Product2Id =: product.Id and 
                                        Pricebook2Id =: pricebookId and isActive = true limit 1];
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice = standardPriceList[0]; 
        ProductInfoHelper.fetchProductInfo(standardPrice.Id);
    }

    @isTest
    public static void testFetchPlantCode() {
        Device_Plant__c plant = new Device_Plant__c(name= 'P120', isActive__c = true);
        insert plant;
        ProductInfoHelper.fetchPlantCode(plant.Id);
    }
}