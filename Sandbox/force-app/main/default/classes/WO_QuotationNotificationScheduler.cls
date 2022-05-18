public class WO_QuotationNotificationScheduler implements Schedulable {

    public void execute(SchedulableContext sc){
        
        String queryString = 'SELECT Id,Contact.Name, Contact.Email FROM WorkOrder WHERE Status = \'Quote Required\'';
        if(!Test.isRunningTest()){
            Date date_7 = System.today()-7;
            Datetime ed = Datetime.newInstance(date_7.year(),date_7.month(),date_7.month(),23,59,59);
            queryString += 'AND CreatedDate >= '+ed +'AND CreatedDate <= '+ed;
        }
        List<WorkOrder> reminderOrders = Database.query(queryString);
        
        for(Workorder wo:reminderOrders){
            sendEmail(wo.Id,wo.Contact.Name, wo.Contact.Email);
        }
    }
    
    public static void sendEmail(String workOrderId, String name, String email){
        
        String emailBody = 'Dear '+name+',<br/><br/>Quotation XX is close to expiry and requires a Purchase Order to proceed.';
        emailBody += '<br/><br/> Please attach a copy of your Purchase Order in a response to this email.';
        emailBody += '<br/><br/> Please contact our Technical Service Department for any further assistance. Ph: 1800 429 981';
        emailBody += '<br/><br/> * Attachments of Quotation PDF';
		Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
		
        //List<Document> documents = [Select Id, Name, Body, ContentType, DeveloperName, Type From Document Where DeveloperName = 'Customer_Email_Header' LIMIT 1];

        List<ContentVersion> contents = [SELECT Id,FileType,title FROM ContentVersion WHERE title = '00000030_V1'];
		
        List<String> docIds = new List<String>();
        for(ContentVersion c:contents){
            docIds.add(c.Id);
        }
        
        String[] sendingTo = new String[]{email};
		semail.setToAddresses(sendingTo);
        
		semail.setSubject('Reminder - Purchase Order Required');
		semail.setHtmlBody(emailBody);
        
        //semail.setTargetObjectId(workOrderId);
        semail.setSaveAsActivity(true);
        if(docIds.size() > 0){
           semail.setEntityAttachments(docIds);
        }
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
    }
}