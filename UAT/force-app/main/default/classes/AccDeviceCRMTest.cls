@isTest
public class AccDeviceCRMTest {
    
    @isTest
    static void teste(){
        
        Account acc1= new Account();
        acc1.Customer_Number__c = '123456789';
        acc1.Name = 'Abhinav';
        acc1.Name_Other__c = 'Jain';
        acc1.BillingCity = 'Udaipur';
        acc1.BillingCountry = 'India';
        acc1.BillingPostalCode = '313001';
        acc1.BillingState = 'Rajasthan';
        acc1.Industry = 'Defence';
        acc1.Sales_Group__c = '273';
        acc1.Sales_District__c = 'aj';
        acc1.Phone = '7014326179';
        insert acc1;
        String myJSON = JSON.serialize(acc1);
  
        
        RestRequest request = new RestRequest();
        request.requestUri ='https://devicetechnologies--cloudwerx.lightning.force.com/services/apexrest/accdevicecrm';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueof(myJSON);
        
        RestContext.request = request;	
        String accObj = AccDeviceCRM.doPost('123454436789','Abhinav','Jain','173','Udaipur','Rajasthan','313001','India','Defence','273','aj','7014326179');
        String accObjupd = AccDeviceCRM.doPost('123454436789','Abhinav','Jain','173','Udaipur','Rajasthan','313001','India','Defence','273','aj','7014326179');
    }
}