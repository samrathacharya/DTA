/*
 * Name: AccDeviceCRM
 *       REST API Entry Point
 * 
 * Purpose: Apex based REST service to support Account Creation/Update Salesforce CRM API calls
 */ 
@RestResource(urlMapping='/accdevicecrm/*')
global with sharing class AccDeviceCRM {
    
    @HttpPost
    global static String doPost(String Customer_Number, String Name1, String Name2, String BillingStreet, String BillingCity,String BillingState,String BillingPostalCode,String BillingCountry, String Industry, String SalesGroup, String SalesDistrict, String Telephone_no) {     
        //Update handler function call
        boolean returnValue = AccDeviceCRMUpdater.updateoperation(Customer_Number, Name1, Name2,BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Industry, SalesGroup, SalesDistrict, Telephone_no);
        if(returnValue==true)
        {
            return 'Updated';
        }
        else
        {
            //Insert handler function call
            Id returnValueInsert = AccDeviceCRMUpdater.insertoperation(Customer_Number, Name1, Name2, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Industry, SalesGroup, SalesDistrict, Telephone_no);
         	return returnValueInsert;
        }
    }	
}