global class ProcessingPriceLists extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Runnable {
/* 
 * Generated by Overcast UTC 2022-01-11 07:10:23Z.
 * This class belongs to the ProcessingPriceLists Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class ProcessingPriceListsException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global ProcessingPriceLists() {
        this.BAPI_PIQ_SDPRICELIST = new ProcessingPriceLists.BAPI_PIQ_SDPRICELIST();
        this.ET_MESSAGE = new List<ProcessingPriceLists.ET_MESSAGE>();
        this.ET_OUTPUT_EXTENSION = new List<ProcessingPriceLists.ET_OUTPUT_EXTENSION>();
        this.ET_PRICING_RESULT = new List<ProcessingPriceLists.ET_PRICING_RESULT>();
        this.IS_CONTROL_DATA = new ProcessingPriceLists.IS_CONTROL_DATA();
        this.IS_OUTPUT_FORMAT = new ProcessingPriceLists.IS_OUTPUT_FORMAT();
        this.IS_SELCRIT = new ProcessingPriceLists.IS_SELCRIT();
        this.IT_OUTPUT_FIELDS = new List<String>();
    }

    public class BAPI_PIQ_SDPRICELIST {
        @AuraEnabled public Integer EV_SUBRC { get; set; }
        @AuraEnabled public String IV_NO_INPUT_CHECK { get; set; }
        @AuraEnabled public String IV_ONLY_PRICING_RESULT { get; set; }

        public BAPI_PIQ_SDPRICELIST() {}

        public BAPI_PIQ_SDPRICELIST(Integer pEV_SUBRC, String pIV_NO_INPUT_CHECK, String pIV_ONLY_PRICING_RESULT) {
            this.EV_SUBRC = pEV_SUBRC;
            this.IV_NO_INPUT_CHECK = pIV_NO_INPUT_CHECK;
            this.IV_ONLY_PRICING_RESULT = pIV_ONLY_PRICING_RESULT;
        }
    }

    public class ET_MESSAGE {
        @AuraEnabled public String TYPE_x { get; set; }
        @AuraEnabled public String ID { get; set; }
        @AuraEnabled public String NUMBER_x { get; set; }
        @AuraEnabled public String MESSAGE { get; set; }
        @AuraEnabled public String LOG_NO { get; set; }
        @AuraEnabled public String LOG_MSG_NO { get; set; }
        @AuraEnabled public String MESSAGE_V1 { get; set; }
        @AuraEnabled public String MESSAGE_V2 { get; set; }
        @AuraEnabled public String MESSAGE_V3 { get; set; }
        @AuraEnabled public String MESSAGE_V4 { get; set; }
        @AuraEnabled public String PARAMETER { get; set; }
        @AuraEnabled public Integer ROW { get; set; }
        @AuraEnabled public String FIELD { get; set; }
        @AuraEnabled public String SYSTEM_x { get; set; }

        public ET_MESSAGE() {}

        public ET_MESSAGE(String pTYPE_x, String pID, String pNUMBER_x, String pMESSAGE, String pLOG_NO, String pLOG_MSG_NO, String pMESSAGE_V1, String pMESSAGE_V2, String pMESSAGE_V3, String pMESSAGE_V4, String pPARAMETER, Integer pROW, String pFIELD, String pSYSTEM_x) {
            this.TYPE_x = pTYPE_x;
            this.ID = pID;
            this.NUMBER_x = pNUMBER_x;
            this.MESSAGE = pMESSAGE;
            this.LOG_NO = pLOG_NO;
            this.LOG_MSG_NO = pLOG_MSG_NO;
            this.MESSAGE_V1 = pMESSAGE_V1;
            this.MESSAGE_V2 = pMESSAGE_V2;
            this.MESSAGE_V3 = pMESSAGE_V3;
            this.MESSAGE_V4 = pMESSAGE_V4;
            this.PARAMETER = pPARAMETER;
            this.ROW = pROW;
            this.FIELD = pFIELD;
            this.SYSTEM_x = pSYSTEM_x;
        }
    }

    public class ET_OUTPUT_EXTENSION {
        @AuraEnabled public String STRUCTURE { get; set; }
        @AuraEnabled public String VALUEPART1 { get; set; }
        @AuraEnabled public String VALUEPART2 { get; set; }
        @AuraEnabled public String VALUEPART3 { get; set; }
        @AuraEnabled public String VALUEPART4 { get; set; }

        public ET_OUTPUT_EXTENSION() {}

        public ET_OUTPUT_EXTENSION(String pSTRUCTURE, String pVALUEPART1, String pVALUEPART2, String pVALUEPART3, String pVALUEPART4) {
            this.STRUCTURE = pSTRUCTURE;
            this.VALUEPART1 = pVALUEPART1;
            this.VALUEPART2 = pVALUEPART2;
            this.VALUEPART3 = pVALUEPART3;
            this.VALUEPART4 = pVALUEPART4;
        }
    }

    public class ET_PRICING_RESULT {
        @AuraEnabled public String VBELN { get; set; }
        @AuraEnabled public String KUNNR { get; set; }
        @AuraEnabled public String KALSM { get; set; }
        @AuraEnabled public String WAERK { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.ITEM> ITEM { get; set; }

        public ET_PRICING_RESULT() {}

        public ET_PRICING_RESULT(String pVBELN, String pKUNNR, String pKALSM, String pWAERK) {
            this.VBELN = pVBELN;
            this.KUNNR = pKUNNR;
            this.KALSM = pKALSM;
            this.WAERK = pWAERK;
        }
    }

    public class ITEM {
        @AuraEnabled public String KPOSN { get; set; }
        @AuraEnabled public String MATNR { get; set; }
        @AuraEnabled public String PRSOK { get; set; }
        @AuraEnabled public String PSTYV { get; set; }
        @AuraEnabled public String WERKS { get; set; }
        @AuraEnabled public String VRKME { get; set; }
        @AuraEnabled public Decimal MGAME { get; set; }
        @AuraEnabled public Decimal NETPR { get; set; }
        @AuraEnabled public Decimal KPEIN { get; set; }
        @AuraEnabled public String KMEIN { get; set; }
        @AuraEnabled public Decimal NETWR { get; set; }
        @AuraEnabled public Decimal MWSBP { get; set; }
        @AuraEnabled public Decimal KZWI1 { get; set; }
        @AuraEnabled public Decimal KZWI2 { get; set; }
        @AuraEnabled public Decimal KZWI3 { get; set; }
        @AuraEnabled public Decimal KZWI4 { get; set; }
        @AuraEnabled public Decimal KZWI5 { get; set; }
        @AuraEnabled public Decimal KZWI6 { get; set; }
        @AuraEnabled public Decimal BONBA { get; set; }
        @AuraEnabled public Decimal PREVA { get; set; }
        @AuraEnabled public Decimal CMPRE { get; set; }
        @AuraEnabled public Decimal WAVWR { get; set; }
        @AuraEnabled public String SCALEDET_STATUS { get; set; }

        public ITEM() {}

        public ITEM(String pKPOSN, String pMATNR, String pPRSOK, String pPSTYV, String pWERKS, String pVRKME, Decimal pMGAME, Decimal pNETPR, Decimal pKPEIN, String pKMEIN, Decimal pNETWR, Decimal pMWSBP, Decimal pKZWI1, Decimal pKZWI2, Decimal pKZWI3, Decimal pKZWI4, Decimal pKZWI5, Decimal pKZWI6, Decimal pBONBA, Decimal pPREVA, Decimal pCMPRE, Decimal pWAVWR, String pSCALEDET_STATUS) {
            this.KPOSN = pKPOSN;
            this.MATNR = pMATNR;
            this.PRSOK = pPRSOK;
            this.PSTYV = pPSTYV;
            this.WERKS = pWERKS;
            this.VRKME = pVRKME;
            this.MGAME = pMGAME;
            this.NETPR = pNETPR;
            this.KPEIN = pKPEIN;
            this.KMEIN = pKMEIN;
            this.NETWR = pNETWR;
            this.MWSBP = pMWSBP;
            this.KZWI1 = pKZWI1;
            this.KZWI2 = pKZWI2;
            this.KZWI3 = pKZWI3;
            this.KZWI4 = pKZWI4;
            this.KZWI5 = pKZWI5;
            this.KZWI6 = pKZWI6;
            this.BONBA = pBONBA;
            this.PREVA = pPREVA;
            this.CMPRE = pCMPRE;
            this.WAVWR = pWAVWR;
            this.SCALEDET_STATUS = pSCALEDET_STATUS;
        }
    }

    public class IS_CONTROL_DATA {
        @AuraEnabled public Date PRSDT { get; set; }
        @AuraEnabled public String AUART { get; set; }
        @AuraEnabled public String DEL_NULL_PRICE { get; set; }
        @AuraEnabled public String DEL_ERROR_PRICE { get; set; }
        @AuraEnabled public String LANGUAGE { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.KOMK_NAME_VALUE> KOMK_NAME_VALUE { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.KOMP_NAME_VALUE> KOMP_NAME_VALUE { get; set; }
        @AuraEnabled public String GET_SCALE_LEVELS { get; set; }
        @AuraEnabled public String MAX_SCALE_LEVELS { get; set; }
        @AuraEnabled public String GET_PRC_DETAIL { get; set; }
        @AuraEnabled public String PRC_DETAIL_VAR { get; set; }
        @AuraEnabled public String LANGUAGE_FROM_CUSTOMER { get; set; }
        @AuraEnabled public String SHOW_LOG { get; set; }
        @AuraEnabled public String KALSM_VARIANT { get; set; }
        @AuraEnabled public String MINQTY { get; set; }
        @AuraEnabled public String PACKSIZE { get; set; }
        @AuraEnabled public String PRC_SIMULATION { get; set; }

        public IS_CONTROL_DATA() {}

        public IS_CONTROL_DATA(Date pPRSDT, String pAUART, String pDEL_NULL_PRICE, String pDEL_ERROR_PRICE, String pLANGUAGE, String pGET_SCALE_LEVELS, String pMAX_SCALE_LEVELS, String pGET_PRC_DETAIL, String pPRC_DETAIL_VAR, String pLANGUAGE_FROM_CUSTOMER, String pSHOW_LOG, String pKALSM_VARIANT, String pMINQTY, String pPACKSIZE, String pPRC_SIMULATION) {
            this.PRSDT = pPRSDT;
            this.AUART = pAUART;
            this.DEL_NULL_PRICE = pDEL_NULL_PRICE;
            this.DEL_ERROR_PRICE = pDEL_ERROR_PRICE;
            this.LANGUAGE = pLANGUAGE;
            this.GET_SCALE_LEVELS = pGET_SCALE_LEVELS;
            this.MAX_SCALE_LEVELS = pMAX_SCALE_LEVELS;
            this.GET_PRC_DETAIL = pGET_PRC_DETAIL;
            this.PRC_DETAIL_VAR = pPRC_DETAIL_VAR;
            this.LANGUAGE_FROM_CUSTOMER = pLANGUAGE_FROM_CUSTOMER;
            this.SHOW_LOG = pSHOW_LOG;
            this.KALSM_VARIANT = pKALSM_VARIANT;
            this.MINQTY = pMINQTY;
            this.PACKSIZE = pPACKSIZE;
            this.PRC_SIMULATION = pPRC_SIMULATION;
        }
    }

    public class KOMK_NAME_VALUE {
        @AuraEnabled public String NAME { get; set; }
        @AuraEnabled public String VALUE { get; set; }

        public KOMK_NAME_VALUE() {}

        public KOMK_NAME_VALUE(String pNAME, String pVALUE) {
            this.NAME = pNAME;
            this.VALUE = pVALUE;
        }
    }

    public class KOMP_NAME_VALUE {
        @AuraEnabled public String NAME { get; set; }
        @AuraEnabled public String VALUE { get; set; }

        public KOMP_NAME_VALUE() {}

        public KOMP_NAME_VALUE(String pNAME, String pVALUE) {
            this.NAME = pNAME;
            this.VALUE = pVALUE;
        }
    }

    public class IS_OUTPUT_FORMAT {
        @AuraEnabled public String DISP_LIST { get; set; }
        @AuraEnabled public List<String> MAIL_ADDR { get; set; }
        @AuraEnabled public String FILE_FORMAT { get; set; }
        @AuraEnabled public String MAIL_TO_CUSTOMERS { get; set; }
        @AuraEnabled public String FTP_UPLOAD { get; set; }
        @AuraEnabled public String FILE_PREFIX { get; set; }
        @AuraEnabled public String FILE_LABEL { get; set; }
        @AuraEnabled public String EMAIL_BODY_TDNAME { get; set; }
        @AuraEnabled public String EMAIL_SUBJECT_TDNAME { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.CUSTOMER_MAILADDR> CUSTOMER_MAILADDR { get; set; }

        public IS_OUTPUT_FORMAT() {}

        public IS_OUTPUT_FORMAT(String pDISP_LIST, String pFILE_FORMAT, String pMAIL_TO_CUSTOMERS, String pFTP_UPLOAD, String pFILE_PREFIX, String pFILE_LABEL, String pEMAIL_BODY_TDNAME, String pEMAIL_SUBJECT_TDNAME) {
            this.DISP_LIST = pDISP_LIST;
            this.FILE_FORMAT = pFILE_FORMAT;
            this.MAIL_TO_CUSTOMERS = pMAIL_TO_CUSTOMERS;
            this.FTP_UPLOAD = pFTP_UPLOAD;
            this.FILE_PREFIX = pFILE_PREFIX;
            this.FILE_LABEL = pFILE_LABEL;
            this.EMAIL_BODY_TDNAME = pEMAIL_BODY_TDNAME;
            this.EMAIL_SUBJECT_TDNAME = pEMAIL_SUBJECT_TDNAME;
        }
    }

    public class MAIL_ADDR {
        @AuraEnabled public String ITEM { get; set; }

        public MAIL_ADDR() {}

        public MAIL_ADDR(String pITEM) {
            this.ITEM = pITEM;
        }
    }

    public class CUSTOMER_MAILADDR {
        @AuraEnabled public String KUNNR { get; set; }
        @AuraEnabled public List<String> EMAIL { get; set; }

        public CUSTOMER_MAILADDR() {}

        public CUSTOMER_MAILADDR(String pKUNNR) {
            this.KUNNR = pKUNNR;
        }
    }

    public class EMAIL {
        @AuraEnabled public String ITEM { get; set; }

        public EMAIL() {}

        public EMAIL(String pITEM) {
            this.ITEM = pITEM;
        }
    }

    public class IS_SELCRIT {
        @AuraEnabled public String VKORG { get; set; }
        @AuraEnabled public String VTWEG { get; set; }
        @AuraEnabled public String SPART { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.KUNNR> KUNNR { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.MATNR> MATNR { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.PRODH> PRODH { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.KONDM> KONDM { get; set; }
        @AuraEnabled public List<String> KUNNR_TAB { get; set; }
        @AuraEnabled public List<String> MATNR_TAB { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.ADDITIONAL_SELCRIT> ADDITIONAL_SELCRIT { get; set; }

        public IS_SELCRIT() {}

        public IS_SELCRIT(String pVKORG, String pVTWEG, String pSPART) {
            this.VKORG = pVKORG;
            this.VTWEG = pVTWEG;
            this.SPART = pSPART;
        }
    }

    public class KUNNR {
        @AuraEnabled public String SIGN { get; set; }
        @AuraEnabled public String OPTION { get; set; }
        @AuraEnabled public String LOW { get; set; }
        @AuraEnabled public String HIGH { get; set; }

        public KUNNR() {}

        public KUNNR(String pSIGN, String pOPTION, String pLOW, String pHIGH) {
            this.SIGN = pSIGN;
            this.OPTION = pOPTION;
            this.LOW = pLOW;
            this.HIGH = pHIGH;
        }
    }

    public class MATNR {
        @AuraEnabled public String SIGN { get; set; }
        @AuraEnabled public String OPTION { get; set; }
        @AuraEnabled public String LOW { get; set; }
        @AuraEnabled public String HIGH { get; set; }

        public MATNR() {}

        public MATNR(String pSIGN, String pOPTION, String pLOW, String pHIGH) {
            this.SIGN = pSIGN;
            this.OPTION = pOPTION;
            this.LOW = pLOW;
            this.HIGH = pHIGH;
        }
    }

    public class PRODH {
        @AuraEnabled public String SIGN { get; set; }
        @AuraEnabled public String OPTION { get; set; }
        @AuraEnabled public String LOW { get; set; }
        @AuraEnabled public String HIGH { get; set; }

        public PRODH() {}

        public PRODH(String pSIGN, String pOPTION, String pLOW, String pHIGH) {
            this.SIGN = pSIGN;
            this.OPTION = pOPTION;
            this.LOW = pLOW;
            this.HIGH = pHIGH;
        }
    }

    public class KONDM {
        @AuraEnabled public String SIGN { get; set; }
        @AuraEnabled public String OPTION { get; set; }
        @AuraEnabled public String LOW { get; set; }
        @AuraEnabled public String HIGH { get; set; }

        public KONDM() {}

        public KONDM(String pSIGN, String pOPTION, String pLOW, String pHIGH) {
            this.SIGN = pSIGN;
            this.OPTION = pOPTION;
            this.LOW = pLOW;
            this.HIGH = pHIGH;
        }
    }

    public class KUNNR_TAB {
        @AuraEnabled public String ITEM { get; set; }

        public KUNNR_TAB() {}

        public KUNNR_TAB(String pITEM) {
            this.ITEM = pITEM;
        }
    }

    public class MATNR_TAB {
        @AuraEnabled public String ITEM { get; set; }

        public MATNR_TAB() {}

        public MATNR_TAB(String pITEM) {
            this.ITEM = pITEM;
        }
    }

    public class ADDITIONAL_SELCRIT {
        @AuraEnabled public String TABLE { get; set; }
        @AuraEnabled public String FIELD { get; set; }
        @AuraEnabled public List<ProcessingPriceLists.RGTAB> RGTAB { get; set; }

        public ADDITIONAL_SELCRIT() {}

        public ADDITIONAL_SELCRIT(String pTABLE, String pFIELD) {
            this.TABLE = pTABLE;
            this.FIELD = pFIELD;
        }
    }

    public class RGTAB {
        @AuraEnabled public String SIGN { get; set; }
        @AuraEnabled public String OPTION { get; set; }
        @AuraEnabled public String LOW { get; set; }
        @AuraEnabled public String HIGH { get; set; }

        public RGTAB() {}

        public RGTAB(String pSIGN, String pOPTION, String pLOW, String pHIGH) {
            this.SIGN = pSIGN;
            this.OPTION = pOPTION;
            this.LOW = pLOW;
            this.HIGH = pHIGH;
        }
    }

    public class IT_OUTPUT_FIELDS {
        @AuraEnabled public String ITEM { get; set; }

        public IT_OUTPUT_FIELDS() {}

        public IT_OUTPUT_FIELDS(String pITEM) {
            this.ITEM = pITEM;
        }
    }

    @AuraEnabled public ProcessingPriceLists.BAPI_PIQ_SDPRICELIST BAPI_PIQ_SDPRICELIST { get; set; }
    @AuraEnabled public List<ProcessingPriceLists.ET_MESSAGE> ET_MESSAGE { get; set; }
    @AuraEnabled public List<ProcessingPriceLists.ET_OUTPUT_EXTENSION> ET_OUTPUT_EXTENSION { get; set; }
    @AuraEnabled public List<ProcessingPriceLists.ET_PRICING_RESULT> ET_PRICING_RESULT { get; set; }
    @AuraEnabled public ProcessingPriceLists.IS_CONTROL_DATA IS_CONTROL_DATA { get; set; }
    @AuraEnabled public ProcessingPriceLists.IS_OUTPUT_FORMAT IS_OUTPUT_FORMAT { get; set; }
    @AuraEnabled public ProcessingPriceLists.IS_SELCRIT IS_SELCRIT { get; set; }
    @AuraEnabled public List<String> IT_OUTPUT_FIELDS { get; set; }

    public string inputSetName { get; set; }

    public ProcessingPriceLists run() {
        overcast.Logger logger1 = createLogger();
        try {
            ProcessingPriceLists response = this.run(logger1, null);
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
    
    public ProcessingPriceLists run(overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return ProcessingPriceLists.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);
        
        return ProcessingPriceLists.deserialize(sh.Response);
    }

    public string runAsync(overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }

    public static ProcessingPriceLists handleAsyncResponse(HttpResponse resp) {
        return ProcessingPriceLists.deserialize(resp.getBody());
    }

    public static ProcessingPriceLists getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return handleAsyncResponse(response);
    }

    private overcast.SynchronousHandler setup(overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('ProcessingPriceLists');
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
        return new overcast.Logger('ProcessingPriceLists');
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
    
    public static ProcessingPriceLists deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            ProcessingPriceLists obj = new ProcessingPriceLists();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new ProcessingPriceLists();
        }
        ProcessingPriceLists obj = (ProcessingPriceLists)JSON.deserialize(outputData, ProcessingPriceLists.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new ProcessingPriceListsException('Response null for ProcessingPriceLists request.');
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
                ProcessingPriceListsException ex = new ProcessingPriceListsException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new ProcessingPriceListsException('Malformed response for ProcessingPriceLists request.');
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
                throw new ProcessingPriceListsException('Response null for ProcessingPriceLists request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new ProcessingPriceListsException(string.join(errors, ';'));
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
        return 'BAPI_PIQ_SDPRICELIST';
    }

    global void set(string parameterName, object value) {
        if (parameterName == null) {
            return;
        }
        if (parameterName == '@testResponse') {
            dynamicBody = (Map<string, object>)value;
            return;
        }
        if (dynamicBody == null) {
            dynamicBody = new Map<string, object>();
        }
        List<String> names = parameterName.split('\\.');
        Integer i;
        Map<string, object> target = dynamicBody;
        for (i = 0; i < names.Size() - 1; i++) {
            String name = names[i];
            if (target.containsKey(name)) {
                target = (Map<string, object>)target.get(name);
            } else {
                Map<string, object> newMap = new Map<string, object>();
                target.put(name, newMap);
                target = newMap;
            }
        }
        target.put(names[i], value);
    }
    
    global object get(string parameterName) {
        if (dynamicBody == null && outputData != null) {
            dynamicBody = (Map<string, object>)JSON.deserializeUntyped(outputData);
        }
        if (dynamicBody == null || parameterName == null) { 
            return null;
        }
        List<String> names = parameterName.split('\\.');
        Integer i;
        Map<string, object> target = dynamicBody;
        for (i = 0; i < names.Size() - 1; i++) {
            String name = names[i];
            if (!target.containsKey(name)) {
                return null;
            }
            target = (Map<string, object>)target.get(name);
            if (target == null) {
                return null;
            }
        }
        return target.get(names[i]);
    }

    global map<string, overcast.TypeInfo> getMetadata() {
        if (metadata == null) {
            metadata = new Map<String, overcast.TypeInfo>();
            metadata.putAll(ProcessingPriceListsMeta0.metadata);
        }
        return metadata;
    }

}