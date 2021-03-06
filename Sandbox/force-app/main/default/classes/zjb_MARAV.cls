global class zjb_MARAV extends overcast.Realtime.ScenarioExtension implements overcast.Realtime.Queryable {
/* 
 * Generated by Overcast UTC 2021-11-25 10:19:20Z.
 * This class belongs to the zjb_MARAV Real-time Integration Scenario.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    public class zjb_MARAVException extends Exception {
        private List<String> messages;
        public List<String> getMessages() {
            return messages;
        }
        public void setMessages(List<String> messages) {
            this.messages = messages;
        }
    }
    global zjb_MARAV() {
        this.MARAV = new list<zjb_MARAV.MARAV>();
    }

    public class MARAV {
        @AuraEnabled public String MANDT { get; set; }
        @AuraEnabled public String MATNR { get; set; }
        @AuraEnabled public String SPRAS { get; set; }
        @AuraEnabled public Date ERSDA { get; set; }
        @AuraEnabled public String ERNAM { get; set; }
        @AuraEnabled public Date LAEDA { get; set; }
        @AuraEnabled public String AENAM { get; set; }
        @AuraEnabled public String VPSTA { get; set; }
        @AuraEnabled public String PSTAT { get; set; }
        @AuraEnabled public String LVORM { get; set; }
        @AuraEnabled public String MTART { get; set; }
        @AuraEnabled public String MBRSH { get; set; }
        @AuraEnabled public String MATKL { get; set; }
        @AuraEnabled public String BISMT { get; set; }
        @AuraEnabled public String MEINS { get; set; }
        @AuraEnabled public String BSTME { get; set; }
        @AuraEnabled public String ZEINR { get; set; }
        @AuraEnabled public String ZEIAR { get; set; }
        @AuraEnabled public String ZEIVR { get; set; }
        @AuraEnabled public String ZEIFO { get; set; }
        @AuraEnabled public String AESZN { get; set; }
        @AuraEnabled public String BLATT { get; set; }
        @AuraEnabled public String BLANZ { get; set; }
        @AuraEnabled public String FERTH { get; set; }
        @AuraEnabled public String FORMT { get; set; }
        @AuraEnabled public String GROES { get; set; }
        @AuraEnabled public String WRKST { get; set; }
        @AuraEnabled public String NORMT { get; set; }
        @AuraEnabled public String LABOR { get; set; }
        @AuraEnabled public String EKWSL { get; set; }
        @AuraEnabled public Decimal BRGEW { get; set; }
        @AuraEnabled public Decimal NTGEW { get; set; }
        @AuraEnabled public String GEWEI { get; set; }
        @AuraEnabled public Decimal VOLUM { get; set; }
        @AuraEnabled public String VOLEH { get; set; }
        @AuraEnabled public String BEHVO { get; set; }
        @AuraEnabled public String RAUBE { get; set; }
        @AuraEnabled public String TEMPB { get; set; }
        @AuraEnabled public String DISST { get; set; }
        @AuraEnabled public String TRAGR { get; set; }
        @AuraEnabled public String STOFF { get; set; }
        @AuraEnabled public String SPART { get; set; }
        @AuraEnabled public String EAN11 { get; set; }
        @AuraEnabled public String NUMTP { get; set; }
        @AuraEnabled public Decimal LAENG { get; set; }
        @AuraEnabled public Decimal BREIT { get; set; }
        @AuraEnabled public Decimal HOEHE { get; set; }
        @AuraEnabled public String MEABM { get; set; }
        @AuraEnabled public String PRDHA { get; set; }
        @AuraEnabled public String KUNNR { get; set; }
        @AuraEnabled public String AEKLK { get; set; }
        @AuraEnabled public String CADKZ { get; set; }
        @AuraEnabled public String QMPUR { get; set; }
        @AuraEnabled public String ETIFO { get; set; }
        @AuraEnabled public String ETIAR { get; set; }
        @AuraEnabled public Decimal ERGEW { get; set; }
        @AuraEnabled public String ERGEI { get; set; }
        @AuraEnabled public Decimal ERVOL { get; set; }
        @AuraEnabled public String ERVOE { get; set; }
        @AuraEnabled public Decimal GEWTO { get; set; }
        @AuraEnabled public Decimal VOLTO { get; set; }
        @AuraEnabled public String VABME { get; set; }
        @AuraEnabled public String MAKTX { get; set; }
        @AuraEnabled public String MAKTG { get; set; }
        @AuraEnabled public String KZREV { get; set; }
        @AuraEnabled public String KZKFG { get; set; }
        @AuraEnabled public String XCHPF { get; set; }
        @AuraEnabled public String VHART { get; set; }
        @AuraEnabled public Decimal FUELG { get; set; }
        @AuraEnabled public Integer STFAK { get; set; }
        @AuraEnabled public String MAGRV { get; set; }
        @AuraEnabled public String BEGRU { get; set; }
        @AuraEnabled public String MLGUT { get; set; }
        @AuraEnabled public String KZKUP { get; set; }
        @AuraEnabled public String KZNFM { get; set; }
        @AuraEnabled public String TAKLV { get; set; }
        @AuraEnabled public String RBNRM { get; set; }
        @AuraEnabled public Decimal MHDRZ { get; set; }
        @AuraEnabled public Decimal MHDHB { get; set; }
        @AuraEnabled public Decimal MHDLP { get; set; }
        @AuraEnabled public Date DATAB { get; set; }
        @AuraEnabled public Date LIQDT { get; set; }
        @AuraEnabled public String SAISJ { get; set; }
        @AuraEnabled public String PLGTP { get; set; }
        @AuraEnabled public String EXTWG { get; set; }
        @AuraEnabled public String SATNR { get; set; }
        @AuraEnabled public String ATTYP { get; set; }
        @AuraEnabled public String PMATA { get; set; }
        @AuraEnabled public String MSTAE { get; set; }
        @AuraEnabled public String MSTAV { get; set; }
        @AuraEnabled public Date MSTDE { get; set; }
        @AuraEnabled public Date MSTDV { get; set; }
        @AuraEnabled public String INHME { get; set; }
        @AuraEnabled public Decimal INHAL { get; set; }
        @AuraEnabled public Decimal VPREH { get; set; }
        @AuraEnabled public String ETIAG { get; set; }
        @AuraEnabled public Decimal INHBR { get; set; }
        @AuraEnabled public String BWSCL { get; set; }
        @AuraEnabled public String KZUMW { get; set; }
        @AuraEnabled public String KOSCH { get; set; }
        @AuraEnabled public String CUOBF { get; set; }
        @AuraEnabled public String SPROF { get; set; }
        @AuraEnabled public String NRFHG { get; set; }
        @AuraEnabled public String MFRPN { get; set; }
        @AuraEnabled public String MFRNR { get; set; }
        @AuraEnabled public String BMATN { get; set; }
        @AuraEnabled public String MPROF { get; set; }
        @AuraEnabled public String KZWSM { get; set; }
        @AuraEnabled public String SAITY { get; set; }
        @AuraEnabled public String PROFL { get; set; }
        @AuraEnabled public String IHIVI { get; set; }
        @AuraEnabled public String ILOOS { get; set; }
        @AuraEnabled public String SERLV { get; set; }
        @AuraEnabled public String KZGVH { get; set; }
        @AuraEnabled public String XGCHP { get; set; }
        @AuraEnabled public String KZEFF { get; set; }
        @AuraEnabled public String COMPL { get; set; }
        @AuraEnabled public String IPRKZ { get; set; }
        @AuraEnabled public String RDMHD { get; set; }
        @AuraEnabled public String PRZUS { get; set; }
        @AuraEnabled public String MTPOS_MARA { get; set; }
        @AuraEnabled public String BFLME { get; set; }
        @AuraEnabled public String MATFI { get; set; }
        @AuraEnabled public String CMREL { get; set; }
        @AuraEnabled public String SLED_BBD { get; set; }
        @AuraEnabled public String GTIN_VARIANT { get; set; }
        @AuraEnabled public String GENNR { get; set; }
        @AuraEnabled public String RMATP { get; set; }
        @AuraEnabled public String GDS_RELEVANT { get; set; }
        @AuraEnabled public String MCOND { get; set; }
        @AuraEnabled public String RETDELC { get; set; }
        @AuraEnabled public String LOGLEV_RETO { get; set; }
        @AuraEnabled public String NSNID { get; set; }
        @AuraEnabled public String WEORA { get; set; }
        @AuraEnabled public String IPMIPPRODUCT { get; set; }
        @AuraEnabled public String MEDIUM { get; set; }
        @AuraEnabled public String COMMODITY { get; set; }
        @AuraEnabled public String SGT_CSGR { get; set; }
        @AuraEnabled public String SGT_COVSA { get; set; }
        @AuraEnabled public String SGT_REL { get; set; }
        @AuraEnabled public String x_CWM_XCWMAT { get; set; }
        @AuraEnabled public String x_CWM_VALUM { get; set; }
        @AuraEnabled public String x_CWM_TOLGR { get; set; }

        public MARAV() {}

        public MARAV(String pMANDT, String pMATNR, String pSPRAS, Date pERSDA, String pERNAM, Date pLAEDA, String pAENAM, String pVPSTA, String pPSTAT, String pLVORM, String pMTART, String pMBRSH, String pMATKL, String pBISMT, String pMEINS, String pBSTME, String pZEINR, String pZEIAR, String pZEIVR, String pZEIFO, String pAESZN, String pBLATT, String pBLANZ, String pFERTH, String pFORMT, String pGROES, String pWRKST, String pNORMT, String pLABOR, String pEKWSL, Decimal pBRGEW, Decimal pNTGEW) {
            this.MANDT = pMANDT;
            this.MATNR = pMATNR;
            this.SPRAS = pSPRAS;
            this.ERSDA = pERSDA;
            this.ERNAM = pERNAM;
            this.LAEDA = pLAEDA;
            this.AENAM = pAENAM;
            this.VPSTA = pVPSTA;
            this.PSTAT = pPSTAT;
            this.LVORM = pLVORM;
            this.MTART = pMTART;
            this.MBRSH = pMBRSH;
            this.MATKL = pMATKL;
            this.BISMT = pBISMT;
            this.MEINS = pMEINS;
            this.BSTME = pBSTME;
            this.ZEINR = pZEINR;
            this.ZEIAR = pZEIAR;
            this.ZEIVR = pZEIVR;
            this.ZEIFO = pZEIFO;
            this.AESZN = pAESZN;
            this.BLATT = pBLATT;
            this.BLANZ = pBLANZ;
            this.FERTH = pFERTH;
            this.FORMT = pFORMT;
            this.GROES = pGROES;
            this.WRKST = pWRKST;
            this.NORMT = pNORMT;
            this.LABOR = pLABOR;
            this.EKWSL = pEKWSL;
            this.BRGEW = pBRGEW;
            this.NTGEW = pNTGEW;
        }
    }

    @AuraEnabled public list<zjb_MARAV.MARAV> MARAV { get; set; }

    public string inputSetName { get; set; }

    public zjb_MARAV runQuery(overcast.Query query) {
        overcast.Logger logger1 = createLogger();
        try {
            zjb_MARAV response = this.runQuery(query, logger1, null);
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

    public zjb_MARAV runQuery(overcast.Query query, overcast.Logger logger, string namedCredential) {
        return run(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential);
    }

    public string runQueryAsync(overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        return runAsync(overcast.SynchronousHandler.OperationType.EpgwSelect, query, logger, namedCredential, con);
    }

    public static zjb_MARAV getAsyncResponse(String requestLabel) {
        HttpResponse response = Continuation.getResponse(requestLabel);
        return zjb_MARAV.deserialize(response.getBody());
    }

    private overcast.SynchronousHandler setup(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = overcast.SynchronousHandler.CreateFromName('zjb_MARAV');
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
    
    private zjb_MARAV run(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        if (Test.isRunningTest()) {
            if (this.dynamicBody != null) {
                return this;
            }
            return zjb_MARAV.deserialize(this.testResponse);
        }
        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return zjb_MARAV.deserialize(sh.Response);
    }

    private string runAsync(overcast.SynchronousHandler.OperationType operation, overcast.Query query, overcast.Logger logger, string namedCredential, Continuation con) {
        overcast.SynchronousHandler sh = setup(operation, query, logger, namedCredential);

        sh.ContinuationWebRequest = new HttpRequest();

        overcast.EpgwController.ExecuteScenarioSynchronously(sh, logger);

        return con.addHttpRequest(sh.ContinuationWebRequest);
    }
        

    private static overcast.Logger createLogger() {
        return new overcast.Logger('zjb_MARAV');
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
    
    public static zjb_MARAV deserialize(string responsedata) {
        if (overcast.Globals.IsOCF) {
            zjb_MARAV obj = new zjb_MARAV();
            obj.loadAsyncResponse(responsedata);
            return obj;
        }
        map<string, string> m = getOutputData(responsedata);
        string outputData = m.get('output');
        string backendMessage = m.get('backendMessage');
        if (outputData == null) {
            return new zjb_MARAV();
        }
        zjb_MARAV obj = (zjb_MARAV)JSON.deserialize(outputData, zjb_MARAV.class);
        obj.outputData = outputData;
        obj.backendMessage = backendMessage;

        return obj;
    }

    private static map<string, string> getOutputData(string responseData) {
        if (string.isblank(responsedata)) {
            throw new zjb_MARAVException('Response null for zjb_MARAV request.');
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
                zjb_MARAVException ex = new zjb_MARAVException(string.join(errors, ';'));
                ex.setMessages(errors);
                throw ex;
            }
        }
        if (!hasOutput) {
            throw new zjb_MARAVException('Malformed response for zjb_MARAV request.');
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
                throw new zjb_MARAVException('Response null for zjb_MARAV request.');
            }
            map<string, object> responseObj = (map<string, object>)JSON.deserializeUntyped(responseBody);
            if (responseObj.containsKey('error')) {
                object[] errors = (object[])responseObj.get('error');
                throw new zjb_MARAVException(string.join(errors, ';'));
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
        return 'MARAV';
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
            metadata.putAll(zjb_MARAVMeta0.metadata);
        }
        return metadata;
    }

}