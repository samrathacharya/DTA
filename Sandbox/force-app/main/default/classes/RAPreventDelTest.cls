@isTest
public class RAPreventDelTest {
	
    static testMethod void delRAAsDeviceTech() {
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Device Tech Service']; 
        Test.startTest();
        User u1 = new User(Alias = 'sysTech', Email='sysTech@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='TestingTech', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p1.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='sysTech@ingenuity.com.au');
        insert u1;
        
        Id raRecordTypeId = Schema.SObjectType.ResourceAbsence.getRecordTypeInfosByName().get('Non Availability').getRecordTypeId();
        ServiceResource sr = new ServiceResource();
        ResourceAbsence ra = new ResourceAbsence();
        
        System.runAs(u1) {
            try{                
                sr.name = 'test';
                sr.RelatedRecordId = u1.Id; 
                sr.IsActive = true;
                insert sr;
                                
                ra.RecordTypeId = raRecordTypeId;
                ra.ResourceId = sr.Id;
                ra.Start = Date.today();
                ra.End = date.today() + 1;
                ra.Type = 'Absent';
                insert ra;
                delete ra;
            }catch(Exception e){
               System.assertEquals(e.getMessage().contains('You are not allowed to delete Non Availability records'),true);
            }    
        }
        
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'Delete_RA_Non_Availability_Records'];
		insert new PermissionSetAssignment(AssigneeId = u1.Id, PermissionSetId = ps.Id);
               
        System.runAs(u1) {
            delete ra;
            ResourceAbsence rec = [SELECT Id, IsDeleted FROM ResourceAbsence WHERE Id = :ra.Id ALL ROWS];
            System.assertEquals(rec.IsDeleted, true);
        }
        Test.stopTest();

    }
}