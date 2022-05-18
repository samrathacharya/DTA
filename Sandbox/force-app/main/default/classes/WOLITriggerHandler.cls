public class WOLITriggerHandler {
	public static void beforeUpdateWOLIStatus(List<WorkOrderLineItem> newList) {
        for(WorkOrderLineItem woli : newList){
            if(woli.status == 'Closed'){
                woli.Record_Lock__c = true;
            }
        }    
  	}
    public static void beforeDeleteWOLIStatus(List<WorkOrderLineItem> oldList) {
    	for(WorkOrderLineItem woli : oldList){
            if(woli.status == 'Closed'){
                woli.addError('You are not allowed to delete Closed Work Order Line Item records');
            }
        }
  	}
}