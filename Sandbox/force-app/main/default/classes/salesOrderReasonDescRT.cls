global class salesOrderReasonDescRT extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Queryable {
/* 
 * Generated by Overcast UTC 2022-02-25 09:35:36Z.
 * This class belongs to the salesOrderReasonDescRT Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class salesOrderReasonDescRTException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global salesOrderReasonDescRT() {
        this.TVAUT = new list<salesOrderReasonDescRT.TVAUT>();
    }

    public class TVAUT {
        @AuraEnabled public String MANDT { get; set; }
        @AuraEnabled public String SPRAS { get; set; }
        @AuraEnabled public String AUGRU { get; set; }
        @AuraEnabled public String BEZEI { get; set; }

        public TVAUT() {}

        public TVAUT(String pMANDT, String pSPRAS, String pAUGRU, String pBEZEI) {
            this.MANDT = pMANDT;
            this.SPRAS = pSPRAS;
            this.AUGRU = pAUGRU;
            this.BEZEI = pBEZEI;
        }
    }

    @AuraEnabled public list<salesOrderReasonDescRT.TVAUT> TVAUT { get; set; }

    public string inputSetName { get; set; }

    public salesOrderReasonDescRT runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            salesOrderReasonDescRT response = this.runQuery(query, logger1, null);
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

    public salesOrderReasonDescRT runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public static salesOrderReasonDescRT getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return salesOrderReasonDescRT.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('salesOrderReasonDescRT');
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
    
    private salesOrderReasonDescRT run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return salesOrderReasonDescRT.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return salesOrderReasonDescRT.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('salesOrderReasonDescRT');
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
    
    public static salesOrderReasonDescRT deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            salesOrderReasonDescRT obj = new salesOrderReasonDescRT();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new salesOrderReasonDescRT();
        }
        salesOrderReasonDescRT obj = (salesOrderReasonDescRT)JSON.deserialize(outputData, salesOrderReasonDescRT.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new salesOrderReasonDescRTException('Response null for salesOrderReasonDescRT request.');
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
                salesOrderReasonDescRTException ex = new salesOrderReasonDescRTException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new salesOrderReasonDescRTException('Malformed response for salesOrderReasonDescRT request.');
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
                throw new salesOrderReasonDescRTException('Response null for salesOrderReasonDescRT request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new salesOrderReasonDescRTException(string.join(errors, ';'));
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
        return 'TVAUT';
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
            metadata.putAll(salesOrderReasonDescRTMeta0.metadata);
        }
        return metadata;
    }

}