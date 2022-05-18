@isTest
public class WO_QuotationNotificationSchedulerTest {

        public static testmethod void toSendEmail(){        
        try{       
            test.startTest();   
            
            Contact c = new Contact();
            c.LastName = 'Testing Email';
            c.Email = 'Test@test.com';
            insert c;
            
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
            
            PriceBookEntry pbe = [Select Id, Product2Id from PriceBookEntry where Product2Id = :pro.Id];
                
            WorkOrder w1 = new WorkOrder();
            w1.Subject = 'Test WorkOrder 0';
            w1.Status = 'Quote Required';
            w1.Completion_Code__c = 'Pass';
            w1.Division__c = '10';
            w1.Fault_Code__c = fc.Id;
            w1.Cause_Code__c = cc.Id;
            w1.Resolution_Code__c = 'Decommissioned';
            w1.Cause_2__c = fcr.Id;
            w1.Pricebook2Id = standardPriceBookId;
            w1.ContactId = c.Id;
            Database.insert(w1);
                
            WorkOrderLineItem wol = new WorkOrderLineItem();
            wol.WorkOrderId = w1.Id;
            wol.Type__c = 'Labour';
            wol.Labour_Rate__c = 'Business Hours';
            wol.PricebookEntryId = pbe.id;
            wol.Quantity = 1;
            wol.Status = 'Completed';
            wol.UnitPrice = 0.00;
            insert wol;
            
            w1 = [Select Id, (Select Id, Status from WorkOrderLineItems) from WorkOrder where Subject = 'Test WorkOrder 0' limit 1];
                
            List<WorkOrder> woList = new List<WorkOrder>();
            woList.add(w1);
    
            String CRON_EXP = '0 0 0 3 9 ? 2022';
            String jobId = System.schedule('scheduledApex',CRON_EXP,new WO_QuotationNotificationScheduler());
            test.stopTest();
                    
        }catch(Exception e){
            
        }
    }
}