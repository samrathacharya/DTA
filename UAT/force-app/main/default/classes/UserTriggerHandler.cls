public class UserTriggerHandler {
	public static void checkIfCTIAccess(List<User> userList) {
        CallCenter callCenterRec = [Select Id, InternalName from CallCenter where InternalName = :Label.Call_Center_Name limit 1];
        for(User u: userList){
            if(u.CallCenterId != null && u.CallCenterId == callCenterRec.Id){
                if(u.CXone_AgentId__c == '' || u.CXone_AgentId__c == null){
                    u.addError('CXOne Agent ID should be populated if user has CTI access');
                }
            }            
        }
  	}
}