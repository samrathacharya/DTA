global class zjcSageTest2 extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Updatable {
/* 
 * Generated by Overcast UTC 2021-12-05 22:39:44Z.
 * This class belongs to the zjcSageTest2 Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class zjcSageTest2Exception extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global zjcSageTest2() {
        this.fHCM2_Absence_c = new list<zjcSageTest2.fHCM2_Absence_c>();
    }

    public class fHCM2_Absence_c {
        @AuraEnabled public String Id { get; set; }
        @AuraEnabled public String Name { get; set; }
        @AuraEnabled public String RecordTypeId { get; set; }
        @AuraEnabled public Datetime CreatedDate { get; set; }
        @AuraEnabled public String CreatedById { get; set; }
        @AuraEnabled public Datetime LastModifiedDate { get; set; }
        @AuraEnabled public String LastModifiedById { get; set; }
        @AuraEnabled public Datetime SystemModstamp { get; set; }
        @AuraEnabled public Date LastActivityDate { get; set; }
        @AuraEnabled public Datetime LastViewedDate { get; set; }
        @AuraEnabled public Datetime LastReferencedDate { get; set; }
        @AuraEnabled public String fHCM2_Employment_c { get; set; }
        @AuraEnabled public Date fHCM2_Action_Date_c { get; set; }
        @AuraEnabled public String fHCM2_Action_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Alert_Trigger_c { get; set; }
        @AuraEnabled public Date fHCM2_Approval_Date_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Approved_c { get; set; }
        @AuraEnabled public Date fHCM2_Back_To_Work_Interview_Date_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Back_To_Work_Interview_Required_c { get; set; }
        @AuraEnabled public Date fHCM2_Certified_Date_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Days_c { get; set; }
        @AuraEnabled public Date fHCM2_End_Date_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Evidence_Trigger_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Last_Modified_Accrued_Balence_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Last_Modified_Balence_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Last_Modified_Reason_Rolling_Days_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Last_Modified_Reason_Year_Days_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Last_Modified_Type_Rolling_Days_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Last_Modified_Type_Year_Days_c { get; set; }
        @AuraEnabled public Date fHCM2_Manager_Action_Date_c { get; set; }
        @AuraEnabled public String fHCM2_Manager_Action_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Medical_Certificate_Required_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Months_Since_End_c { get; set; }
        @AuraEnabled public String fHCM2_Notes_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Paid_c { get; set; }
        @AuraEnabled public String fHCM2_Picture_c { get; set; }
        @AuraEnabled public String fHCM2_Reason_c { get; set; }
        @AuraEnabled public Date fHCM2_Rejected_Date_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Self_Certificate_Required_c { get; set; }
        @AuraEnabled public Date fHCM2_Start_Date_c { get; set; }
        @AuraEnabled public String fHCM2_Status_c { get; set; }
        @AuraEnabled public String fHCM2_Team_Member_Name_c { get; set; }
        @AuraEnabled public String fHCM2_Team_Member_c { get; set; }
        @AuraEnabled public String fHCM2_Type_c { get; set; }
        @AuraEnabled public Date fHCM2_Actual_Arrival_Date_c { get; set; }
        @AuraEnabled public Date fHCM2_Confirmed_Date_c { get; set; }
        @AuraEnabled public Decimal fHCM2_Days_Taken_By_Partner_c { get; set; }
        @AuraEnabled public Date fHCM2_Earliest_Parental_Leave_End_c { get; set; }
        @AuraEnabled public Date fHCM2_Earliest_Parental_Leave_Start_c { get; set; }
        @AuraEnabled public Boolean fHCM2_End_Date_Provisional_c { get; set; }
        @AuraEnabled public Date fHCM2_Expected_Arrival_Date_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Is_Parental_Leave_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Is_Private_c { get; set; }
        @AuraEnabled public Date fHCM2_Latest_Parental_Leave_End_c { get; set; }
        @AuraEnabled public Date fHCM2_Latest_Parental_Leave_Start_c { get; set; }
        @AuraEnabled public Date fHCM2_Notification_Date_c { get; set; }
        @AuraEnabled public String fHCM2_Notification_Type_c { get; set; }
        @AuraEnabled public String fHCM2_Return_Intent_c { get; set; }
        @AuraEnabled public String fHCM2_Show_Team_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Still_Birth_c { get; set; }
        @AuraEnabled public String fHCM2_Rate_Units_c { get; set; }
        @AuraEnabled public String UD_Absence_Start_Date_c { get; set; }
        @AuraEnabled public String UD_Absence_End_Date_c { get; set; }
        @AuraEnabled public String fHCM2_Pay_Code_c { get; set; }
        @AuraEnabled public String Manager_ID_c { get; set; }
        @AuraEnabled public String Action_Link_c { get; set; }
        @AuraEnabled public String SMP_Personal_Leave_Type_c { get; set; }
        @AuraEnabled public Decimal Inverse_Days_c { get; set; }
        @AuraEnabled public String SMP_Country_c { get; set; }
        @AuraEnabled public String Unique_ID_c { get; set; }
        @AuraEnabled public String MicOpayReadyConcatenated_c { get; set; }
        @AuraEnabled public String Payroll_Number_c { get; set; }
        @AuraEnabled public String CheckApprovePaid_c { get; set; }
        @AuraEnabled public String Payflow_Export_c { get; set; }
        @AuraEnabled public String D_Tech_Services_Function_c { get; set; }

        public fHCM2_Absence_c() {}

        public fHCM2_Absence_c(String pId, String pName, String pRecordTypeId, Datetime pCreatedDate, String pCreatedById, Datetime pLastModifiedDate, String pLastModifiedById, Datetime pSystemModstamp, Date pLastActivityDate, Datetime pLastViewedDate, Datetime pLastReferencedDate, String pfHCM2_Employment_c, Date pfHCM2_Action_Date_c, String pfHCM2_Action_c, Boolean pfHCM2_Alert_Trigger_c, Date pfHCM2_Approval_Date_c, Boolean pfHCM2_Approved_c, Date pfHCM2_Back_To_Work_Interview_Date_c, Boolean pfHCM2_Back_To_Work_Interview_Required_c, Date pfHCM2_Certified_Date_c, Decimal pfHCM2_Days_c, Date pfHCM2_End_Date_c, Boolean pfHCM2_Evidence_Trigger_c, Decimal pfHCM2_Last_Modified_Accrued_Balence_c, Decimal pfHCM2_Last_Modified_Balence_c, Decimal pfHCM2_Last_Modified_Reason_Rolling_Days_c, Decimal pfHCM2_Last_Modified_Reason_Year_Days_c, Decimal pfHCM2_Last_Modified_Type_Rolling_Days_c, Decimal pfHCM2_Last_Modified_Type_Year_Days_c, Date pfHCM2_Manager_Action_Date_c, String pfHCM2_Manager_Action_c, Boolean pfHCM2_Medical_Certificate_Required_c) {
            this.Id = pId;
            this.Name = pName;
            this.RecordTypeId = pRecordTypeId;
            this.CreatedDate = pCreatedDate;
            this.CreatedById = pCreatedById;
            this.LastModifiedDate = pLastModifiedDate;
            this.LastModifiedById = pLastModifiedById;
            this.SystemModstamp = pSystemModstamp;
            this.LastActivityDate = pLastActivityDate;
            this.LastViewedDate = pLastViewedDate;
            this.LastReferencedDate = pLastReferencedDate;
            this.fHCM2_Employment_c = pfHCM2_Employment_c;
            this.fHCM2_Action_Date_c = pfHCM2_Action_Date_c;
            this.fHCM2_Action_c = pfHCM2_Action_c;
            this.fHCM2_Alert_Trigger_c = pfHCM2_Alert_Trigger_c;
            this.fHCM2_Approval_Date_c = pfHCM2_Approval_Date_c;
            this.fHCM2_Approved_c = pfHCM2_Approved_c;
            this.fHCM2_Back_To_Work_Interview_Date_c = pfHCM2_Back_To_Work_Interview_Date_c;
            this.fHCM2_Back_To_Work_Interview_Required_c = pfHCM2_Back_To_Work_Interview_Required_c;
            this.fHCM2_Certified_Date_c = pfHCM2_Certified_Date_c;
            this.fHCM2_Days_c = pfHCM2_Days_c;
            this.fHCM2_End_Date_c = pfHCM2_End_Date_c;
            this.fHCM2_Evidence_Trigger_c = pfHCM2_Evidence_Trigger_c;
            this.fHCM2_Last_Modified_Accrued_Balence_c = pfHCM2_Last_Modified_Accrued_Balence_c;
            this.fHCM2_Last_Modified_Balence_c = pfHCM2_Last_Modified_Balence_c;
            this.fHCM2_Last_Modified_Reason_Rolling_Days_c = pfHCM2_Last_Modified_Reason_Rolling_Days_c;
            this.fHCM2_Last_Modified_Reason_Year_Days_c = pfHCM2_Last_Modified_Reason_Year_Days_c;
            this.fHCM2_Last_Modified_Type_Rolling_Days_c = pfHCM2_Last_Modified_Type_Rolling_Days_c;
            this.fHCM2_Last_Modified_Type_Year_Days_c = pfHCM2_Last_Modified_Type_Year_Days_c;
            this.fHCM2_Manager_Action_Date_c = pfHCM2_Manager_Action_Date_c;
            this.fHCM2_Manager_Action_c = pfHCM2_Manager_Action_c;
            this.fHCM2_Medical_Certificate_Required_c = pfHCM2_Medical_Certificate_Required_c;
        }
    }

    @AuraEnabled public list<zjcSageTest2.fHCM2_Absence_c> fHCM2_Absence_c { get; set; }

    public string inputSetName { get; set; }

    public zjcSageTest2 runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest2 response = this.runQuery(query, logger1, null);
            logger1.commitToDatabase();
            return response;
        }
        catch (Exception e) {
            logger1.addLog('ERROR', e.getTypeName() + ': ' + e.getMessage());
            logger1.setStatusCode(300);
            logger1.commitToDatabase();
            throw e;
        }
    }

    public zjcSageTest2 runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public zjcSageTest2 runInsert() {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest2 response = this.runInsert(logger1, null);
            logger1.commitToDatabase();
            return response;
        }
        catch (Exception e) {
            logger1.addLog('ERROR', e.getTypeName() + ': ' + e.getMessage());
            logger1.setStatusCode(300);
            logger1.commitToDatabase();
            throw e;
        }
    }

    public zjcSageTest2 runInsert(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential);
    }
    
    public string runInsertAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential, con);
    }

    public zjcSageTest2 runUpdate() {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest2 response = this.runUpdate(logger1, null);
            logger1.commitToDatabase();
            return response;
        }
        catch (Exception e) {
            logger1.addLog('ERROR', e.getTypeName() + ': ' + e.getMessage());
            logger1.setStatusCode(300);
            logger1.commitToDatabase();
            throw e;
        }
    }

    public zjcSageTest2 runUpdate(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential);
    }
    
    public string runUpdateAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential, con);
    }

    public zjcSageTest2 runDelete() {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest2 response = this.runDelete(logger1, null);
            logger1.commitToDatabase();
            return response;
        }
        catch (Exception e) {
            logger1.addLog('ERROR', e.getTypeName() + ': ' + e.getMessage());
            logger1.setStatusCode(300);
            logger1.commitToDatabase();
            throw e;
        }
    }
    
    public zjcSageTest2 runDelete(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential);
    }
    
    public string runDeleteAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential, con);
    }

    public static zjcSageTest2 getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return zjcSageTest2.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('zjcSageTest2');
        sh.InputSetName = this.inputSetName;
        sh.InputJson = this.serialize();
        sh.NamedCredential = namedCredential;
        if (logger != null) {
            logger.setInputSetName(String.isBlank(this.inputSetName) ? sh.CorrelationId : this.inputSetName);
            logger.setIdemId(sh.CorrelationId);
        }
        sh.Operation = operation;

        if (query != null) {
            sh.Condition = query.where_x;
            sh.OrderBy = query.orderBy;
            sh.Fields = query.fields;
            sh.Limit_x = query.limit_x;
            sh.Offset = query.offset;
        }
        return sh;
    }
    
    private zjcSageTest2 run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return zjcSageTest2.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return zjcSageTest2.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('zjcSageTest2');
    }

    global override string getBackendMessage() {
        return this.backendMessage;
    }

    global string serialize() {
        if (dynamicBody != null) {
            return JSON.serialize(dynamicBody, true);
        }
        return JSON.serialize(this, true);
    }
    
    public static zjcSageTest2 deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            zjcSageTest2 obj = new zjcSageTest2();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new zjcSageTest2();
        }
        zjcSageTest2 obj = (zjcSageTest2)JSON.deserialize(outputData, zjcSageTest2.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new zjcSageTest2Exception('Response null for zjcSageTest2 request.');
        }

        map<string, string> m = new map<string, string>();

        JSONParser jresponse = JSON.createParser(responsedata);
        jresponse.nextValue();

        boolean hasOutput = false;
        while (jresponse.nextValue() != JSONToken.END_OBJECT && jresponse.getCurrentToken() != null) {
            if (jresponse.getCurrentName() == 'output') {
                jresponse.skipChildren();
                hasOutput = true;
                continue;
            }
            if (jresponse.getCurrentName() == 'backendMessage') {
                m.put('backendMessage', (string)jresponse.readValueAs(string.class));
                continue;
            }
            if (jresponse.getCurrentName() == 'error') {
                string[] errors = (string[])jresponse.readValueAs(list<string>.class);
                zjcSageTest2Exception ex = new zjcSageTest2Exception(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new zjcSageTest2Exception('Malformed response for zjcSageTest2 request.');
        }
        integer start = responsedata.indexOf(':') + 1;
        integer lastIndex = m.get('backendMessage') == null
            ? responsedata.length() - 2
            : responsedata.lastIndexOf('backendMessage');
        integer finish = responsedata.lastIndexOf('}', lastIndex) + 1;
        m.put('output', responseData.substring(start, finish));
        return m;
    }


    public transient string testResponse;
    private transient string outputData;
    private transient string backendMessage;

    private transient map<string, overcast.TypeInfo> metadata;
    private transient map<string, object> dynamicBody;

    global void loadAsyncResponse(string responseBody) {
        if (overcast.Globals.IsOCF) {
            if (string.isblank(responseBody)) {
                throw new zjcSageTest2Exception('Response null for zjcSageTest2 request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new zjcSageTest2Exception(string.join(errors, ';'));
            }
            backendMessage = (string)responseObj.get('backendMessage');
            dynamicBody = (map<string, object>)responseObj.get('output');
            return;
        }

        map<string, string> m = getOutputData(responseBody);
        outputData = m.get('output');
        backendMessage = m.get('backendMessage');
        
        if (outputData != null) {
            dynamicBody = (map<string, object>)JSON.deserializeUntyped(outputData);
        }
    }

    global string getTopTypeName() {
        return 'fHCM2_Absence_c';
    }

    global void set(string typeName, object records) {
        if (typeName == '@testResponse') {
            dynamicBody = (map<string, object>)records;
            return;
        }
        if (dynamicBody == null) {
            dynamicBody = new map<string, object>();
        }
        
        dynamicBody.put(typeName, records);
    }
    
    global object get(string typeName) {
        if (dynamicBody == null && outputData != null) {
            dynamicBody = (map<string, object>)JSON.deserializeUntyped(outputData);
        }
        if (dynamicBody == null) { 
            return null;
        }
        return dynamicBody.get(typeName);
    }

    global map<string, overcast.TypeInfo> getMetadata() {
        if (metadata == null) {
            metadata = new Map<String, overcast.TypeInfo>();
            metadata.putAll(zjcSageTest2Meta0.metadata);
        }
        return metadata;
    }

}