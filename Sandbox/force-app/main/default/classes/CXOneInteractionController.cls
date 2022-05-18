public with sharing class CXOneInteractionController {
    @AuraEnabled
    public String statusResponse {get;set;}
	@AuraEnabled
    public static String endInteraction(String recordId) {
        Case caseRec = [Select Id, CXone_ContactId__c from Case where Id = :recordId limit 1];
        
        String token; 
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://au1.nice-incontact.com/authentication/v1/token/access-key');
        req.setMethod('POST');
        
        Map<String,String> o = new Map<String,String>();
        o.put('accessKeyId','6UMZXL26ZRK6WSDABS7STSCQQH46YSGGYFWNEZKPTKRM36IR5WSQ====');
        o.put('accessKeySecret','JAB6U4HOAK4CW2CES7BTXXB2Z37H5UTOAHHSPNPEDNTCK5RPMCSQ====');
        
        req.setBody(JSON.serialize(o));
        req.setHeader('Content-Type','application/json');
        Http http = new Http();
        HTTPResponse res = http.send(req);
	    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        if(res.getStatusCode() == 200){
         token = (String)results.get('access_token');
        }
        
        if(caseRec.CXone_ContactId__c ==  null)
            caseRec.CXone_ContactId__c = '197095759192';
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api-au1.niceincontact.com/incontactapi/services/v23.0/contacts/'+caseRec.CXone_ContactId__c+'/end');  
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer ' + token);
        request.setHeader('Content-Length', '0');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == Integer.valueOf('202'))
           return 'Ended Interaction successfully in CXOne';
        else
            return response.getStatus();
    }
}