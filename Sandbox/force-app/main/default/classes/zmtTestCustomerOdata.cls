global class zmtTestCustomerOdata extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Updatable {
/* 
 * Generated by Overcast UTC 2022-01-14 06:51:19Z.
 * This class belongs to the zmtTestCustomerOdata Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class zmtTestCustomerOdataException extends Exception {
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
        @InvocableVariable(label='Request Query' required=false)
        global overcast__.Query query;
        @InvocableVariable(label='Request Data' required=false)
        global zmtTestCustomerOdata requestData;
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
        global zmtTestCustomerOdata response;
        @InvocableVariable(label='Logger' required=false)
        global overcast__.Logger logger;
    }

    @InvocableMethod(label='Run Scenario zmtTestCustomerOdata' category='Overcast')
    public static List<Result> runInvocableMethod(List<Parameters> paramList) {
        List<Result> results = new List<Result>();
        List<overcast__.Logger> loggersToCommit = new List<overcast__.Logger>();

        for (Parameters p : paramList) {
            overcast__.Logger logger1 = p.logger;
            if (logger1 == null) {
                logger1 = createLogger();
            }
            Result result1 = new Result();
            zmtTestCustomerOdata request = p.requestData != null ? p.requestData : new zmtTestCustomerOdata();
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

    global zmtTestCustomerOdata() {
        this.A_Customer = new list<zmtTestCustomerOdataA_Customer>();
        this.A_CustomerCompany = new list<zmtTestCustomerOdataA_CustomerCompany>();
        this.A_CustomerCompanyText = new list<zmtTestCustomerOdataACustomerCompanyText>();
        this.A_CustomerDunning = new list<zmtTestCustomerOdataA_CustomerDunning>();
        this.A_CustomerWithHoldingTax = new list<zmtTestCustomerOdataACustomerWithHolding>();
        this.A_CustomerSalesArea = new list<zmtTestCustomerOdataA_CustomerSalesArea>();
        this.A_CustSalesPartnerFunc = new list<zmtTestCustomerOdataACustSalesPartnerFun>();
        this.A_CustomerSalesAreaTax = new list<zmtTestCustomerOdataACustomerSalesAreaTa>();
        this.A_CustomerSalesAreaText = new list<zmtTestCustomerOdataACustomerSalesAreaTe>();
        this.A_CustomerTaxGrouping = new list<zmtTestCustomerOdataACustomerTaxGrouping>();
        this.A_CustomerText = new list<zmtTestCustomerOdataA_CustomerText>();
    }

    @AuraEnabled public list<zmtTestCustomerOdataA_Customer> A_Customer { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataA_CustomerCompany> A_CustomerCompany { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataACustomerCompanyText> A_CustomerCompanyText { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataA_CustomerDunning> A_CustomerDunning { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataACustomerWithHolding> A_CustomerWithHoldingTax { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataA_CustomerSalesArea> A_CustomerSalesArea { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataACustSalesPartnerFun> A_CustSalesPartnerFunc { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataACustomerSalesAreaTa> A_CustomerSalesAreaTax { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataACustomerSalesAreaTe> A_CustomerSalesAreaText { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataACustomerTaxGrouping> A_CustomerTaxGrouping { get; set; }
    @AuraEnabled public list<zmtTestCustomerOdataA_CustomerText> A_CustomerText { get; set; }

    public string inputSetName { get; set; }

    public zmtTestCustomerOdata runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            zmtTestCustomerOdata response = this.runQuery(query, logger1, null);
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

    public zmtTestCustomerOdata runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public zmtTestCustomerOdata runInsert() {
        overcast.Logger logger1 = createLogger();
        try {
            zmtTestCustomerOdata response = this.runInsert(logger1, null);
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

    public zmtTestCustomerOdata runInsert(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential);
    }
    
    public string runInsertAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwCreate, null, logger, namedCredential, con);
    }

    public zmtTestCustomerOdata runUpdate() {
        overcast.Logger logger1 = createLogger();
        try {
            zmtTestCustomerOdata response = this.runUpdate(logger1, null);
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

    public zmtTestCustomerOdata runUpdate(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential);
    }
    
    public string runUpdateAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwUpdate, null, logger, namedCredential, con);
    }

    public zmtTestCustomerOdata runDelete() {
        overcast.Logger logger1 = createLogger();
        try {
            zmtTestCustomerOdata response = this.runDelete(logger1, null);
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
    
    public zmtTestCustomerOdata runDelete(overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential);
    }
    
    public string runDeleteAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwDelete, null, logger, namedCredential, con);
    }

    public static zmtTestCustomerOdata getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return zmtTestCustomerOdata.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('zmtTestCustomerOdata');
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
    
    private zmtTestCustomerOdata run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return zmtTestCustomerOdata.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return zmtTestCustomerOdata.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('zmtTestCustomerOdata');
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
    
    public static zmtTestCustomerOdata deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            zmtTestCustomerOdata obj = new zmtTestCustomerOdata();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new zmtTestCustomerOdata();
        }
        zmtTestCustomerOdata obj = (zmtTestCustomerOdata)JSON.deserialize(outputData, zmtTestCustomerOdata.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new zmtTestCustomerOdataException('Response null for zmtTestCustomerOdata request.');
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
                zmtTestCustomerOdataException ex = new zmtTestCustomerOdataException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new zmtTestCustomerOdataException('Malformed response for zmtTestCustomerOdata request.');
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
                throw new zmtTestCustomerOdataException('Response null for zmtTestCustomerOdata request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new zmtTestCustomerOdataException(string.join(errors, ';'));
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
        return 'A_Customer';
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
            metadata.putAll(zmtTestCustomerOdataMeta0.metadata);
        }
        return metadata;
    }

}