global class CustomerReturn extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Updatable {
/* 
 * Generated by Overcast UTC 2022-03-07 03:42:38Z.
 * This class belongs to the CustomerReturn Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class CustomerReturnException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global class Parameters {
        @InvocableVariable(label='Flow Interview GUID' required=true)
        global String flowInterviewGuid;
        @InvocableVariable(label='Query Object' required=false)
        global overcast__.Query query;
        @InvocableVariable(label='Request Data' required=false)
        global CustomerReturn requestData;
        @InvocableVariable(label='Operation (Query,Insert,Update,Delete)' required=true)
        global String operation;
        @InvocableVariable(label='Logger' required=false)
        global overcast__.Logger logger;
        @InvocableVariable(label='Do not Commit Logs' required=false)
        global Boolean doNotCommitLogs;

        @testVisible
        private String testResponse;
    }

    global class Result {
        @InvocableVariable(label='New Run ID' description='The ID for the new Run record.')
        global Id newRunId;
        @InvocableVariable(label='Response Data' required=false)
        global CustomerReturn response;
        @InvocableVariable(label='Logger' required=false)
        global overcast__.Logger logger;
    }

    @InvocableMethod(label='Run Scenario CustomerReturn' category='Overcast')
    public static List<Result> runInvocableMethod(List<Parameters> paramList) {
        List<Result> results = new List<Result>();
        List<overcast__.Logger> loggersToCommit = new List<overcast__.Logger>();

        for (Parameters p : paramList) {
            overcast__.Logger logger1 = p.logger;
            if (logger1 == null) {
                logger1 = createLogger();
            }
            Result result1 = new Result();
            CustomerReturn request = p.requestData != null ? p.requestData : new CustomerReturn();
            if (Test.isRunningTest()) {
                request.testResponse = p.testResponse;
            }
            switch on p.operation {
                when 'Query' {
                    result1.response = request.runQuery(p.query, logger1, null);
                } 
                when 'Insert' {
                    result1.response = request.runInsert(logger1, null);
                }
                when 'Update' {
                    result1.response = request.runUpdate(logger1, null);
                }
                when 'Delete' {
                    result1.response = request.runDelete(logger1, null);
                }
            }
            result1.logger = logger1;
            if (p.doNotCommitLogs != true) {
                loggersToCommit.add(logger1);
            }
            results.add(result1);
        }

        if (!loggersToCommit.isEmpty()) {
            overcast__.Logger.commitToDatabase(loggersToCommit);
        }

        return results;
    }

    global CustomerReturn() {
        this.A_CustomerReturn = new list<CustomerReturnA_CustomerReturn>();
        this.A_CustomerReturnItem = new list<CustomerReturnA_CustomerReturnItem>();
    }

    @AuraEnabled public list<CustomerReturnA_CustomerReturn> A_CustomerReturn { get; set; }
    @AuraEnabled public list<CustomerReturnA_CustomerReturnItem> A_CustomerReturnItem { get; set; }

    public string inputSetName { get; set; }

    public CustomerReturn runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            CustomerReturn response = this.runQuery(query, logger1, null);
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

    public CustomerReturn runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public CustomerReturn runInsert() {
        overcast.Logger logger1 = createLogger();
        try {
            CustomerReturn response = this.runInsert(logger1, null);
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

    public CustomerReturn runInsert(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential);
    }
    
    public string runInsertAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential, con);
    }

    public CustomerReturn runUpdate() {
        overcast.Logger logger1 = createLogger();
        try {
            CustomerReturn response = this.runUpdate(logger1, null);
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

    public CustomerReturn runUpdate(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential);
    }
    
    public string runUpdateAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential, con);
    }

    public CustomerReturn runDelete() {
        overcast.Logger logger1 = createLogger();
        try {
            CustomerReturn response = this.runDelete(logger1, null);
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
    
    public CustomerReturn runDelete(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential);
    }
    
    public string runDeleteAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential, con);
    }

    public static CustomerReturn getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return CustomerReturn.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('CustomerReturn');
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
    
    private CustomerReturn run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return CustomerReturn.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return CustomerReturn.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('CustomerReturn');
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
    
    public static CustomerReturn deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            CustomerReturn obj = new CustomerReturn();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new CustomerReturn();
        }
        CustomerReturn obj = (CustomerReturn)JSON.deserialize(outputData, CustomerReturn.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new CustomerReturnException('Response null for CustomerReturn request.');
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
                CustomerReturnException ex = new CustomerReturnException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new CustomerReturnException('Malformed response for CustomerReturn request.');
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
                throw new CustomerReturnException('Response null for CustomerReturn request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new CustomerReturnException(string.join(errors, ';'));
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
        return 'A_CustomerReturn';
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
            metadata.putAll(CustomerReturnMeta0.metadata);
        }
        return metadata;
    }

}