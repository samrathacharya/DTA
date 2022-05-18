public class WorkOrderTriggerHandler {
	public static void beforeDeleteWOStatus(List<WorkOrder> woList) {
        Boolean hasPermission = FeatureManagement.checkPermission('Delete_Work_Order');
        for(WorkOrder wo : woList) {
          if(!(wo.status == 'New' || wo.status == 'Logged' || hasPermission)){
                wo.addError('You are not allowed to delete Work Order records');
            } 
        }
  }
}