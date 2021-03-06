global class zjcSageTest3 extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Updatable {
/* 
 * Generated by Overcast UTC 2021-12-05 22:42:14Z.
 * This class belongs to the zjcSageTest3 Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class zjcSageTest3Exception extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global zjcSageTest3() {
        this.fHCM2_Team_Member_c = new list<zjcSageTest3.fHCM2_Team_Member_c>();
    }

    public class fHCM2_Team_Member_c {
        @AuraEnabled public String Id { get; set; }
        @AuraEnabled public String OwnerId { get; set; }
        @AuraEnabled public String Name { get; set; }
        @AuraEnabled public Datetime CreatedDate { get; set; }
        @AuraEnabled public String CreatedById { get; set; }
        @AuraEnabled public Datetime LastModifiedDate { get; set; }
        @AuraEnabled public String LastModifiedById { get; set; }
        @AuraEnabled public Datetime SystemModstamp { get; set; }
        @AuraEnabled public Date LastActivityDate { get; set; }
        @AuraEnabled public Datetime LastViewedDate { get; set; }
        @AuraEnabled public Datetime LastReferencedDate { get; set; }
        @AuraEnabled public String fHCM2_Business_c { get; set; }
        @AuraEnabled public String fHCM2_Country_c { get; set; }
        @AuraEnabled public String fHCM2_Current_Employment_c { get; set; }
        @AuraEnabled public String fHCM2_Division_c { get; set; }
        @AuraEnabled public String fHCM2_Employment_Status_c { get; set; }
        @AuraEnabled public String fHCM2_Federation_Id_c { get; set; }
        @AuraEnabled public String fHCM2_First_Name_c { get; set; }
        @AuraEnabled public String fHCM2_Has_Left_c { get; set; }
        @AuraEnabled public Date fHCM2_Hire_Date_c { get; set; }
        @AuraEnabled public Boolean fHCM2_Is_Manager_c { get; set; }
        @AuraEnabled public Date fHCM2_Job_Effective_Date_c { get; set; }
        @AuraEnabled public String fHCM2_Job_Title_c { get; set; }
        @AuraEnabled public String fHCM2_Location_c { get; set; }
        @AuraEnabled public String fHCM2_Manager_User_c { get; set; }
        @AuraEnabled public String fHCM2_Manager_c { get; set; }
        @AuraEnabled public String fHCM2_Middle_Name_c { get; set; }
        @AuraEnabled public String fHCM2_Name_Full_c { get; set; }
        @AuraEnabled public String fHCM2_Name_Reversed_c { get; set; }
        @AuraEnabled public String fHCM2_Preferred_Name_c { get; set; }
        @AuraEnabled public String fHCM2_Surname_c { get; set; }
        @AuraEnabled public String fHCM2_Team_c { get; set; }
        @AuraEnabled public String fHCM2_Unique_Id_c { get; set; }
        @AuraEnabled public String fHCM2_User_Profile_c { get; set; }
        @AuraEnabled public String fHCM2_User_c { get; set; }
        @AuraEnabled public String fHCM2_Username_c { get; set; }
        @AuraEnabled public Decimal Primary_Emergency_Contacts_c { get; set; }
        @AuraEnabled public String Title_c { get; set; }
        @AuraEnabled public String SMP_Company_Entity_c { get; set; }
        @AuraEnabled public String Business_Unit_c { get; set; }
        @AuraEnabled public String Employment_Type_c { get; set; }
        @AuraEnabled public String D_Manager_s_ID_c { get; set; }
        @AuraEnabled public String D_Manager_s_Flag_c { get; set; }
        @AuraEnabled public String D_Integration_Job_Profile_c { get; set; }
        @AuraEnabled public String D_Integration_Active_Flag_c { get; set; }
        @AuraEnabled public String New_Preferred_Job_Title_c { get; set; }
        @AuraEnabled public Boolean IsActiveUser_c { get; set; }
        @AuraEnabled public String Hire_Type_c { get; set; }
        @AuraEnabled public Date D_Tech_Services_Start_date_c { get; set; }
        @AuraEnabled public Date D_Tech_Services_End_date_c { get; set; }

        public fHCM2_Team_Member_c() {}

        public fHCM2_Team_Member_c(String pId, String pOwnerId, String pName, Datetime pCreatedDate, String pCreatedById, Datetime pLastModifiedDate, String pLastModifiedById, Datetime pSystemModstamp, Date pLastActivityDate, Datetime pLastViewedDate, Datetime pLastReferencedDate, String pfHCM2_Business_c, String pfHCM2_Country_c, String pfHCM2_Current_Employment_c, String pfHCM2_Division_c, String pfHCM2_Employment_Status_c, String pfHCM2_Federation_Id_c, String pfHCM2_First_Name_c, String pfHCM2_Has_Left_c, Date pfHCM2_Hire_Date_c, Boolean pfHCM2_Is_Manager_c, Date pfHCM2_Job_Effective_Date_c, String pfHCM2_Job_Title_c, String pfHCM2_Location_c, String pfHCM2_Manager_User_c, String pfHCM2_Manager_c, String pfHCM2_Middle_Name_c, String pfHCM2_Name_Full_c, String pfHCM2_Name_Reversed_c, String pfHCM2_Preferred_Name_c, String pfHCM2_Surname_c, String pfHCM2_Team_c) {
            this.Id = pId;
            this.OwnerId = pOwnerId;
            this.Name = pName;
            this.CreatedDate = pCreatedDate;
            this.CreatedById = pCreatedById;
            this.LastModifiedDate = pLastModifiedDate;
            this.LastModifiedById = pLastModifiedById;
            this.SystemModstamp = pSystemModstamp;
            this.LastActivityDate = pLastActivityDate;
            this.LastViewedDate = pLastViewedDate;
            this.LastReferencedDate = pLastReferencedDate;
            this.fHCM2_Business_c = pfHCM2_Business_c;
            this.fHCM2_Country_c = pfHCM2_Country_c;
            this.fHCM2_Current_Employment_c = pfHCM2_Current_Employment_c;
            this.fHCM2_Division_c = pfHCM2_Division_c;
            this.fHCM2_Employment_Status_c = pfHCM2_Employment_Status_c;
            this.fHCM2_Federation_Id_c = pfHCM2_Federation_Id_c;
            this.fHCM2_First_Name_c = pfHCM2_First_Name_c;
            this.fHCM2_Has_Left_c = pfHCM2_Has_Left_c;
            this.fHCM2_Hire_Date_c = pfHCM2_Hire_Date_c;
            this.fHCM2_Is_Manager_c = pfHCM2_Is_Manager_c;
            this.fHCM2_Job_Effective_Date_c = pfHCM2_Job_Effective_Date_c;
            this.fHCM2_Job_Title_c = pfHCM2_Job_Title_c;
            this.fHCM2_Location_c = pfHCM2_Location_c;
            this.fHCM2_Manager_User_c = pfHCM2_Manager_User_c;
            this.fHCM2_Manager_c = pfHCM2_Manager_c;
            this.fHCM2_Middle_Name_c = pfHCM2_Middle_Name_c;
            this.fHCM2_Name_Full_c = pfHCM2_Name_Full_c;
            this.fHCM2_Name_Reversed_c = pfHCM2_Name_Reversed_c;
            this.fHCM2_Preferred_Name_c = pfHCM2_Preferred_Name_c;
            this.fHCM2_Surname_c = pfHCM2_Surname_c;
            this.fHCM2_Team_c = pfHCM2_Team_c;
        }
    }

    @AuraEnabled public list<zjcSageTest3.fHCM2_Team_Member_c> fHCM2_Team_Member_c { get; set; }

    public string inputSetName { get; set; }

    public zjcSageTest3 runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest3 response = this.runQuery(query, logger1, null);
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

    public zjcSageTest3 runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public zjcSageTest3 runInsert() {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest3 response = this.runInsert(logger1, null);
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

    public zjcSageTest3 runInsert(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential);
    }
    
    public string runInsertAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential, con);
    }

    public zjcSageTest3 runUpdate() {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest3 response = this.runUpdate(logger1, null);
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

    public zjcSageTest3 runUpdate(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential);
    }
    
    public string runUpdateAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential, con);
    }

    public zjcSageTest3 runDelete() {
        overcast.Logger logger1 = createLogger();
        try {
            zjcSageTest3 response = this.runDelete(logger1, null);
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
    
    public zjcSageTest3 runDelete(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential);
    }
    
    public string runDeleteAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential, con);
    }

    public static zjcSageTest3 getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return zjcSageTest3.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('zjcSageTest3');
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
    
    private zjcSageTest3 run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return zjcSageTest3.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return zjcSageTest3.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('zjcSageTest3');
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
    
    public static zjcSageTest3 deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            zjcSageTest3 obj = new zjcSageTest3();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new zjcSageTest3();
        }
        zjcSageTest3 obj = (zjcSageTest3)JSON.deserialize(outputData, zjcSageTest3.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new zjcSageTest3Exception('Response null for zjcSageTest3 request.');
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
                zjcSageTest3Exception ex = new zjcSageTest3Exception(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new zjcSageTest3Exception('Malformed response for zjcSageTest3 request.');
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
                throw new zjcSageTest3Exception('Response null for zjcSageTest3 request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new zjcSageTest3Exception(string.join(errors, ';'));
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
        return 'fHCM2_Team_Member_c';
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
            metadata.putAll(zjcSageTest3Meta0.metadata);
        }
        return metadata;
    }

}