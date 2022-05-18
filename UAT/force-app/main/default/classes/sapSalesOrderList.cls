global class sapSalesOrderList extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Runnable {
/* 
 * Generated by Overcast UTC 2022-01-26 09:55:45Z.
 * This class belongs to the sapSalesOrderList Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class sapSalesOrderListException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global sapSalesOrderList() {
        this.BAPI_SALESORDER_GETLIST = new sapSalesOrderList.BAPI_SALESORDER_GETLIST();
        this.RETURN_x = new sapSalesOrderList.RETURN_x();
        this.MATERIAL_EVG = new sapSalesOrderList.MATERIAL_EVG();
        this.EXTENSIONEX = new list<sapSalesOrderList.EXTENSIONEX>();
        this.EXTENSIONIN = new list<sapSalesOrderList.EXTENSIONIN>();
        this.SALES_ORDERS = new list<sapSalesOrderList.SALES_ORDERS>();
    }

    public class BAPI_SALESORDER_GETLIST {
        @AuraEnabled public String CUSTOMER_NUMBER { get; set; }
        @AuraEnabled public Date DOCUMENT_DATE { get; set; }
        @AuraEnabled public Date DOCUMENT_DATE_TO { get; set; }
        @AuraEnabled public String MATERIAL { get; set; }
        @AuraEnabled public String MATERIAL_LONG { get; set; }
        @AuraEnabled public String PURCHASE_ORDER { get; set; }
        @AuraEnabled public String PURCHASE_ORDER_NUMBER { get; set; }
        @AuraEnabled public String SALES_ORGANIZATION { get; set; }
        @AuraEnabled public String TRANSACTION_GROUP { get; set; }

        public BAPI_SALESORDER_GETLIST() {}

        public BAPI_SALESORDER_GETLIST(String pCUSTOMER_NUMBER, Date pDOCUMENT_DATE, Date pDOCUMENT_DATE_TO, String pMATERIAL, String pMATERIAL_LONG, String pPURCHASE_ORDER, String pPURCHASE_ORDER_NUMBER, String pSALES_ORGANIZATION, String pTRANSACTION_GROUP) {
            this.CUSTOMER_NUMBER = pCUSTOMER_NUMBER;
            this.DOCUMENT_DATE = pDOCUMENT_DATE;
            this.DOCUMENT_DATE_TO = pDOCUMENT_DATE_TO;
            this.MATERIAL = pMATERIAL;
            this.MATERIAL_LONG = pMATERIAL_LONG;
            this.PURCHASE_ORDER = pPURCHASE_ORDER;
            this.PURCHASE_ORDER_NUMBER = pPURCHASE_ORDER_NUMBER;
            this.SALES_ORGANIZATION = pSALES_ORGANIZATION;
            this.TRANSACTION_GROUP = pTRANSACTION_GROUP;
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

    public class EXTENSIONEX {
        @AuraEnabled public String STRUCTURE { get; set; }
        @AuraEnabled public String VALUEPART1 { get; set; }
        @AuraEnabled public String VALUEPART2 { get; set; }
        @AuraEnabled public String VALUEPART3 { get; set; }
        @AuraEnabled public String VALUEPART4 { get; set; }

        public EXTENSIONEX() {}

        public EXTENSIONEX(String pSTRUCTURE, String pVALUEPART1, String pVALUEPART2, String pVALUEPART3, String pVALUEPART4) {
            this.STRUCTURE = pSTRUCTURE;
            this.VALUEPART1 = pVALUEPART1;
            this.VALUEPART2 = pVALUEPART2;
            this.VALUEPART3 = pVALUEPART3;
            this.VALUEPART4 = pVALUEPART4;
        }
    }

    public class EXTENSIONIN {
        @AuraEnabled public String STRUCTURE { get; set; }
        @AuraEnabled public String VALUEPART1 { get; set; }
        @AuraEnabled public String VALUEPART2 { get; set; }
        @AuraEnabled public String VALUEPART3 { get; set; }
        @AuraEnabled public String VALUEPART4 { get; set; }

        public EXTENSIONIN() {}

        public EXTENSIONIN(String pSTRUCTURE, String pVALUEPART1, String pVALUEPART2, String pVALUEPART3, String pVALUEPART4) {
            this.STRUCTURE = pSTRUCTURE;
            this.VALUEPART1 = pVALUEPART1;
            this.VALUEPART2 = pVALUEPART2;
            this.VALUEPART3 = pVALUEPART3;
            this.VALUEPART4 = pVALUEPART4;
        }
    }

    public class SALES_ORDERS {
        @AuraEnabled public String SD_DOC { get; set; }
        @AuraEnabled public String ITM_NUMBER { get; set; }
        @AuraEnabled public String MATERIAL { get; set; }
        @AuraEnabled public String SHORT_TEXT { get; set; }
        @AuraEnabled public String DOC_TYPE { get; set; }
        @AuraEnabled public Date DOC_DATE { get; set; }
        @AuraEnabled public Decimal REQ_QTY { get; set; }
        @AuraEnabled public Date REQ_DATE { get; set; }
        @AuraEnabled public String PURCH_NO { get; set; }
        @AuraEnabled public String BATCH { get; set; }
        @AuraEnabled public Date VALID_FROM { get; set; }
        @AuraEnabled public Date VALID_TO { get; set; }
        @AuraEnabled public String BILL_BLOCK { get; set; }
        @AuraEnabled public String DLV_BLOCK { get; set; }
        @AuraEnabled public String SOLD_TO { get; set; }
        @AuraEnabled public String NAME { get; set; }
        @AuraEnabled public Decimal EXCHG_RATE { get; set; }
        @AuraEnabled public Decimal DLV_QTY { get; set; }
        @AuraEnabled public String BASE_UOM { get; set; }
        @AuraEnabled public Decimal NET_PRICE { get; set; }
        @AuraEnabled public Decimal COND_P_UNT { get; set; }
        @AuraEnabled public String COND_UNIT { get; set; }
        @AuraEnabled public Decimal NET_VAL_HD { get; set; }
        @AuraEnabled public Decimal NET_VALUE { get; set; }
        @AuraEnabled public String DIVISION { get; set; }
        @AuraEnabled public String DOC_STATUS { get; set; }
        @AuraEnabled public String SALES_GRP { get; set; }
        @AuraEnabled public String SALES_OFF { get; set; }
        @AuraEnabled public String SALES_ORG { get; set; }
        @AuraEnabled public String SALES_UNIT { get; set; }
        @AuraEnabled public String SHIP_POINT { get; set; }
        @AuraEnabled public String DISTR_CHAN { get; set; }
        @AuraEnabled public Date GI_DATE { get; set; }
        @AuraEnabled public String CURRENCY_x { get; set; }
        @AuraEnabled public String PLANT { get; set; }
        @AuraEnabled public String STORE_LOC { get; set; }
        @AuraEnabled public String ORD_REASON { get; set; }
        @AuraEnabled public String REASON_REJ { get; set; }
        @AuraEnabled public String B_UOM_ISO { get; set; }
        @AuraEnabled public String CD_UNT_ISO { get; set; }
        @AuraEnabled public String S_UNIT_ISO { get; set; }
        @AuraEnabled public String CURR_ISO { get; set; }
        @AuraEnabled public String PURCH_NO_C { get; set; }
        @AuraEnabled public Decimal EXCHG_RATE_V { get; set; }
        @AuraEnabled public String MAT_EXT { get; set; }
        @AuraEnabled public String MAT_GUID { get; set; }
        @AuraEnabled public String MAT_VERS { get; set; }
        @AuraEnabled public Date CREATION_DATE { get; set; }
        @AuraEnabled public String CREATION_TIME { get; set; }
        @AuraEnabled public String STATUS_DOC { get; set; }
        @AuraEnabled public String REQ_SEGMENT { get; set; }
        @AuraEnabled public String MATERIAL_LONG { get; set; }
        @AuraEnabled public String DB_CR_IND { get; set; }
        @AuraEnabled public String REQ_SEG_LONG { get; set; }

        public SALES_ORDERS() {}

        public SALES_ORDERS(String pSD_DOC, String pITM_NUMBER, String pMATERIAL, String pSHORT_TEXT, String pDOC_TYPE, Date pDOC_DATE, Decimal pREQ_QTY, Date pREQ_DATE, String pPURCH_NO, String pBATCH, Date pVALID_FROM, Date pVALID_TO, String pBILL_BLOCK, String pDLV_BLOCK, String pSOLD_TO, String pNAME, Decimal pEXCHG_RATE, Decimal pDLV_QTY, String pBASE_UOM, Decimal pNET_PRICE, Decimal pCOND_P_UNT, String pCOND_UNIT, Decimal pNET_VAL_HD, Decimal pNET_VALUE, String pDIVISION, String pDOC_STATUS, String pSALES_GRP, String pSALES_OFF, String pSALES_ORG, String pSALES_UNIT, String pSHIP_POINT, String pDISTR_CHAN) {
            this.SD_DOC = pSD_DOC;
            this.ITM_NUMBER = pITM_NUMBER;
            this.MATERIAL = pMATERIAL;
            this.SHORT_TEXT = pSHORT_TEXT;
            this.DOC_TYPE = pDOC_TYPE;
            this.DOC_DATE = pDOC_DATE;
            this.REQ_QTY = pREQ_QTY;
            this.REQ_DATE = pREQ_DATE;
            this.PURCH_NO = pPURCH_NO;
            this.BATCH = pBATCH;
            this.VALID_FROM = pVALID_FROM;
            this.VALID_TO = pVALID_TO;
            this.BILL_BLOCK = pBILL_BLOCK;
            this.DLV_BLOCK = pDLV_BLOCK;
            this.SOLD_TO = pSOLD_TO;
            this.NAME = pNAME;
            this.EXCHG_RATE = pEXCHG_RATE;
            this.DLV_QTY = pDLV_QTY;
            this.BASE_UOM = pBASE_UOM;
            this.NET_PRICE = pNET_PRICE;
            this.COND_P_UNT = pCOND_P_UNT;
            this.COND_UNIT = pCOND_UNIT;
            this.NET_VAL_HD = pNET_VAL_HD;
            this.NET_VALUE = pNET_VALUE;
            this.DIVISION = pDIVISION;
            this.DOC_STATUS = pDOC_STATUS;
            this.SALES_GRP = pSALES_GRP;
            this.SALES_OFF = pSALES_OFF;
            this.SALES_ORG = pSALES_ORG;
            this.SALES_UNIT = pSALES_UNIT;
            this.SHIP_POINT = pSHIP_POINT;
            this.DISTR_CHAN = pDISTR_CHAN;
        }
    }

    @AuraEnabled public sapSalesOrderList.BAPI_SALESORDER_GETLIST BAPI_SALESORDER_GETLIST { get; set; }
    @AuraEnabled public sapSalesOrderList.RETURN_x RETURN_x { get; set; }
    @AuraEnabled public sapSalesOrderList.MATERIAL_EVG MATERIAL_EVG { get; set; }
    @AuraEnabled public list<sapSalesOrderList.EXTENSIONEX> EXTENSIONEX { get; set; }
    @AuraEnabled public list<sapSalesOrderList.EXTENSIONIN> EXTENSIONIN { get; set; }
    @AuraEnabled public list<sapSalesOrderList.SALES_ORDERS> SALES_ORDERS { get; set; }

    public string inputSetName { get; set; }

    public sapSalesOrderList run() {
        overcast.Logger logger1 = createLogger();
        try {
            sapSalesOrderList response = this.run(logger1, null);
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
    
    public sapSalesOrderList run(overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return sapSalesOrderList.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);
        
        return sapSalesOrderList.deserialize(sh.Response);
    }

    public string runAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }

    public static sapSalesOrderList handleAsyncResponse(HttpResponse resp) {
        return sapSalesOrderList.deserialize(resp.getBody());
    }

    public static sapSalesOrderList getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return handleAsyncResponse(response);
    }

    private overcast.SynchronousHandler setup(overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('sapSalesOrderList');
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
        return new overcast.Logger('sapSalesOrderList');
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
    
    public static sapSalesOrderList deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            sapSalesOrderList obj = new sapSalesOrderList();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new sapSalesOrderList();
        }
        sapSalesOrderList obj = (sapSalesOrderList)JSON.deserialize(outputData, sapSalesOrderList.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new sapSalesOrderListException('Response null for sapSalesOrderList request.');
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
                sapSalesOrderListException ex = new sapSalesOrderListException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new sapSalesOrderListException('Malformed response for sapSalesOrderList request.');
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
                throw new sapSalesOrderListException('Response null for sapSalesOrderList request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new sapSalesOrderListException(string.join(errors, ';'));
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
        return 'BAPI_SALESORDER_GETLIST';
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
            metadata.putAll(sapSalesOrderListMeta0.metadata);
        }
        return metadata;
    }

}