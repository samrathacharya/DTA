public class WorkOrder_StatusUpdateBatch implements Database.Batchable<Sobject>, Schedulable, Database.stateful {

    String queryString='';
    public WorkOrder_StatusUpdateBatch(){
        queryString = 'SELECT Id,Status,(SELECT Id,Status FROM WorkOrderLineItems) FROM WorkOrder WHERE (Status = \'Technically Complete\' AND TotalPrice = 0) OR (Status = \'Technically Complete\' AND TotalPrice > 0 AND (Blanket_Purchase_Order__c != NULL OR Purchase_Order_Number__c !=NULL))';
    }
    
    //Batch class start method doing the query and getting the required records to update
    public Database.QueryLocator start(Database.BatchableContext BC) {         
        return Database.getQueryLocator(queryString);
    }
    
    //Execute method to update the status to Completed if all the work line item records are completed
    public void execute(Database.BatchableContext BC, List<SObject> scope){
        List<WorkOrder> statusUpdatedRecords = new List<WorkOrder>();
        for(Sobject s : scope){
            WorkOrder wo = (WorkOrder) s;
            Boolean isAllAreCompleted = false;
            for(WorkOrderLineItem wol: wo.WorkOrderLineItems){
                if(wol.status == 'Completed'){
                    isAllAreCompleted = true;
                }
                else{
                    isAllAreCompleted = false;
                    break;
                }
            }
            if(isAllAreCompleted){
                WorkOrder w = new WorkOrder();
                w.Id = wo.Id;
                w.Status = 'Completed';
                statusUpdatedRecords.add(w);
            }
        }
        try {
            // Update the Work Order records
            if(!statusUpdatedRecords.isEmpty()){
              update statusUpdatedRecords;   
            }
         
        } catch(Exception e) {
        }
      
    }    
    
    public void finish(Database.BatchableContext BC){
        
    }  
    
    public void execute(SchedulableContext sc) {
        WorkOrder_StatusUpdateBatch batch = new WorkOrder_StatusUpdateBatch ();
        database.executeBatch(batch);
    }
}