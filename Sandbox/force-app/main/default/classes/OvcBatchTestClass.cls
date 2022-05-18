global class OvcBatchTestClass implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        List<String> recordIds = new List<String>{'8100l0000009o1rAAA','8100l0000009nZxAAI'};
        String query = 'SELECT Id, ovcSAP_Pricing_Status__c, UnitPrice FROM ContractLineItem WHERE ServiceContractId IN: recordIds';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<ContractLineItem> wList) {
        System.debug('wList');
        System.debug(wList);
        for(ContractLineItem w : wList) {        
            w.ovcSAP_Pricing_Status__c = '';
            w.UnitPrice = 0;
        }
        try {
            update wList;
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}