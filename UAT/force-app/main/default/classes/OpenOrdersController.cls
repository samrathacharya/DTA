public with sharing class OpenOrdersController {

    @AuraEnabled
    public static String getOpenOrders(String accountRecordId) {
        String ret = null;
        List<SalesOrderItem> salesOrderList;
        Account theAccount = null;
        
        List<Account> accounts = [
            SELECT Id, Name, Customer_Number__c
            FROM Account
            WHERE Id = :accountRecordId
        ];
        if (accounts.size() > 0) {
            theAccount = accounts[0];
        } else {
        	theAccount = null;
            return null;
        }
        
        SAPWSCallout callout = new SAPWSCallout();
        OpenOrderRequest orderRequest = new OpenOrderRequest();
        orderRequest.customerNumber = theAccount.Customer_Number__c;
        
        String userId = UserInfo.getUserId();
        String salesOrg = [SELECT Sales_Orgs__c FROM User WHERE Id = :userId].Sales_Orgs__c;
        orderRequest.salesOrganisation = salesOrg;
        
        //XXX: Temporary requirement: DocumentDate, DocumentDateTo. Set to null later.
        orderRequest.documentDate = null; //'2019-01-01';
        orderRequest.documentDateTo = null; //'2019-03-31';
        
        // WEB SERVICE CALLOUT
        OpenOrderResponse orderResponse = callout.getOpenOrders(orderRequest);
        if (orderResponse == null) {
            ret = 'There was an error retrieving Open Orders. Please advise your Administrator.';
            ret = JSON.serializePretty(ret);
        } else {
            System.debug('orderResponse is NOT null');
        	salesOrderList = orderResponse.salesOrderList;
	        ret = JSON.serializePretty(salesOrderList);
        }
        
        return ret;
        
    }
}