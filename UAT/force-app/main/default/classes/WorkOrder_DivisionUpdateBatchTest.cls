@isTest
public class WorkOrder_DivisionUpdateBatchTest {

    public static testmethod void statusUpdate(){        
        try{       
            test.startTest();  
            
            Account acc = new Account();
            acc.Name = 'test account';
            insert acc;
            
            Product2 pro = new Product2(Name = 'Test Product', Product_Code_ID__c = 'Test Product', IsActive =true, Division__c = '10');
            Insert pro;
            
            Id standardPriceBookId = Test.getStandardPricebookId();
            
            PriceBookEntry pbe = [Select Id, Product2Id from PriceBookEntry where Product2Id = :pro.Id];
            
            Asset a = new Asset();
            a.Name = 'test asset';
            a.Product2Id = pro.Id;
            a.AccountId = acc.Id;
            insert a;
                
            WorkOrder w1 = new WorkOrder();
            w1.Subject = 'Test WorkOrder 0';
            w1.Status = 'New';
            w1.Pricebook2Id = standardPriceBookId;
            w1.AssetId = a.Id;
            insert w1;
            
            w1 = [Select Id, StatusCategory, Division__c, Asset_Product__r.Division__c from WorkOrder where Id = :w1.Id];
            system.assertEquals(w1.Division__c, '10'); 
                        
            pro.Division__c = '11';
            update pro;
            
            w1 = [Select Id, StatusCategory, Division__c, Asset_Product__r.Division__c from WorkOrder where Id = :w1.Id];
            
            WorkOrder_DivisionUpdateBatch du = new WorkOrder_DivisionUpdateBatch();
            du.start(null);
            du.execute(null, new List<WorkOrder>{w1});
            du.finish(null);
            
            w1 = [Select Id, Division__c from WorkOrder where Id = :w1.Id];

			system.assertEquals(w1.Division__c, '11');            
            
            String cronExp = '0 0 0 ? * * *';
            system.schedule('Test Job', cronExp, new WorkOrder_DivisionUpdateBatch());
            
            test.stopTest();                    
        }catch(Exception e){
            
        }
    }
}