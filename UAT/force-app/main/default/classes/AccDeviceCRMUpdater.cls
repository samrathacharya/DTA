/*
 * Name: AccDeviceCRMUpdater
 *       REST API Entry Point
 * 
 * Purpose: Class to handle update/Insert
 */ 
public class AccDeviceCRMUpdater {
    public static boolean updateoperation(String Customer_Number, String Name1, String Name2, String BillingStreet,String BillingCity,String BillingState,String BillingPostalCode,String BillingCountry, String Industry, String SalesGroup, String SalesDistrict, String Telephone_no) {
        List<Account> accountlist = new List<Account>();
        boolean updated = False;
        accountlist = [SELECT Id,Customer_Number__c,Name,Name_Other__c,BillingAddress FROM Account WHERE Customer_Number__c = :Customer_Number limit 1]; 
        if(accountlist.size()>0){
            Account account = new Account();
            account.Customer_Number__c = Customer_Number;
            account.Name = Name1;
            account.Name_Other__c = Name2;
            account.BillingCity = BillingCity;
            account.BillingCountry = BillingCountry;
			account.BillingStreet = BillingStreet;
            account.BillingPostalCode = BillingPostalCode;
            account.BillingState = BillingState;
            account.Industry = Industry;
            account.Sales_Group__c = SalesGroup;
            account.Sales_District__c = SalesDistrict;
            account.Phone = Telephone_no;
            upsert account Customer_Number__c;
            updated = True;
        } 
        
        return updated;
        
    }
        public static Id insertoperation(String Customer_Number, String Name1, String Name2, String BillingStreet, String BillingCity,String BillingState,String BillingPostalCode,String BillingCountry, String Industry, String SalesGroup, String SalesDistrict, String Telephone_no) {
        	RecordType objRecType = [SELECT Id,Name,SobjectType FROM RecordType where Name = 'Sell to Account' limit 1];
            Account account = new Account();
            account.RecordTypeId = objRecType.Id;
            account.Customer_Number__c = Customer_Number;
            account.Name = Name1;
            account.Name_Other__c = Name2;
            account.BillingCity = BillingCity;
            account.BillingStreet = BillingStreet;
            account.BillingCountry = BillingCountry;
            account.BillingPostalCode = BillingPostalCode;
            account.BillingState = BillingState;
            account.Industry = Industry;
            account.Sales_Group__c = SalesGroup;
            account.Sales_District__c = SalesDistrict;
            account.Phone = Telephone_no;
            insert account;
            return account.Id;
        }
}