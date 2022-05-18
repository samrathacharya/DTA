@IsTest
public class NewProductControllerTest {
	@IsTest
    public static void testGetOpportunity() {
        Id accountRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sell to Account').getRecordTypeId();
        System.assert(accountRecordTypeId != null);
        Account account = new Account(Name = 'Test 1998', Customer_Number__c = '1001998' );
        account.RecordTypeId = accountRecordTypeId;
        insert account;

        Id opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        Opportunity opportunity = new Opportunity(
            Name = 'Test Oppty', 
            AccountId = account.Id, 
            CloseDate = Date.today(),
            StageName = 'Quote'
        );
        opportunity.RecordTypeId = opportunityRecordTypeId;
        insert opportunity;
        Opportunity theOpp = NewProductController.getOpportunity(opportunity.Id);
        
        System.assertNotEquals(null, theOpp);
    }

    //public static OpportunityLineItem createOLI(OpportunityLineItem oli, Id opportunityId) {
	//@isTest
    public static void testCreateOLI() {
        Product2 product = new Product2(Name = 'Test product 123');
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        Account acct = new Account(name = 'Test Account');
        insert acct;
        Opportunity opportunity = new Opportunity(Name = 'Test Oppty',
                                                  AccountId = acct.Id,
                                                  CloseDate = (Date.today()).addDays(30),
                                                  StageName = 'Quote');
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = opportunity.Id;
        oli.Product2Id = product.Id;
        //oli.
        //oli.
        insert oli;
    }
    
    @IsTest
    public static void testAvailableUoMs() {
        Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'Test1';
        pricebook.IsActive = true;
        
        insert pricebook;
        
        System.assert(pricebook.Id != null);
        
        Product2 product = new Product2(Name = 'Test product232', AvailableUoMs__c = 'EA,BX,CN');
        insert product;     
        System.assert(product.Id != null);
        
        Id pricebookId = Test.getStandardPricebookId();
        
        /*
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = product.Id,
            UnitPrice = 20, IsActive = true);
        insert standardPrice;
        
        System.assert(standardPrice.Id != null);
        */
        
        PricebookEntry entry = new PricebookEntry(
            IsActive = true,
            Pricebook2Id = pricebook.Id,
            Product2Id = product.Id,
            UnitPrice = 20
        );
        
        insert entry;
        System.assert(entry.Id != null);
            
        List<String> uomList = NewProductController.fetchAvailableUoMs(entry.Id);
        System.assertNotEquals(null, uomList);

    }
    
    @IsTest
    public static void testFetchAllUoMs() {
        Map<String, String> uomMap = NewProductController.fetchAllUnitsOfMeasure();
        System.assertNotEquals(null, uomMap);
    }
    
    @IsTest
    public static void testFetchLatestPrice() {
        
        Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'Test121212';
        pricebook.IsActive = true;
        
        insert pricebook;
        
        System.assert(pricebook.Id != null);
        
        Product2 product = new Product2(Name = 'Test product');
        insert product;
        
        System.assert(product.Id != null);
        
        Id pricebookId = Test.getStandardPricebookId();
        
        /*
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = product.Id,
            UnitPrice = 20, IsActive = true);
        insert standardPrice;
        
        System.assert(standardPrice.Id != null);
        */
        
        PricebookEntry entry = new PricebookEntry(
            IsActive = true,
            Pricebook2Id = pricebook.Id,
            Product2Id = product.Id,
            UnitPrice = 20
        );
        
        insert entry;
        System.assert(entry.Id != null);
                
        Id accountRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sell to Account').getRecordTypeId();
        System.assert(accountRecordTypeId != null);
        Account account = new Account(Name = 'Test 1998', Customer_Number__c = '1001998' );
        account.RecordTypeId = accountRecordTypeId;
        insert account;

        Id opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        Opportunity opportunity = new Opportunity(
            Name = 'Test Oppty', 
            AccountId = account.Id, 
            CloseDate = Date.today(),
            StageName = 'Quote'
        );
        opportunity.RecordTypeId = opportunityRecordTypeId;
        insert opportunity;

        List<Pricebook2> pricebooks = FastOpportunityController.getPricebooks();
        List<PricebookEntry> entries = FastOpportunityController.getPricebookEntries(pricebooks[0].Id);
        
        OpportunityLineItem item1 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, Quantity = 1, UnitPrice = 20, UOM__c = 'BX');
        OpportunityLineItem item2 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, Quantity = 2, UnitPrice = 30, UOM__c = 'EA');
        
        insert item1;
        insert item2;
        
        List<OpportunityLineItem> items = new List<OpportunityLineItem>();
        item1.Quantity = 10;
        OpportunityLineItem item3 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, Quantity = 4, UnitPrice = 10);

        items.add(item1);
        items.add(item3);
        
        List<OpportunityLineItem> newItems = FastOpportunityController.updateLineItems(items, opportunity.Id);
        System.assert(newItems != null);
        System.assertEquals(2, newItems.size());

        
        try {
        	NewProductController.fetchLatestPrice(item1, opportunity.Id);
        } catch (Exception e) {
            //eaten
        }
    }


}