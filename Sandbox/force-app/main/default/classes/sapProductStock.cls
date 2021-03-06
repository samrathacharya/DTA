global class sapProductStock extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Queryable {
/* 
 * Generated by Overcast UTC 2022-03-10 06:28:35Z.
 * This class belongs to the sapProductStock Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class sapProductStockException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global sapProductStock() {
        this.MMBE_MARD_V = new list<sapProductStock.MMBE_MARD_V>();
    }

    public class MMBE_MARD_V {
        @AuraEnabled public String MANDT { get; set; }
        @AuraEnabled public String MATNR { get; set; }
        @AuraEnabled public String WERKS { get; set; }
        @AuraEnabled public String LGORT { get; set; }
        @AuraEnabled public String LVORM { get; set; }
        @AuraEnabled public Decimal LABST { get; set; }
        @AuraEnabled public Decimal UMLME { get; set; }
        @AuraEnabled public Decimal INSME { get; set; }
        @AuraEnabled public Decimal EINME { get; set; }
        @AuraEnabled public Decimal SPEME { get; set; }
        @AuraEnabled public Decimal RETME { get; set; }
        @AuraEnabled public String LGPBE { get; set; }
        @AuraEnabled public Decimal KLABS { get; set; }
        @AuraEnabled public Decimal KINSM { get; set; }
        @AuraEnabled public Decimal KEINM { get; set; }
        @AuraEnabled public Decimal KSPEM { get; set; }

        public MMBE_MARD_V() {}

        public MMBE_MARD_V(String pMANDT, String pMATNR, String pWERKS, String pLGORT, String pLVORM, Decimal pLABST, Decimal pUMLME, Decimal pINSME, Decimal pEINME, Decimal pSPEME, Decimal pRETME, String pLGPBE, Decimal pKLABS, Decimal pKINSM, Decimal pKEINM, Decimal pKSPEM) {
            this.MANDT = pMANDT;
            this.MATNR = pMATNR;
            this.WERKS = pWERKS;
            this.LGORT = pLGORT;
            this.LVORM = pLVORM;
            this.LABST = pLABST;
            this.UMLME = pUMLME;
            this.INSME = pINSME;
            this.EINME = pEINME;
            this.SPEME = pSPEME;
            this.RETME = pRETME;
            this.LGPBE = pLGPBE;
            this.KLABS = pKLABS;
            this.KINSM = pKINSM;
            this.KEINM = pKEINM;
            this.KSPEM = pKSPEM;
        }
    }

    @AuraEnabled public list<sapProductStock.MMBE_MARD_V> MMBE_MARD_V { get; set; }

    public string inputSetName { get; set; }

    public sapProductStock runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            sapProductStock response = this.runQuery(query, logger1, null);
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

    public sapProductStock runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public static sapProductStock getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return sapProductStock.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('sapProductStock');
        sh.InputSetName = this.inputSetName;
        sh.InputJson = this.serialize();
        sh.NamedCredential = namedCredential;
        if (logger != null) {
            logger.setInputSetName(String.isBlank(this.inputSetName) ? sh.CorrelationId : this.inputSetName);
            logger.setIdemId(sh.CorrelationId);
        }
        sh.Operation = operation;
        
        if (query != null) {
            sh.query = query;
        }

        sh.loadExtensions(this);

        return sh;
    }
    
    private sapProductStock run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return sapProductStock.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return sapProductStock.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('sapProductStock');
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

        
    public class BodyContents extends overcast.Realtime.ContentsBody {
        public sapProductStock output { get; set; }
    }

    private static sapProductStock.BodyContents getBodyContents(string responseData) {
        if (string.isblank(responseData)) {
            throw new sapProductStockException('Response null for sapProductStock request.');
        }

        sapProductStock.BodyContents contents = (sapProductStock.BodyContents) JSON.deserialize(responseData, sapProductStock.BodyContents.class);
        if (contents.error != null) {
            sapProductStockException ex = new sapProductStockException(string.join(contents.error, ';'));
            ex.setMessages(contents.error);
            throw ex;
        }
        return contents;
    }

    public static sapProductStock deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            sapProductStock obj = new sapProductStock();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        

        sapProductStock.BodyContents contents = getBodyContents(responsedata);
        contents.output.backendMessage = contents.backendMessage;

        return contents.output;    
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new sapProductStockException('Response null for sapProductStock request.');
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
                sapProductStockException ex = new sapProductStockException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new sapProductStockException('Malformed response for sapProductStock request.');
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
                throw new sapProductStockException('Response null for sapProductStock request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new sapProductStockException(string.join(errors, ';'));
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
        return 'MMBE_MARD_V';
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
            metadata.putAll(sapProductStockMeta0.metadata);
        }
        return metadata;
    }

}