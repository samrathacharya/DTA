@istest
private class opportunityProductEntryTests {
    
    
    // Utility method that can be called by Apex tests to create price book entries.
    static testmethod void addPricebookEntries() {
        // First, set up test price book entries.
        // Insert a test product.
        Product2 prod = new Product2(Name = 'Laptop X200', 
            Family = 'Hardware', AvailableUOMs__c = 'Big, Small, Large, X-Large', Product_Code_ID__c = 'Laptop X200', IsActive =true);
        insert prod;
        
        // Get standard price book ID.
        // This is available irrespective of the state of SeeAllData.
        Id pricebookId = Test.getStandardPricebookId();
        
        /*
        // 1. Insert a price book entry for the standard price book.
        // Standard price book entries require the standard price book ID we got earlier.
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        */
        
        // Create a custom price book
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        // 2. Insert a price book entry with a custom price.
        PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = customPB.Id, Product2Id = prod.Id,
            UnitPrice = 12000, IsActive = true);
        insert customPrice;
        
        // Next, perform some tests with your test price book entries.
    }    

    static testMethod void theTests(){
        //addPricebookEntries();
        
        Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'Test';
        pricebook.IsActive = true;
        
        insert pricebook;
        
        System.assert(pricebook.Id != null);
        
        Product2 product = new Product2(Name = 'Test product', Product_Code_ID__c = 'Test product', IsActive =true);
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
        
        // You really should create test data, but I'm going to query instead
        // It's my best shot of avoiding a test failure in most orgs
        // Once you've installed this package though, you might want to write your own tests
        // or at least customize these ones to make them more applicable to your org
            
        OpportunityLineItem oli = [select Id, PricebookEntryId, PricebookEntry.Pricebook2Id, PricebookEntry.Name, PriceBookEntry.Product2Id, OpportunityId, Opportunity.AccountId from OpportunityLineItem limit 1];
        if (null == oli) {
            return;
        }
                
        ////////////////////////////////////////
        //  test opportunityProductEntry
        ////////////////////////////////////////
        
        // load the page       
        PageReference pageRef = Page.opportunityProductEntry;
        pageRef.getParameters().put('Id',oli.OpportunityId);
        Test.setCurrentPageReference(pageRef);
        
        // load the extension
        opportunityProductEntryExtension oPEE = new opportunityProductEntryExtension(new ApexPages.StandardController(oli.Opportunity));
        
        // test 'getChosenCurrency' method
        if(UserInfo.isMultiCurrencyOrganization())
            System.assert(oPEE.getChosenCurrency()!='');
        else
            System.assertEquals(oPEE.getChosenCurrency(),'');

        // we know that there is at least one line item, so we confirm
        Integer startCount = oPEE.ShoppingCart.size();
        system.assert(startCount>0);

        //test search functionality without finding anything
        oPEE.searchString = 'michaelforce is a hip cat';
        oPEE.updateAvailableList();
        system.assert(oPEE.AvailableProducts.size()==0);
        
        //test remove from shopping cart
        oPEE.toUnselect = oli.PricebookEntryId;
        oPEE.removeFromShoppingCart();
        system.assert(oPEE.shoppingCart.size()==startCount-1);
        
        //test save and reload extension
        oPEE.onSave();
        oPEE = new opportunityProductEntryExtension(new ApexPages.StandardController(oli.Opportunity));
        system.assert(oPEE.shoppingCart.size()==startCount-1);
        
        // test search again, this time we will find something
        oPEE.searchString = oli.PricebookEntry.Name;
        oPEE.updateAvailableList();
        system.assert(oPEE.AvailableProducts.size()>0);       

        // test add to Shopping Cart function
        oPEE.toSelect = oPEE.AvailableProducts[0].Id;
        oPEE.addToShoppingCart();
        system.assert(oPEE.shoppingCart.size()==startCount);
                
        // test save method - WITHOUT quanitities and amounts entered and confirm that error message is displayed
        oPEE.onSave();
        system.assert(ApexPages.getMessages().size()>0);
        
        // add required info and try save again
        for(OpportunityLineItem o : oPEE.ShoppingCart){
            o.quantity = 5;
            o.unitprice = 300;
        }
        oPEE.onSave();
        
        // query line items to confirm that the save worked
        opportunityLineItem[] oli2 = [select Id from opportunityLineItem where OpportunityId = :oli.OpportunityId];
        //system.assert(oli2.size()==startCount);
        
        // test on new Opp (no pricebook selected) to make sure redirect is happening
        Opportunity newOpp = new Opportunity(Name='New Opp',stageName='Quote',Amount=10,
                                             closeDate=System.Today()+30,
                                             AccountId=oli.Opportunity.AccountId,
                                            Pricebook2Id= pricebook.Id);
        opportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Device Consumable').getRecordTypeId();
        newOpp.RecordTypeId = opportunityRecordTypeId;
        insert(newOpp);
        oPEE = new opportunityProductEntryExtension(new ApexPages.StandardController(newOpp));
        System.assert(oPEE.priceBookCheck()==null); //not changed pricebook - using pricebook from opp insert
        
        // final quick check of cancel button
        System.assert(oPEE.onCancel()!=null);
        
        
        ////////////////////////////////////////
        //  test redirect page
        ////////////////////////////////////////
        
        // load the page
        pageRef = Page.opportunityProductRedirect;
        pageRef.getParameters().put('Id',oli2[0].Id);
        Test.setCurrentPageReference(pageRef);

        // load the extension and confirm that redirect function returns something
        opportunityProductRedirectExtension oPRE = new opportunityProductRedirectExtension(new ApexPages.StandardController(oli2[0]));
        System.assert(oPRE.redirect()!=null);
        
        //code coverage
        System.assert(opEE.showCart() != null);
        System.assert(opEE.showSearch() != null);
        System.assert(opEE.changePricebook() != null);
        
        Device_Plant__c plant = new Device_Plant__c(name='p120');
        insert plant;
        //OpportunityProductEntryExtension ext = new OpportunityProductEntryExtension(new ApexPages.StandardController(oli2[0]));
        oPEE.getPlants();
     	System.assert( oPEE.getPlants() != null);
        
    }

}