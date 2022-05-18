public without sharing class opportunityProductEntryExtension {
    
    public Opportunity theOpp {get;set;}
    public String searchString {get;set;}
    public opportunityLineItem[] shoppingCart {get;set;}
    public priceBookEntry[] AvailableProducts {get;set;}
    public Pricebook2 theBook {get;set;}
    public boolean explodeBoms{get;set;}
    public String quotesTitle { get; set; } 
    public string totalDiscount{get;set;}
    public string totaldiscountPercentage {get;set;}
    public String plantId {get;set;}
    public String toSelect {get; set;}
    public String toUnselect {get; set;}
    public Decimal Total {get;set;}
    public List<Device_Plant__c> plantList {get;set;}
   // public String selectedAddress{get;set;}
    public list<SelectOption>addressList{get{
        if(null != theOpp.Ship_To__c && null != theOpp.Ship_To_Key__c) {
            
            this.addressList = new List<SelectOption>();
            this.addressList.add(new SelectOption(theOpp.Ship_To__c, theOpp.Ship_To_Key__c));
            
        }
        return this.addressList;
    } set;}
    
    public Boolean overLimit {get;set;}
    public Boolean multipleCurrencies {get; set;}
    
    private Boolean forcePricebookSelection = false;
    public Boolean errorInSaving {get;set;}
    //private string 
    private Integer maxItemNumber= 1;
    private opportunityLineItem[] forDeletion = new opportunityLineItem[]{};
        
        public Map<String, String> allUoMs;
    
    public Map<Id, List<SelectOption>> ProductUOMsMap {get; private set;}
    
    public List<MarkedUpAvailableProduct> markedUpProducts{get; set;}        
    public class MarkedUpAvailableProduct {
        public priceBookEntry availableProduct {get; set;}
        public string styleClass {get; set;}
        public MarkedUpAvailableProduct(priceBookEntry pbe, string s){
            availableProduct = pbe;
            styleClass = s; 
        }
        public void resetStyle(){
            styleClass='';
        }
    }
    
    public List<Schema.FieldSetMember> getFieldsForPricebook() {
        return SObjectType.PricebookEntry.FieldSets.OnValAddProducts.getFields();
    }
    
    public List<Schema.FieldSetMember> getFieldsForOLI() {
        return SObjectType.OpportunityLineItem.FieldSets.OnValAddProducts.getFields();
    }
    
    
    public opportunityProductEntryExtension(ApexPages.StandardController controller) {
        
        // Fetch master list of units of measure (SAPcode:HumanReadable map)
        //errorInSaving = false;
        allUoMs = new Map<String, String>();
        fetchAllUnitsOfMeasure(allUoMs);
        
        markedUpProducts = new List<MarkedUpAvailableProduct>();
        // Need to know if org has multiple currencies enabled
        multipleCurrencies = UserInfo.isMultiCurrencyOrganization();
        
        
        // Get information about the Opportunity being worked on
        if(multipleCurrencies){
            system.debug('Multiiiii');
            theOpp = database.query('select Id, Pricebook2Id, Pricebook2.Name, Approver__c,In_Approval__c, CurrencyIsoCode, Account.Customer_Number__c, Sales_Organisation_Code__c, Distribution_Channel_Code__c, Division__c, Quotes_Title__c, Explode_BOM__c, Discount_Overall__c, Discount_Overall_Percent__c, Quotes_Intro__c, OwnerId,Owner.FederationIdentifier, Ship_To__c, Ship_To_Key__c,Plant__c from Opportunity where Id = \'' + controller.getRecord().Id + '\' limit 1');
        }else
            theOpp = [select Id, Pricebook2Id, PriceBook2.Name, Discount_Overall__c,Discount_Overall_Percent__c, Explode_BOM__c,
                      Account.Customer_Number__c, Sales_Organisation_Code__c, Distribution_Channel_Code__c, Division__c,Quotes_Title__c,
                      Plant__c, Quotes_Intro__c,Approver__c,In_Approval__c,OwnerId,Owner.FederationIdentifier,Ship_To__c, Ship_To_Key__c
                      from Opportunity where Id = :controller.getRecord().Id limit 1];
        
        // If products were previously selected need to put them in the "selected products" section to start with
        shoppingCart = [select Id, Quantity,  UnitPrice, Description, List_Price__c ,
                        UOM__c,LastModifiedDate,ServiceDate , Product_Name__c, Group_Item__c,price_override__c,Discount_per__c, Discount_Absolute__c ,
                        Short_Description__c,Item_Number__c , totalPrice__c,
                        PriceBookEntryId, PriceBookEntry.Name, PriceBookEntry.IsActive, 
                        PriceBookEntry.Product2Id, PriceBookEntry.Product2.Name, PriceBookEntry.Product2.AvailableUOMs__c,
                        PriceBookEntry.Product2.Product_Code_Id__c, opportunityid, Category__c , long_description__c,
                        PriceBookEntry.Product2.Description,
                        PriceBookEntry.PriceBook2Id from opportunityLineItem where OpportunityId=:theOpp.Id ORDER BY Item_Number__c DESC];
        
        // Check if Opp has a pricebook associated yet
        if(theOpp.Pricebook2Id == null){
            Pricebook2[] activepbs = [select Id, Name from Pricebook2 where isActive = true limit 2];
            if(activepbs.size() == 2){
                forcePricebookSelection = true;
                theBook = new Pricebook2();
            }
            else{
                theBook = activepbs[0];
            }
        }
        else{
            theBook = theOpp.Pricebook2;
        }
        
        //if(!forcePricebookSelection)
        updateAvailableList();
        
        //reset all markedup products on init
        clearMarkupOnProducts();
       if(null != theOpp && theOpp.id != null )
        updatePrice(false);
        
    }
    
    private void clearMarkupOnProducts(){
        for(MarkedUpAvailableProduct markedProd: markedUpProducts){
            markedProd.resetStyle();
        }
    }
    
    // this is the 'action' method on the page
    public PageReference priceBookCheck(){
        // if the user needs to select a pricebook before we proceed we send them to standard pricebook selection screen
        if(forcePricebookSelection){        
            return changePricebook();
        } else{
            //if there is only one active pricebook we go with it and save the opp
            if(theOpp.pricebook2Id != theBook.Id){
                try{
                    theOpp.Pricebook2Id = theBook.Id;
                    update(theOpp);
                }
                catch(Exception e){
                    ApexPages.addMessages(e);
                }
            }
            return null;
        }
    }
    
    public String getChosenCurrency(){
        if(multipleCurrencies)
            return (String)theOpp.get('CurrencyIsoCode');
        else
            return '';
    }
    
    public void updateAvailableList() {
        //maxItemNumber++;
        // We dynamically build a query string and exclude items already in the shopping cart
        //         
        String qString = 'select Id, Name, Pricebook2Id, ProductCode,Product_Description__c, Product_Family__c,'
            + ' IsActive, Product2.Name, Product2.Family, Product2.IsActive, Product2.Description, ' 
            + ' Product2.Product_Code_Id__c, ' /*unique identifier for product in ERP*/
            + ' Product2.AvailableUOMs__c, UnitPrice from PricebookEntry ' 
            + ' where IsActive=true and Pricebook2Id = \'' 
            + theBook.Id + '\'';
        if(multipleCurrencies)
            qstring += ' and CurrencyIsoCode = \'' + theOpp.get('currencyIsoCode') + '\'';
        
        // note that we are looking for the search string entered by the user in the name OR description
        // modify this to search other fields if desired
        if(searchString!=null){
            qString+= ' and (Product2.Name like \'%' + searchString + '%\' or Product2.Description like \'%' + searchString + '%\')';
        }
        
        Set<Id> selectedEntries = new Set<Id>();
        ProductUOMsMap = new Map<Id, List<SelectOption>>();
        
        List<Integer> itemNumbers = new List<Integer>();
        for(opportunityLineItem d:shoppingCart){
            selectedEntries.add(d.PricebookEntryId);     
            itemNumbers.add(Integer.valueOf(d.Item_Number__c));
        }
        if(itemNumbers.size() > 0) {
            itemNumbers.sort();
            if(itemNumbers[itemNumbers.size()-1] == null) {
                maxItemNumber =0;
            } else
                maxItemNumber = Integer.valueOf(itemNumbers[itemNumbers.size()-1]) +1;
        }
        
        
        qString+= ' order by Product2.Name';
        qString+= ' limit 101';
        
        system.debug('qString:' +qString);        
        AvailableProducts = database.query(qString);
        
        // We only display up to 100 results... if there are more than we let the user know (see vf page)
        if(AvailableProducts.size()==101){
            AvailableProducts.remove(100);
            overLimit = true;
        }
        else{
            overLimit=false;
        }
        
        markedUpProducts.clear();
        //identify products that have already been added to cart
        for(PricebookEntry pbe: AvailableProducts){
            if(selectedEntries.contains(pbe.Id)){
                //if theres no cart item newly added (i.e all cart items for this pbeid have oli id - show no markup)
                //flag
                boolean isNewlyAdded = false;
                
                for(OpportunityLineItem oli: shoppingCart){
                    isNewlyAdded = (oli.id == null && oli.PricebookEntryId == pbe.Id);
                    if(isNewlyAdded) break;
                }                
                if(isNewlyAdded){
                    //maxItemNumber++;
                    markedUpProducts.add(new MarkedUpAvailableProduct(pbe, 'slds-button_success'));
                }else{
                    markedUpProducts.add(new MarkedUpAvailableProduct(pbe, ''));
                }
            }else{
                markedUpProducts.add(new MarkedUpAvailableProduct(pbe, ''));
            }
        }
        
        for(opportunityLineItem d:shoppingCart){
            String availableUOMs = d.PriceBookEntry.Product2.AvailableUOMs__c;
            List<SelectOption> optsList = new List<SelectOption>();
            optsList.add(new SelectOption('','-None-'));
            if(!String.isEmpty(availableUOMs)) {
                String[] opts = availableUOMs.split(',');
                for(String opt: opts){
                    String key = opt.trim();
                    String value = allUoMs.get(key);
                    optsList.add(new SelectOption(key, value));
                }
            }
            ProductUOMsMap.put(d.PricebookEntryId, optsList);
        }
        
        
    }
    
    // This function runs when a user hits "select" button next to a product
    // if already added - toggle - remove
    //
    public void addToShoppingCart(){    
        boolean removedFromList = false;
        //maxItemNumber++;
        for(PricebookEntry d : AvailableProducts){
            //match product id
            
            if((String)d.Id==toSelect){
                for(Integer idx=0;idx<shoppingCart.size();idx++) {
                    OpportunityLineItem oli = shoppingCart.get(idx);
                    //if the product is already added via this page now, it will have product id but no oli id. remove this
                    if(oli.Id == null && oli.PricebookEntryId == d.Id) {
                        shoppingCart.remove(idx);
                        removedFromList = true;
                        break;
                    }
                }
                if(!removedFromList) {
                    //maxItemNumber++;
                    shoppingCart.add(new opportunityLineItem(OpportunityId=theOpp.Id, 
                                                             PriceBookEntry=d, PriceBookEntryId=d.Id,
                                                             Short_Description__c = d.Product2.Description,
                                                             UnitPrice=d.UnitPrice,
                                                             item_number__c = maxItemNumber
                                                             
                                                            ));
                    break;                    
                }
            }
        }        
        updateAvailableList();  
    }
    
    // This function runs when a user hits "remove" on an item in the "Selected Products" section
    public PageReference removeFromShoppingCart(){
        Integer count = 0;
        for(opportunityLineItem d : shoppingCart){
            if((String)d.PriceBookEntryId==toUnselect){
                
                if(d.Id!=null)
                    forDeletion.add(d);
                
                shoppingCart.remove(count);
                break;
            }
            count++;
        }
        updateAvailableList();
        return null;
    }
    
    private Boolean saveItems() {
        // If previously selected products are now removed, we need to delete them
        if(forDeletion.size()>0)
            delete(forDeletion);
        
        // Previously selected products may have new quantities and amounts, and we may have new products listed, so we use upsert here
        try{
            if(shoppingCart.size()>0)
                for(OpportunityLineItem oli :shoppingCart) {
                    if(null ==  oli.OpportunityId)
                        oli.OpportunityId = theOpp.id;
                }
            // theOpp.Ship_To__c = 'sample shipto';
            update theOpp;
            //if(addressList.size() > 0 || selectedAddress == null) {
            //  throw new OpportunityException ('Please select one ship to address');
            //}
            if(!theOpp.In_Approval__c)
                upsert(shoppingCart);
            else{
                errorInSaving = true;
                //saveItems 
                ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Record cannot be edited as an approval is pending on opportunity record');
                ApexPages.addMessage(errorMsg);
                return false;
            }
            system.debug('The bom is***' + theOpp.Explode_BOM__c);
        }
        catch(Exception e){
            errorInSaving = true;
            system.debug('Exception  is' + e.getMessage() + e.getStackTraceString());
            //ApexPages.addMessages(e);
            if(e.getMessage().contains(
                'Opportunity Process')) {        
                    if (e.getMessage().contains('This approval request requires the next approver to')) {
                        ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 
                                                                           'Please select the approver on the opportunity records before changing the pricing');
                        ApexPages.addMessage(errorMsg);
                        
                    } else{
                        ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'System is restricting this record from being edited.' +
                                                                           'Either the approver is not set on the Opty record or an approval is pending. '
                                                                          );
                        ApexPages.addMessage(errorMsg);
                    }
                }else if(e.getMessage().contains('An approver must be selected before applying any discounts')) {
                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 
                                                                       'An approver must be selected before applying any discounts');
                    ApexPages.addMessage(errorMsg);
                } else if(e.getMessage().contains('Approver field cannot be blank if an approver has been previously selected')) {
                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Approver field cannot be blank if an approver has been previously selected.');
                    ApexPages.addMessage(errorMsg);
                } else if(e.getMessage().contains('Please select one ship to address')){
                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR,
                                                                       'Please select one ship to address');
                    ApexPages.addMessage(errorMsg);
                }
            else{
                ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'System is restricting this record from being edited.' +
                                                                   'Either the approver is not set on the Opty record or an approval is pending. '
                                                                  );
                ApexPages.addMessage(errorMsg);
            }
            
            
            
            
            return false;
        }
        return true;
    }   
    
    public PageReference onSave(){
        Boolean ret = saveItems();
        if (!ret) {
            ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Products not found');
            ApexPages.addMessage(errorMsg);
            errorInSaving = true;
            return null;
        }
        
        // After save return the user to the Opportunity
        return new PageReference('/' + ApexPages.currentPage().getParameters().get('Id'));
    }
    
    // If user hits cancel we commit no changes and return them to the Opportunity   
    public PageReference onCancel(){
        return new PageReference('/' + ApexPages.currentPage().getParameters().get('Id'));
    }
    
    public PageReference showCart(){
        PageReference editProductsStep = Page.AddProductWizardPage2;
        return editProductsStep;
    }
    
    public PageReference showSearch(){
        PageReference searchStep = Page.AddProductWizardPage1;
        return searchStep;
    }
    
    // This simply returns a PageReference to the standard Pricebook selection screen
    // Note that is uses retURL parameter to make sure the user is sent back after they choose
    public PageReference changePricebook(){
        PageReference ref = new PageReference('/oppitm/choosepricebook.jsp');
        ref.getParameters().put('id',theOpp.Id);
        ref.getParameters().put('retURL','/apex/opportunityProductEntry?id=' + theOpp.Id);
        return ref;
    }
    
    // This fetches the price for all opportunityLineItems on the page from SAP via 
    // a web service callout. It then updates the unit price per opportunityLineItem
    // or displays error if there was any. 
    public PageReference updatePrice(Boolean withDML) {
        errorInSaving = false;
        Boolean saveReturn;
        PriceRequest priceRequest = new PriceRequest();
        //Build Price Request object from parameters: ConfigParams, Header, ProductList
        //Request: SAP Pricing web service HTTP configuration parameters
        priceRequest.configParams.timeout = 30000;
        
        if (null == theOpp) {
            return null;
        }
        if(null != theOpp.Id) {
            
        }
               system.debug('THe new opp values' + theOpp.ID);
        
        //Request:HEADER
        priceRequest.header.customerNumber = theOpp.Account.Customer_Number__c; 
        priceRequest.header.salesOrg = theOpp.Sales_Organisation_Code__c; //'1000';
        priceRequest.header.distributionChannel = theOpp.Distribution_Channel_Code__c; //'10';
        priceRequest.header.division = theOpp.Division__c; //'00';
        system.debug('The values' + theOpp.Quotes_Title__c + theopp.Explode_BOM__c + theopp.Discount_Overall__c + theopp.Discount_Overall_Percent__c  );
        priceRequest.title = theOpp.Quotes_Title__c;
        priceRequest.discountOverall = String.valueOf(theOpp.Discount_Overall__c);
        priceRequest.discountPercentage = String.valueOf(theOpp.Discount_Overall_Percent__c);
        priceRequest.headerText = theOpp.Quotes_Intro__c;
        system.debug('The bom is ' + theOpp.Explode_BOM__c );
        priceRequest.isBomExploded = theOpp.Explode_BOM__c;
        priceRequest.INT_NUMBER_ASSIGNMENT = 'X'; 
        //Request:PRODUCTS
        List<ProductLineItem> requestProductList = new List<ProductLineItem>();
        Map<Integer,ProductLineItem> itemNoProductMap = new Map<Integer,ProductLineItem> ();
        ProductLineItem product;
        for(opportunityLineItem d:shoppingCart){
            
            system.debug('OLI is ' + d.PriceBookEntry.Product2.Name );
            product = new ProductLineItem();
            
            product.productCode = d.PriceBookEntry.Product2.Name; //'AR-7200';
            //PriceBookEntry.Product2.Name
            product.quantity = String.valueOf(d.Quantity); //'1';
            product.uom = d.UOM__c; //'BX';
            product.shortDescription = d.Short_Description__c;
            product.lineDescription = d.Description;
            product.discount = d.Discount_Absolute__c ;
            product.discountPercent = d.Discount_per__c;  
            product.material = d.Product_Name__c;
            product.itemNumber = Integer.valueOf(d.item_number__c);
            product.priceOverdue = d.price_override__c;
            product.groupItem = d.Group_Item__c;
            system.debug('Category is' + d.Category__c);
            product.category = d.Category__c;
            itemNoProductMap.put(Integer.valueOf(d.Item_Number__c),product);
            requestProductList.add(product);
        }
        priceRequest.productList = requestProductList;
        priceRequest.productMap = itemNoProductMap;
        priceRequest.generateQuote = 'X';  
        priceRequest.SF_OPTY_ID = theOpp.id;
        priceRequest.SALESREP = theOpp.Owner.FederationIdentifier ;
        priceRequest.KUNWE = theOpp.Ship_To__c;
        //SAP web service callout
        PriceResponse priceResponse = new PriceResponse();
        SAPWSCallout callout = new SAPWSCallout();
        try {
            system.debug('Calling WS');
            priceResponse = callout.getQuotes(priceRequest);
            
        } catch (Exception e) {
            if(e.getMessage().contains('Web service callout failed')) {
                system.debug('Exception ' + e.getMessage());
                ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 
                                                                   ' Web service callout failed. Please contact your system administrator');
                ApexPages.addMessage(errorMsg);
                return null;
            }
            ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.WARNING, e.getMessage());
            ApexPages.addMessage(errorMsg);
            return null;
        }
        
        //System.debug('Response ' + priceResponse.toString());
        
        //Update shoppingCart with UnitPrice or error
        
        if (null != priceResponse && null != priceResponse.responseStatus && null !=priceResponse.responseStatus.result
            && priceResponse.responseStatus.result.equals('SUCCESS')) {
            addressList =  new List<SelectOption>();
            for(String shipToAddress : priceResponse.shiptoAddressMap.keySet() ) {
                if(null != priceResponse.shiptoAddressMap.get(shipToAddress) )
                    system.debug('THe map values are' + shipToAddress + priceResponse.shiptoAddressMap.get(shipToAddress) );
                    //
                    addressList.add(new SelectOption(shipToAddress,priceResponse.shiptoAddressMap.get(shipToAddress))); 
                if(null == theOpp.Ship_To__c && priceResponse.shiptoAddressMap.keySet().size() == 1) {
                    
                    theOpp.Ship_To_key__c = priceResponse.shiptoAddressMap.get(shipToAddress);
                       
                    theOpp.Ship_To__c =  shipToAddress;
                    system.debug('Setting the shipto address' +  theOpp.Ship_To_key__c + theOpp.Ship_To__c );
                    break;
                }
                
            }
            system.debug('The size of the list is ' + addressList.size());
            
            
            
            List<OpportunityLineItem> toBeAdded = new List<OpportunityLineItem>();
           // Map<Integer,OpportunityLineItem> responseProducts = priceResponse.optyLineItems;
            Map<String,OpportunityLineItem> responseProdLineItems = priceResponse.productLineItems;
            Integer i = 0;
            //for(OpportunityLineItem opportunityLineItem : priceResponse.optyLineItems.values()) {
            for (opportunityLineItem d:shoppingCart) {
                OpportunityLineItem productLineItem;
                if(null != d.PriceBookEntry.Product2.Name ) {
                    // productLineItem = responseProducts.get(Integer.valueOf(d.Item_Number__c));
                    //system.debug('Prod');
                    productLineItem = responseProdLineItems.get(d.PriceBookEntry.Product2.Name);
                    //priceResponse.optyLineItems.remove(Integer.valueOf(d.Item_Number__c));
                    system.debug('Removing the product name'+d.PriceBookEntry.Product2.Name);
                    priceResponse.productLineItems.remove(d.PriceBookEntry.Product2.Name);
                    system.debug('List after removal is '+priceResponse.productLineItems);
                    
                } else {
                    productLineItem = d;
                }
                if (null != productLineItem) {
                    d.Category__c = productLineItem.Category__c;
                    d.List_Price__c = productLineItem.List_price__c;
                    d.TotalPrice__c = productLineItem.TotalPrice__c;
                    d.Item_Number__c = productLineItem.Item_Number__c;
                    d.Group_Item__c = productLineItem.Group_Item__c;
                    if (productLineItem.quantity != 0.0 && productLineItem.UnitPrice > 0) { //Avoid division by zero
                        d.UnitPrice = productLineItem.UnitPrice;//Decimal.valueOf(productLineItem.quantity);
                        d.UnitPrice = d.UnitPrice.setScale(2, RoundingMode.HALF_UP);
                    }
                    system.debug('Price total' + d.TotalPrice__c+ '');
                } 
                i++;
            }
            List<OpportunityLineItem> dummyShoppingCart = shoppingCart;
            if(priceResponse.productLineItems != null && priceResponse.productLineItems.values().size() > 0 && theOpp.Explode_BOM__c)       {
                system.debug('Adding to the list' +priceResponse.optyLineItems.values());
                shoppingCart.addAll(priceResponse.productLineItems.values());
            }
            
            
            system.debug('The lineItem List is' + priceResponse.optyLineItems.size());
            if(withDML){
                saveReturn = saveItems();
                
                if (!saveReturn) {
                    errorInSaving = true;
                    system.debug('Error in saving opportunity line item');
                    String errorStr = 'Error in saving opportunity line item(s).';
                    errorInSaving = true;
                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, errorStr);
                    ApexPages.addMessage(errorMsg);
                    
                    return null;
                }     
            }
        } else { //ERROR
            String responseErrorStr = 
                'Error in request [' + priceResponse.responseStatus.errorSource + '].' + 
                'Error in [' + priceResponse.responseStatus.erringEntity + '].' + 
                'Error Detail: [' + priceResponse.responseStatus.errorDetail + '].' ;
            ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR, responseErrorStr);
            ApexPages.addMessage(errorMsg);
            return null;
        }
        
        // After save return the user to the Opportunity
        return new PageReference('/' + ApexPages.currentPage().getParameters().get('Id'));
    }
    
    private void fetchAllUnitsOfMeasure(Map<String, String> allUoMs) {
        List<UOM_Map__mdt> uomList = [SELECT MasterLabel, DeveloperName FROM UOM_Map__mdt];
        for (UOM_Map__mdt uom: uomList) {
            allUoMs.put(uom.DeveloperName, uom.MasterLabel);
        }
    }
    
    public List<Device_Plant__c> getPlants() {
        List<Device_Plant__c> pList = [SELECT Name FROM Device_Plant__c];
        plantList = pList;
        return pList;
    }
    
    
    public PageReference updatePrice() {
        return updatePrice(true);
        
    }
}