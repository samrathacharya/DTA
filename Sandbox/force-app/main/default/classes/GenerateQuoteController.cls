public class GenerateQuoteController {

    public string generateQuote(Id optyId){
        Opportunity theOpp = [select Id, Pricebook2Id, PriceBook2.Name,
                             Account.Customer_Number__c, Sales_Organisation_Code__c, Distribution_Channel_Code__c, Division__c,
                              Discount_Overall_Percent__c,Discount_Overall__c,Explode_BOM__c,Quotes_Title__c,Quotes_Intro__c,
                              OwnerId,ship_to__c,
                              Owner.FederationIdentifier 
                      from Opportunity where Id  =: optyId ];
        
        try {
        	ProcessInstance pis = [SELECT Id, status FROM ProcessInstance 
                                   WHERE TargetObjectId =: optyId ORDER BY systemmodstamp DESC limit 1];
            if(pis.status == 'Rejected') { 
            	return 'The quote was rejected by the approver, cannot generate a quote';
            } else if (pis.status == 'Removed') {
                return 'The quote was recalled and needs to be resubmitted for approval, cannot generate a quote';
            }
            
        } catch(Exception e) {
            system.debug(e.getMessage());
        }
        if(Approval.isLocked(optyId)) {
            system.debug('The record is locked for approval, cannot generate a quote');
            return 'The record is locked for approval, cannot generate a quote';
        }
        String docNumber;
        List<OpportunityLineItem> shoppingCart = [select Id, Quantity, TotalPrice, UnitPrice, Description, 
                        UOM__c,LastModifiedDate,ServiceDate , Product_Name__c, Group_Item__c,price_override__c,Discount_per__c, Discount_Absolute__c ,
                        Short_Description__c,Item_Number__c,Category__c,ListPrice,
                        PriceBookEntryId, PriceBookEntry.Name, PriceBookEntry.IsActive, 
                        PriceBookEntry.Product2Id, PriceBookEntry.Product2.Name, PriceBookEntry.Product2.AvailableUOMs__c,
                        PriceBookEntry.Product2.Product_Code_Id__c,
                        PriceBookEntry.PriceBook2Id from opportunityLineItem where OpportunityId=:theOpp.Id];
        PriceRequest priceRequest = new PriceRequest();

        //Build Price Request object from parameters: ConfigParams, Header, ProductList

        //Request: SAP Pricing web service HTTP configuration parameters
		priceRequest.configParams.timeout = 30000;
        
        //Request:HEADER
		priceRequest.header.customerNumber = theOpp.Account.Customer_Number__c; //'0001001998';
        priceRequest.header.salesOrg = theOpp.Sales_Organisation_Code__c; //'1000';
        priceRequest.header.distributionChannel = theOpp.Distribution_Channel_Code__c; //'10';
        priceRequest.header.division = theOpp.Division__c; //'00';
     	priceRequest.title = theOpp.Quotes_Title__c;
        priceRequest.discountOverall = String.valueOf(theOpp.Discount_Overall__c);
        priceRequest.discountPercentage = String.valueOf(theOpp.Discount_Overall_Percent__c);
        priceRequest.isBomExploded = theOpp.Explode_BOM__c;
        priceRequest.INT_NUMBER_ASSIGNMENT = 'X';
        priceRequest.headerText = theOpp.Quotes_Intro__c;
       
        priceRequest.KUNWE = theOpp.Ship_To__c;
		 system.debug('The default address is for request' +priceRequest.KUNWE );
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
            product.category = d.Category__c;
            product.groupItem = d.Group_Item__c;
            
            itemNoProductMap.put(Integer.valueOf(d.Item_Number__c),product);
            requestProductList.add(product);  
        }
		priceRequest.productList = requestProductList; 
		priceRequest.productMap = itemNoProductMap;
        priceRequest.generateQuote = '';
        priceRequest.SF_OPTY_ID = theOpp.id;
        priceRequest.SALESREP = theOpp.owner.FederationIdentifier ;
       
        //SAP web service callout
		PriceResponse priceResponse = new PriceResponse();
		SAPWSCallout callout = new SAPWSCallout();
        try { 
            system.debug('Calling WS');  
        	priceResponse = callout.getQuotes(priceRequest);
            //system.debug('The default address is ' + priceResponse.E_KUNWE);
            if(null != priceResponse && null!= priceResponse.pdfString  ) {
                //system.debug('The pdf string is ' + priceResponse.pdfString);
                 docNumber = createAttachment(priceResponse.pdfString, theOpp.Id, priceResponse.documentNumber);
            }
        } catch (Exception e) {
            system.debug('e.getMessage()' + e.getMessage());
            
        } 
    return docNumber;
    }
    
@TestVisible     
    private static string createAttachment(String pdfString, Id optyId, String docNumber) {
        
        ContentVersion conVer = new ContentVersion();
        conVer.ContentLocation = 'S'; // S specify this document is in SF, use E for external files
        conVer.PathOnClient = 'quote.pdf'; // The files name, extension is very important here which will help the file in preview.
        conVer.Title = docNumber + '_' + System.now() + '.pdf'; // Display name of the files
        conVer.VersionData = EncodingUtil.base64Decode(pdfString); // converting your binary string to Blog
        insert conVer;
        Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
        ContentDocumentLink cDe = new ContentDocumentLink();
        cDe.ContentDocumentId = conDoc ;
        cDe.LinkedEntityId = optyId; // you can use objectId,GroupId etc
        cDe.ShareType = 'I'; // Inferred permission, checkout description of ContentDocumentLink object for more details
        //cDe.Visibility = 'InternalUsers';
        insert cDe;
        //insert conVer;
        
        return conVer.Title;
    }

}