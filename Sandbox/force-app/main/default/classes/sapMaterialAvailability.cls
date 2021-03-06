global class sapMaterialAvailability extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Runnable {
/* 
 * Generated by Overcast UTC 2022-02-24 06:43:49Z.
 * This class belongs to the sapMaterialAvailability Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class sapMaterialAvailabilityException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global sapMaterialAvailability() {
        this.BAPI_MATERIAL_AVAILABILITY = new sapMaterialAvailability.BAPI_MATERIAL_AVAILABILITY();
        this.RETURN_x = new sapMaterialAvailability.RETURN_x();
        this.MATERIAL_EVG = new sapMaterialAvailability.MATERIAL_EVG();
        this.WMDVEX = new list<sapMaterialAvailability.WMDVEX>();
        this.WMDVSX = new list<sapMaterialAvailability.WMDVSX>();
    }

    public class BAPI_MATERIAL_AVAILABILITY {
        @AuraEnabled public Decimal AV_QTY_PLT { get; set; }
        @AuraEnabled public String DIALOGFLAG { get; set; }
        @AuraEnabled public Date ENDLEADTME { get; set; }
        @AuraEnabled public String BATCH { get; set; }
        @AuraEnabled public String CHECK_RULE { get; set; }
        @AuraEnabled public String CUSTOMER { get; set; }
        @AuraEnabled public Integer DEC_FOR_ROUNDING { get; set; }
        @AuraEnabled public String DEC_FOR_ROUNDING_X { get; set; }
        @AuraEnabled public String DOC_NUMBER { get; set; }
        @AuraEnabled public String ITM_NUMBER { get; set; }
        @AuraEnabled public String MATERIAL { get; set; }
        @AuraEnabled public String MATERIAL_LONG { get; set; }
        @AuraEnabled public String PLANT { get; set; }
        @AuraEnabled public String READ_ATP_LOCK { get; set; }
        @AuraEnabled public String READ_ATP_LOCK_X { get; set; }
        @AuraEnabled public String REQ_SEG_LONG { get; set; }
        @AuraEnabled public String SGT_RCAT { get; set; }
        @AuraEnabled public String STGE_LOC { get; set; }
        @AuraEnabled public String STOCK_IND { get; set; }
        @AuraEnabled public String UNIT { get; set; }
        @AuraEnabled public String WBS_ELEM { get; set; }

        public BAPI_MATERIAL_AVAILABILITY() {}

        public BAPI_MATERIAL_AVAILABILITY(Decimal pAV_QTY_PLT, String pDIALOGFLAG, Date pENDLEADTME, String pBATCH, String pCHECK_RULE, String pCUSTOMER, Integer pDEC_FOR_ROUNDING, String pDEC_FOR_ROUNDING_X, String pDOC_NUMBER, String pITM_NUMBER, String pMATERIAL, String pMATERIAL_LONG, String pPLANT, String pREAD_ATP_LOCK, String pREAD_ATP_LOCK_X, String pREQ_SEG_LONG, String pSGT_RCAT, String pSTGE_LOC, String pSTOCK_IND, String pUNIT, String pWBS_ELEM) {
            this.AV_QTY_PLT = pAV_QTY_PLT;
            this.DIALOGFLAG = pDIALOGFLAG;
            this.ENDLEADTME = pENDLEADTME;
            this.BATCH = pBATCH;
            this.CHECK_RULE = pCHECK_RULE;
            this.CUSTOMER = pCUSTOMER;
            this.DEC_FOR_ROUNDING = pDEC_FOR_ROUNDING;
            this.DEC_FOR_ROUNDING_X = pDEC_FOR_ROUNDING_X;
            this.DOC_NUMBER = pDOC_NUMBER;
            this.ITM_NUMBER = pITM_NUMBER;
            this.MATERIAL = pMATERIAL;
            this.MATERIAL_LONG = pMATERIAL_LONG;
            this.PLANT = pPLANT;
            this.READ_ATP_LOCK = pREAD_ATP_LOCK;
            this.READ_ATP_LOCK_X = pREAD_ATP_LOCK_X;
            this.REQ_SEG_LONG = pREQ_SEG_LONG;
            this.SGT_RCAT = pSGT_RCAT;
            this.STGE_LOC = pSTGE_LOC;
            this.STOCK_IND = pSTOCK_IND;
            this.UNIT = pUNIT;
            this.WBS_ELEM = pWBS_ELEM;
        }
    }

    public class RETURN_x {
        @AuraEnabled public String TYPE_x { get; set; }
        @AuraEnabled public String CODE { get; set; }
        @AuraEnabled public String MESSAGE { get; set; }
        @AuraEnabled public String LOG_NO { get; set; }
        @AuraEnabled public String LOG_MSG_NO { get; set; }
        @AuraEnabled public String MESSAGE_V1 { get; set; }
        @AuraEnabled public String MESSAGE_V2 { get; set; }
        @AuraEnabled public String MESSAGE_V3 { get; set; }
        @AuraEnabled public String MESSAGE_V4 { get; set; }

        public RETURN_x() {}

        public RETURN_x(String pTYPE_x, String pCODE, String pMESSAGE, String pLOG_NO, String pLOG_MSG_NO, String pMESSAGE_V1, String pMESSAGE_V2, String pMESSAGE_V3, String pMESSAGE_V4) {
            this.TYPE_x = pTYPE_x;
            this.CODE = pCODE;
            this.MESSAGE = pMESSAGE;
            this.LOG_NO = pLOG_NO;
            this.LOG_MSG_NO = pLOG_MSG_NO;
            this.MESSAGE_V1 = pMESSAGE_V1;
            this.MESSAGE_V2 = pMESSAGE_V2;
            this.MESSAGE_V3 = pMESSAGE_V3;
            this.MESSAGE_V4 = pMESSAGE_V4;
        }
    }

    public class MATERIAL_EVG {
        @AuraEnabled public String MATERIAL_EXT { get; set; }
        @AuraEnabled public String MATERIAL_VERS { get; set; }
        @AuraEnabled public String MATERIAL_GUID { get; set; }

        public MATERIAL_EVG() {}

        public MATERIAL_EVG(String pMATERIAL_EXT, String pMATERIAL_VERS, String pMATERIAL_GUID) {
            this.MATERIAL_EXT = pMATERIAL_EXT;
            this.MATERIAL_VERS = pMATERIAL_VERS;
            this.MATERIAL_GUID = pMATERIAL_GUID;
        }
    }

    public class WMDVEX {
        @AuraEnabled public String BDCNT { get; set; }
        @AuraEnabled public Date REQ_DATE { get; set; }
        @AuraEnabled public Decimal REQ_QTY { get; set; }
        @AuraEnabled public Date COM_DATE { get; set; }
        @AuraEnabled public Decimal COM_QTY { get; set; }

        public WMDVEX() {}

        public WMDVEX(String pBDCNT, Date pREQ_DATE, Decimal pREQ_QTY, Date pCOM_DATE, Decimal pCOM_QTY) {
            this.BDCNT = pBDCNT;
            this.REQ_DATE = pREQ_DATE;
            this.REQ_QTY = pREQ_QTY;
            this.COM_DATE = pCOM_DATE;
            this.COM_QTY = pCOM_QTY;
        }
    }

    public class WMDVSX {
        @AuraEnabled public Date REQ_DATE { get; set; }
        @AuraEnabled public Decimal REQ_QTY { get; set; }
        @AuraEnabled public String DELKZ { get; set; }
        @AuraEnabled public Integer YLINE { get; set; }

        public WMDVSX() {}

        public WMDVSX(Date pREQ_DATE, Decimal pREQ_QTY, String pDELKZ, Integer pYLINE) {
            this.REQ_DATE = pREQ_DATE;
            this.REQ_QTY = pREQ_QTY;
            this.DELKZ = pDELKZ;
            this.YLINE = pYLINE;
        }
    }

    @AuraEnabled public sapMaterialAvailability.BAPI_MATERIAL_AVAILABILITY BAPI_MATERIAL_AVAILABILITY { get; set; }
    @AuraEnabled public sapMaterialAvailability.RETURN_x RETURN_x { get; set; }
    @AuraEnabled public sapMaterialAvailability.MATERIAL_EVG MATERIAL_EVG { get; set; }
    @AuraEnabled public list<sapMaterialAvailability.WMDVEX> WMDVEX { get; set; }
    @AuraEnabled public list<sapMaterialAvailability.WMDVSX> WMDVSX { get; set; }

    public string inputSetName { get; set; }

    public sapMaterialAvailability run() {
        overcast.Logger logger1 = createLogger();
        try {
            sapMaterialAvailability response = this.run(logger1, null);
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
    
    public sapMaterialAvailability run(overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return sapMaterialAvailability.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);
        
        return sapMaterialAvailability.deserialize(sh.Response);
    }

    public string runAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }

    public static sapMaterialAvailability handleAsyncResponse(HttpResponse resp) {
        return sapMaterialAvailability.deserialize(resp.getBody());
    }

    public static sapMaterialAvailability getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return handleAsyncResponse(response);
    }

    private overcast.SynchronousHandler setup(overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('sapMaterialAvailability');
        sh.InputSetName = this.inputSetName;
        sh.InputJson = this.serialize();
        sh.NamedCredential = namedCredential;
        if (logger != null) {
            logger.setInputSetName(String.isBlank(this.inputSetName) ? sh.CorrelationId : this.inputSetName);
            logger.setIdemId(sh.CorrelationId);
        }

        return sh;
    }

    private static overcast.Logger createLogger() {
        return new overcast.Logger('sapMaterialAvailability');
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
    
    public static sapMaterialAvailability deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            sapMaterialAvailability obj = new sapMaterialAvailability();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new sapMaterialAvailability();
        }
        sapMaterialAvailability obj = (sapMaterialAvailability)JSON.deserialize(outputData, sapMaterialAvailability.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new sapMaterialAvailabilityException('Response null for sapMaterialAvailability request.');
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
                sapMaterialAvailabilityException ex = new sapMaterialAvailabilityException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new sapMaterialAvailabilityException('Malformed response for sapMaterialAvailability request.');
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
                throw new sapMaterialAvailabilityException('Response null for sapMaterialAvailability request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new sapMaterialAvailabilityException(string.join(errors, ';'));
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
        return 'BAPI_MATERIAL_AVAILABILITY';
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
            metadata.putAll(sapMaterialAvailabilityMeta0.metadata);
        }
        return metadata;
    }

}