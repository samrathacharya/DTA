public class WorkOrder_DivisionUpdateBatch implements database.Batchable<SObject>, system.Schedulable {
    
    Public String queryString;
    public WorkOrder_DivisionUpdateBatch() {
		queryString = 'Select Id, StatusCategory, Division__c, Asset_Product__r.Division__c from WorkOrder where WorkOrder.StatusCategory = \'New\'';
        queryString += 'and WorkOrder.Asset_Product__c IN (Select Product2Id from Product2History where Field = \'Division__c\' and CreatedDate = YESTERDAY)';
    }
    
    Public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(queryString);     
    }
    
    Public void execute(Database.BatchableContext BC, List<WorkOrder> workOrders) {
        List<WorkOrder> newWorkOrderList = new List<WorkOrder>();
        for(WorkOrder wo: workOrders){
            WorkOrder w = new WorkOrder();
            w.Id = wo.Id;
            w.Division__c = wo.Asset_Product__r.Division__c;
            newWorkOrderList.add(w);
        }
        if(newWorkOrderList.size()>0){
        	Database.update(newWorkOrderList);
        }
    }
    
    Public void finish(Database.BatchableContext BC) {

    }
    
    Public void execute(System.SchedulableContext SC) {
		database.executeBatch(new WorkOrder_DivisionUpdateBatch());
    }
    
}