@isTest
public class CaseAutoResponseEmailTest {
    
	public static testmethod void testSendEmailAfterCaseCreation(){
        Test.startTest();
        
        Group testQueue = new Group(Name='Tech Service General', Type='Queue');
    	insert testQueue;
        
        QueueSobject mappingObject = new QueueSobject(QueueId = testQueue.Id, SobjectType = 'Case');
        System.runAs(new User(Id = UserInfo.getUserId()))
		{
            insert mappingObject;
        }
        
		Id caseCustRT = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Technical Service').getRecordTypeId();        
        Case cs = new Case();
        cs.Subject = 'test subject case';
        //cs.Origin = 'Email';
        cs.SuppliedEmail = 'test@test.com';
        cs.SuppliedName = 'test';
        cs.OwnerId = testQueue.Id;
        cs.RecordTypeId = caseCustRT;
        cs.AutoResponse_Team_Name__c = 'Device Technologies Technical Support';
        insert cs;
        
        cs = [select Id, CaseNumber, Subject, SuppliedEmail, SuppliedName, OwnerId, RecordTypeId, AutoResponse_Team_Name__c from case where id = : cs.Id];
        
        Case_Setting__mdt csMDT = new Case_Setting__mdt();
        csMDT.DeveloperName = 'test';
        csMDT.Auto_Response_Email_Template__c = 'Technical Service Email To Case Auto Response';
        csMDT.Queue_Email__c = 'surgicaltechservice@device.com.au';
        csMDT.Queue_ID__c = testQueue.Id;
        csMDT.Team__c = 'Device Technologies Technical Support';
        
        CaseAutoResponseEmail.InputData idObj = new CaseAutoResponseEmail.InputData();
        idObj.caseRecord = cs;
        idObj.caseSettingMD = csMDT;
        
        CaseAutoResponseEmail.sendEmailAfterCaseCreation(new List<CaseAutoResponseEmail.InputData>{idObj});        
        
        Test.stopTest();
    }
    
}