@isTest
public class WOLITriggerHandlerTest {
    
    public static testmethod void deleteCheck(){
        Test.startTest();
        
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Device Tech Service'];
        
        User u1 = new User(Alias = 'sysTech', Email='sysTech@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='TestingTech', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p1.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='sysTech@ingenuity.com.au');
        Database.insert(u1);
        
        system.runAs(u1){  
            
            
            Fault_Code__c fc = new Fault_Code__c();
            fc.Name = 'Ancillary';
            fc.Division__c = '10';
            fc.Fault_Code__c = 'FLT_00005';
            insert fc;
            
            Cause_Code__c cc = new Cause_Code__c();
            cc.Fault_Code__c = fc.Id;
            cc.Name = 'Blockage';
            cc.Active__c = true;
            cc.Cause_Code__c = 'CCC-0001';
            insert cc;
            
            Fault_Cause_Relationship__c fcr = new Fault_Cause_Relationship__c();
            fcr.Fault_Code__c = fc.Id;
            fcr.Cause_Code__c = cc.Id;
            fcr.Active__c = true;
            fcr.Name = 'test fcr';
            fcr.Key__c = '123';
            insert fcr;
            
            Product2 pro = new Product2(Name = 'Test Product', Product_Code_ID__c = 'Test Product', IsActive =true);
            Insert pro;
            
            Id standardPriceBookId = Test.getStandardPricebookId();
            
            PriceBookEntry pbe = [Select Id, Product2Id from PriceBookEntry where Product2Id = :pro.Id limit 1];
                
            WorkOrder w1 = new WorkOrder();
            w1.Subject = 'Test WorkOrder 0';
            w1.Status = 'Technically Complete';
            w1.Completion_Code__c = 'Pass';
            w1.Division__c = '10';
            w1.Fault_Code__c = fc.Id;
            w1.Cause_Code__c = cc.Id;
            w1.Resolution_Code__c = 'Decommissioned';
            w1.Cause_2__c = fcr.Id;
            w1.Pricebook2Id = standardPriceBookId;
            Database.insert(w1);
               
            WorkOrderLineItem wol = new WorkOrderLineItem();
            wol.WorkOrderId = w1.Id;
            wol.Type__c = 'Labour';
            wol.Labour_Rate__c = 'Business Hours';
            wol.PricebookEntryId = pbe.id;
            wol.Quantity = 1;
            wol.Status = 'New';
            wol.UnitPrice = 0.00;
            insert wol;
            
            WorkOrderLineItem wol1 = [SELECT Id, Status FROM WorkOrderLineItem WHERE Id = :wol.Id ];
            wol1.Status = 'Closed';
            
            update wol1;

            try{
                delete wol1;
            }catch(Exception e){
               System.assertEquals(e.getMessage().contains('You are not allowed to delete Closed Work Order Line Item records'),true);
            }
        
    	}      
                  
		Test.stopTest();
            
    }

}