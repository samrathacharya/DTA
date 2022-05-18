@isTest
public class WorkOrder_BeforeDeleteTest {
    
    public static testmethod void deleteStatus(){
        Test.startTest();
        
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Device Tech Service'];
        
        User u1 = new User(Alias = 'sysTech', Email='sysTech@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='TestingTech', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p1.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='sysTech@ingenuity.com.au');
        Database.insert(u1);
        
        system.runAs(u1){  
            
            WorkOrder w1 = new WorkOrder();
           	w1.Subject = 'Test WorkOrder 0';
            w1.Status = 'Logged';
            Database.insert(w1);
            
            delete w1;
            WorkOrder rec = [SELECT Id, IsDeleted FROM WorkOrder WHERE Id = :w1.Id ALL ROWS];
            System.assertEquals(rec.IsDeleted, true);
        
    	}
        
        system.runAs(u1){

            WorkOrder w2 = new WorkOrder();
           	w2.Subject = 'Test WorkOrder 2';
            w2.Status = 'Awaiting Allocation';
            Database.insert(w2);
            
            try{
                delete w2;
            }catch(Exception e){
               System.assertEquals(e.getMessage().contains('You are not allowed to delete Work Order records'),true);
            }   
        }    

        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'Delete_Work_Order_Records'];
        insert new PermissionSetAssignment(AssigneeId = u1.Id, PermissionSetId = ps.Id);
        
        system.runAs(u1){  
            
            WorkOrder w1 = new WorkOrder();
           	w1.Subject = 'Test WorkOrder 1';
            w1.Status = 'Awaiting Allocation';
            Database.insert(w1);
            
            delete w1;
            WorkOrder rec = [SELECT Id, IsDeleted FROM WorkOrder WHERE Id = :w1.Id ALL ROWS];
            System.assertEquals(rec.IsDeleted, true);
        
    	}
                  
		Test.stopTest();
            
    }

}