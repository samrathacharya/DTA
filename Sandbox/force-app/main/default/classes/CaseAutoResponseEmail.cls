public class CaseAutoResponseEmail {
	public class InputData {
    	@InvocableVariable(label='Case Record' required=false)
        public Case caseRecord;
        @InvocableVariable(label='Case Setting Record' required=false)
        public Case_Setting__mdt caseSettingMD;
    }
    
    @InvocableMethod(label='Send Email after Case Creation')
    public static void sendEmailAfterCaseCreation(List<InputData> response){
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
        for (InputData caseData : response) {
            Case caseRec = caseData.caseRecord;
            Case_Setting__mdt caseMetadata = caseData.caseSettingMD;
            OrgWideEmailAddress owea = new OrgWideEmailAddress();
            owea = [SELECT Id, Address, DisplayName FROM OrgWideEmailAddress WHERE Address = :caseMetadata.Queue_Email__c];
            EmailTemplate emailTemplateObj = [Select id, HtmlValue from EmailTemplate where Name = :caseMetadata.Auto_Response_Email_Template__c];
            Messaging.SingleEmailMessage caseEmail = new Messaging.SingleEmailMessage();
            caseEmail.setOrgWideEmailAddressId(owea.Id);
			caseEmail.setSaveAsActivity(false);
            caseEmail.setToAddresses(new List<String> {caseRec.SuppliedEmail});
            caseEmail.setWhatId(caseRec.Id);
            caseEmail.setTemplateId(emailTemplateObj.Id);
            caseEmail.setSubject('Request '+caseRec.CaseNumber+' has been created');
            String htmlBody = emailTemplateObj.htmlValue;
            Pattern p = Pattern.compile('\\{\\{\\{(.*?)\\}\\}\\}');
            Matcher m = p.matcher(htmlBody);
            while(m.find()) {
                String fieldAPIName = m.group(1).split('\\.')[1];
                htmlBody = htmlBody.replace(m.group(),String.valueOf(caseRec.get(fieldAPIName)));
            }
            caseEmail.setHtmlBody(htmlBody);
            messages.add(caseEmail);
        }
        Messaging.sendEmail(messages);
    }    
}