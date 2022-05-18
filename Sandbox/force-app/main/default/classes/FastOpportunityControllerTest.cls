/**
* Created by cxu on 10/02/2017.
* Adapted by OnVal for Custom Add Products Wizard
*/
@IsTest
public with sharing class FastOpportunityControllerTest {
    @testSetup static void setup() {
        Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'Test123';
        pricebook.IsActive = true;
        
        insert pricebook;
        
        System.assert(pricebook.Id != null);
        
        Product2 product = new Product2(Name = 'Test product 123', Product_Code_ID__c = 'Test Product 123', IsActive =true);
        insert product;
        Id pricebookId = Test.getStandardPricebookId();
        
        ///*
        List<PricebookEntry> standardPriceList = new List<PricebookEntry>();
        standardPriceList = [select id from PricebookEntry where Product2Id =: product.Id and 
                                        Pricebook2Id =: pricebookId and isActive = true limit 1];
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice = standardPriceList[0];
        
        if(null == standardPrice && null == standardPrice.Id) {
            standardPrice = new PricebookEntry(
                Pricebook2Id = pricebookId, Product2Id = product.Id,
                UnitPrice = 123456, IsActive = true);
            insert standardPrice;
        }
        
        System.assert(standardPrice.Id != null);
        
        
        PricebookEntry entry = new PricebookEntry(
            IsActive = true,
            Pricebook2Id = pricebook.Id,
            Product2Id = product.Id,
            UnitPrice = 20
        );
        
        insert entry;
        System.assert(entry.Id != null);
    }
    
    @IsTest static void getOpportunityTest() {
        Id accountRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sell to Account').getRecordTypeId();
        System.assert(accountRecordTypeId != null);
        Account account = new Account(Name = 'Test 1998', Customer_Number__c = '1001998' );
        account.RecordTypeId = accountRecordTypeId;
        insert account;
        
        System.debug('Inserted account Id: ' + account.Id);
        System.assert(account.Id != null);
        
        Opportunity opportunity = new Opportunity(
            Name = 'Test Oppty', 
            AccountId = account.Id, 
            CloseDate = (Date.today()).addDays(30),
            StageName = 'Quote'
        );
        Id opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        opportunity.RecordTypeId = opportunityRecordTypeId;
        insert opportunity;
        
        System.debug('Inserted opportunity Id: ' + opportunity.Id);
        
        Opportunity actual = FastOpportunityController.getOpportunity(opportunity.Id);
        System.assertEquals(opportunity.Id, actual.Id);
        
        string error = FastOpportunityController.updateOpportunity(opportunity, Test.getStandardPricebookId());
        System.assertEquals('', error);
    }
    
    @isTest static void getPricebooksTest() {
        
        List<Pricebook2> pricebooks = FastOpportunityController.getPricebooks();
        System.assert(pricebooks != null);
        System.assertEquals(1, pricebooks.size());
        
        List<PricebookEntry> entries = FastOpportunityController.getPricebookEntries(pricebooks[0].Id);
        System.assert(entries != null);
        System.assertEquals(1, entries.size());
        
    }
    
    @isTest static void updateLineItemsTest() {
        Id accountRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sell to Account').getRecordTypeId();
        System.assert(accountRecordTypeId != null);
        Account account = new Account(Name = 'Test 1999', Customer_Number__c = '1001999' );
        account.RecordTypeId = accountRecordTypeId;
        insert account;
        
        System.assert(account.Id != null);
        
        Opportunity opportunity = new Opportunity(
            Name = 'Test Oppty', 
            AccountId = account.Id, 
            CloseDate = (Date.today()).addDays(30),
            StageName = 'Quote'
        );
        Id opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        opportunity.RecordTypeId = opportunityRecordTypeId;
        insert opportunity;
        
        List<Pricebook2> pricebooks = FastOpportunityController.getPricebooks();
        List<PricebookEntry> entries = FastOpportunityController.getPricebookEntries(pricebooks[0].Id);
        
        OpportunityLineItem item1 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, Quantity = 1, UnitPrice = 20);
        OpportunityLineItem item2 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, Quantity = 2, UnitPrice = 30);
        
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
    }
    
    @isTest
    public static void testBuildRequestList() {
        //create plant record
        Device_Plant__c plant = new Device_Plant__c(name = 'P120', isActive__c = true);
        insert plant;
        
        //Select account record type and create account record
        Id accountRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sell to Account').getRecordTypeId();
        System.assert(accountRecordTypeId != null);
        
        Account account = new Account(Name = 'Test 1999', Customer_Number__c = '1001999' );
        account.RecordTypeId = accountRecordTypeId;
        insert account;
        
        //Select opportunity record type and create opportunity record
        Opportunity opportunity = new Opportunity(Name = 'Test Oppty',
                                                  AccountId = account.Id,
                                                  CloseDate = (Date.today()).addDays(30),
                                                  StageName = 'Quote', plant__c = plant.Id);
        
        Id opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        opportunity.RecordTypeId = opportunityRecordTypeId;
        insert opportunity;
        
        List<Pricebook2> pricebooks = FastOpportunityController.getPricebooks();
        List<PricebookEntry> entries = FastOpportunityController.getPricebookEntries(pricebooks[0].Id);
        
        OpportunityLineItem item1 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, 
                                                            Quantity = 1, UnitPrice = 20);
        OpportunityLineItem item2 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, 
                                                            Quantity = 2, UnitPrice = 30);
        
        insert item1;
        insert item2;
        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>{item1, item2};
            List<ProductAvailabilityRequest> requests = FastOpportunityController.buildRequestList(lineItems, (Id)opportunity.Id);
        system.assert(requests.size() > 0);
        
    }
    
    @isTest
    public static void testUpdateAvailability() {
        //create plant record
        Device_Plant__c plant = new Device_Plant__c(name = 'P120', isActive__c = true);
        insert plant;
        
        //Select account record type and create account record
        Id accountRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sell to Account').getRecordTypeId();
        System.assert(accountRecordTypeId != null);
        
        Account account = new Account(Name = 'Test 1999', Customer_Number__c = '1001999' );
        account.RecordTypeId = accountRecordTypeId;
        insert account;
        
        //Select opportunity record type and create opportunity record
        Opportunity opportunity = new Opportunity(Name = 'Test Oppty',
                                                  AccountId = account.Id,
                                                  CloseDate = (Date.today()).addDays(30),
                                                  StageName = 'Quote', plant__c = plant.Id);
        
        Id opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        opportunity.RecordTypeId = opportunityRecordTypeId;
        insert opportunity;
        
        List<Pricebook2> pricebooks = FastOpportunityController.getPricebooks();
        List<PricebookEntry> entries = FastOpportunityController.getPricebookEntries(pricebooks[0].Id);
        
        OpportunityLineItem item1 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, 
                                                            Quantity = 1, UnitPrice = 20);
        OpportunityLineItem item2 = new OpportunityLineItem(OpportunityId = opportunity.Id, PricebookEntryId = entries[0].Id, 
                                                            Quantity = 2, UnitPrice = 30);
        
        insert item1;
        insert item2;
        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>{item1, item2};
        FastOpportunityController.updateAvailability(lineItems,opportunity.Id);
            
        // public static String updateAvailability(List<OpportunityLineItem> lineItems, string opportunityId) {
        // 
    }
}