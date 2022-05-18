/**
 * Created by cxu on 7/02/2017.
 * Adapted by OnVal for Custom Add Products Wizard
 */

public with sharing class FastOpportunityController {
    private static string plantName;
    @AuraEnabled
    public static List<Pricebook2> getPricebooks() {
        List<string> pricebookFields = new List<string> {'Id','Name', 'IsActive'};
        if (checkSObjectAccessibleFSL('Pricebook2', pricebookFields)) {
            List<Pricebook2> pricebooks = [SELECT Id, Name from Pricebook2 where IsActive = true];
            return pricebooks;
        }
        return null;
    }


    @AuraEnabled
    public static List<PricebookEntry> getPricebookEntries(string pricebookId) {
        List<string> pricebookEntryFields = new List<string> {'Id','Name', 'UnitPrice', 'IsActive'};
        List<string> productFields = new List<string> {'Name', 'ProductCode'};
        if (checkSObjectAccessibleFSL('PricebookEntry', pricebookEntryFields)
                && checkSObjectAccessibleFSL('Product2', productFields)) {
            return [
                    SELECT Id, Name, Product2.Name, Product2.ProductCode,
                            UnitPrice
                    FROM PricebookEntry
                    WHERE Pricebook2Id = :pricebookId and IsActive = true limit 100
            ];
        }
        return null;
    }

    @AuraEnabled
    public static Opportunity getOpportunity(string recordId) {
        List<string> opportunityFields = new List<string> {'Id','Name', 'Pricebook2Id', 'Plant__c'};
        List<string> opportunityLineItemFields = new List<string> {'Name', 'Quantity', 'UnitPrice', 'TotalPrice__c', 'ProductCode', 'PricebookEntryId', 'UOM__c', 'ServiceDate', 
            'OpportunityId', 'Availability_Status__c', 'Availability__c'};
        List<string> productFields = new List<string> {'Name'};
        if (checkSObjectAccessibleFSL('Opportunity', opportunityFields)
                && checkSObjectAccessibleFSL('OpportunityLineItem', opportunityLineItemFields)
                && checkSObjectAccessibleFSL('Product2', productFields)) {
            List<Opportunity> opportunities = [
                    SELECT Id, Name, Pricebook2Id, Plant__r.Name,Plant__c,
                    (SELECT Id, Name, Quantity, UnitPrice, TotalPrice__c, ProductCode, 
                            PricebookEntry.Product2.Name, PricebookEntryId, UOM__c, ServiceDate, 
                     		PricebookEntry.Product2.Availability__c, Product_Name__c , Availability_Status__c,Availability__c
                    FROM OpportunityLineItems
                    ORDER BY CreatedDate)
                    FROM Opportunity
                    WHERE Id = :recordId
            ];
            if (opportunities.size() > 0) {
                system.debug('Opty data' +  opportunities[0].Plant__r.Name);
                plantName =  opportunities[0].Plant__r.Name;
                return opportunities[0];
            }
        }
        return null;
    }

    @AuraEnabled
    public static string updateOpportunity(Opportunity opportunity, string pricebookId) {
        try {
            List<string> opportunityFields = new List<string> {'Pricebook2Id'};
            if (checkSObjectUpdatableFSL('Opportunity', opportunityFields)) {
                opportunity.Pricebook2Id = pricebookId;
                system.debug(opportunity);
                update opportunity;
                return '';
            }
            return 'You do not have permission to update Pricebook on opportunity. Contact your salesforce administrator.';
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    @AuraEnabled
    public static List<OpportunityLineItem> updateLineItems(List<OpportunityLineItem> lineItems, string opportunityId) {
        List<OpportunityLineItem> toBeInserted = new List<OpportunityLineItem>();
        List<OpportunityLineItem> toBeUpdated = new List<OpportunityLineItem>();

        Set<Id> newLineItemIds = new Set<Id>();

        for (OpportunityLineItem item : lineItems) {
            if (item.Id != null) {
                toBeUpdated.add(item);
                newLineItemIds.add(item.Id);
            } else {
                toBeInserted.add(item);
            }
        }
        List<OpportunityLineItem> toBeDeleted = new List<OpportunityLineItem>();
        List<string> opportunityLineItemFields = new List<string> {'Id', 'OpportunityId'};
        List<string> updateFields = new List<string> {'Quantity', 'UnitPrice'};
        if (checkSObjectAccessibleFSL('OpportunityLineItem', opportunityLineItemFields)) {
            toBeDeleted = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId = :opportunityId AND Id NOT IN :newLineItemIds];
        }

        try {
            if (checkSObjectUpdatableFSL('OpportunityLineItem', updateFields)) {
                insert toBeInserted;
                update toBeUpdated;
                delete toBeDeleted;

                List<OpportunityLineItem> newLineItems = new List<OpportunityLineItem>();

                newLineItems.addAll(toBeInserted);
                newLineItems.addAll(toBeUpdated);
                newLineItems.sort();
                return newLineItems;
            }
        } catch (Exception e) {
            system.debug(e.getMessage());
        }
        return null;
    }

	@AuraEnabled
	public static boolean removeLineItem(OpportunityLineItem lineItem, string opportunityId) {
		List<OpportunityLineItem> deletionList = new List<OpportunityLineItem>();
		deletionList = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId = :opportunityId AND Id = :lineItem.Id];
		
		try {
			delete deletionList;
		} catch (Exception e) {
			System.debug(e.getMessage());
			return false;
		}
		
        return true;
    }
	
    @AuraEnabled
    public static String updateAvailability(List<OpportunityLineItem> lineItems, string opportunityId) {
        String ret = null;
	  	Map<String,ProductAvailabilityResponse> responseMap = SAPWSCallout.getAvailability(buildRequestList(lineItems,opportunityId));
        for (OpportunityLineItem item : lineItems) {
            if (item.Id != null && responseMap.size() > 0) {
              
                item.availability__C = responseMap.get(item.PricebookEntry.Product2.Name).availability;
            	   system.debug('Availability updated' + item.availability__C);
            }
        	
        }
        //system.debug('Availability updated' + lineItems[0].availability__C);
       	update lineItems;
        return ret;
    }

    private static boolean checkSObjectAccessibleFSL(string SObjectName, List<string> fields) {
        SObjectType sObjectType = Schema.getGlobalDescribe().get(SObjectName);
        Map<String,Schema.SObjectField> fieldMap = sObjectType.getDescribe().fields.getMap();

        for (String fieldToCheck : fields) {
            if (!fieldMap.get(fieldToCheck).getDescribe().isAccessible()) {
                system.debug(fieldToCHeck);
                return false;
            }
        }
        return true;
    }

    private static boolean checkSObjectUpdatableFSL(string SObjectName, List<string> fields) {
        SObjectType sObjectType = Schema.getGlobalDescribe().get(SObjectName);
        Map<String,Schema.SObjectField> fieldMap = sObjectType.getDescribe().fields.getMap();

        for (String fieldToCheck : fields) {
            if (!fieldMap.get(fieldToCheck).getDescribe().isUpdateable()) {
                return false;
            }
        }
        return true;
    }
    @TestVisible
    //build material availability request
    private static List<ProductAvailabilityRequest> buildRequestList(List<OpportunityLineItem> lineItems, String optyId) {
		List<ProductAvailabilityRequest> requestList = new List<ProductAvailabilityRequest>();
        Opportunity opty = [select id, name, plant__r.name from Opportunity where id =: optyId];
        for(OpportunityLineItem oli : lineItems) {
            ProductAvailabilityRequest req = new ProductAvailabilityRequest();
            req.productName = oli.PricebookEntry.Product2.Name;
            req.uom = oli.UOM__c;
           system.debug('oli.Opportunity.Plant__c ' +plantName);
            req.plantCode = opty.plant__r.name;
            requestList.add(req);
        }
        return requestList;
    }

    @AuraEnabled
    public static string  generateQuoteWS(Id optyId) {
     GenerateQuoteController gq = new GenerateQuoteController();
     String atachmentNumber = gq.generateQuote(optyId);
        return atachmentNumber;
    }
}