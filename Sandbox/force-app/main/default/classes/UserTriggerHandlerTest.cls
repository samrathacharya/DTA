@isTest
public class UserTriggerHandlerTest {
	public static testmethod void testCheckIfCTIAccess(){
        Test.startTest();
        
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Device Tech Service'];
        CallCenter callCenterRec = [Select Id from CallCenter where InternalName = :Label.Call_Center_Name];
        
        User u1 = new User(Alias = 'sysTech', Email='sysTech@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='TestingTech', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p1.Id, CallCenterId = callCenterRec.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='sysTech@ingenuity.com.au');
        try{
        	Database.insert(u1);
            
        }catch(Exception e){
            
        }    
        
        Test.stopTest();
    }    
}