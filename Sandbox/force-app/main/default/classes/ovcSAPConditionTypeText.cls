global class ovcSAPConditionTypeText extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Queryable {
/* 
 * Generated by Overcast UTC 2021-11-24 07:50:58Z.
 * This class belongs to the ovcSAPConditionTypeText Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class ovcSAPConditionTypeTextException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global ovcSAPConditionTypeText() {
        this.T683T = new list<ovcSAPConditionTypeText.T683T>();
    }

    public class T683T {
        @AuraEnabled public String SPRAS { get; set; }
        @AuraEnabled public String KVEWE { get; set; }
        @AuraEnabled public String KAPPL { get; set; }
        @AuraEnabled public String KALSM { get; set; }
        @AuraEnabled public String STUNR { get; set; }
        @AuraEnabled public String ZAEHK { get; set; }
        @AuraEnabled public String VTEXT { get; set; }

        public T683T() {}

        public T683T(String pSPRAS, String pKVEWE, String pKAPPL, String pKALSM, String pSTUNR, String pZAEHK, String pVTEXT) {
            this.SPRAS = pSPRAS;
            this.KVEWE = pKVEWE;
            this.KAPPL = pKAPPL;
            this.KALSM = pKALSM;
            this.STUNR = pSTUNR;
            this.ZAEHK = pZAEHK;
            this.VTEXT = pVTEXT;
        }
    }

    @AuraEnabled public list<ovcSAPConditionTypeText.T683T> T683T { get; set; }

    public string inputSetName { get; set; }

    public ovcSAPConditionTypeText runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            ovcSAPConditionTypeText response = this.runQuery(query, logger1, null);
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

    public ovcSAPConditionTypeText runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public static ovcSAPConditionTypeText getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return ovcSAPConditionTypeText.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('ovcSAPConditionTypeText');
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
    
    private ovcSAPConditionTypeText run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return ovcSAPConditionTypeText.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return ovcSAPConditionTypeText.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('ovcSAPConditionTypeText');
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
    
    public static ovcSAPConditionTypeText deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            ovcSAPConditionTypeText obj = new ovcSAPConditionTypeText();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new ovcSAPConditionTypeText();
        }
        ovcSAPConditionTypeText obj = (ovcSAPConditionTypeText)JSON.deserialize(outputData, ovcSAPConditionTypeText.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new ovcSAPConditionTypeTextException('Response null for ovcSAPConditionTypeText request.');
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
                ovcSAPConditionTypeTextException ex = new ovcSAPConditionTypeTextException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new ovcSAPConditionTypeTextException('Malformed response for ovcSAPConditionTypeText request.');
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
                throw new ovcSAPConditionTypeTextException('Response null for ovcSAPConditionTypeText request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new ovcSAPConditionTypeTextException(string.join(errors, ';'));
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
        return 'T683T';
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
            metadata.putAll(ovcSAPConditionTypeTextMeta0.metadata);
        }
        return metadata;
    }

}