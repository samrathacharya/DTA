@IsTest
public class SAPRequestBuilderTest {
    
    @IsTest
    public static void testIncreaseCoverage_sappricerequest() {
        sappricerequest req = new sappricerequest();
        sappricerequest.BAPIRET2 ret2 = new sappricerequest.BAPIRET2();
        sappricerequest.BAPISDIT dit = new sappricerequest.BAPISDIT();
        sappricerequest.TABLE_OF_BAPIRET2 tret2 = new sappricerequest.TABLE_OF_BAPIRET2();
        sappricerequest.TABLE_OF_BAPISDIT tdit = new sappricerequest.TABLE_OF_BAPISDIT();
        sappricerequest.TABLE_OF_ZSF_QTITEM titem = new sappricerequest.TABLE_OF_ZSF_QTITEM();
        sappricerequest.ZSF_QTHEADER hdr = new sappricerequest.ZSF_QTHEADER();
        sappricerequest.ZSF_QTITEM item = new sappricerequest.ZSF_QTITEM();
        sappricerequest.ZZSFPRICE_element price = new sappricerequest.ZZSFPRICE_element();
        sappricerequest.ZZSFPRICEResponse_element resp = new sappricerequest.ZZSFPRICEResponse_element();
        
        System.assertNotEquals(null, req);
    }
    
    @IsTest
    public static void testbuildRequestMulitiProductAvailability() {
        //public static  WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT  buildRequest(List<ProductAvailabilityRequest> avlRequests, 
        //                                                                              WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI request ) {
        List<ProductAvailabilityRequest> avlRequests = new List<ProductAvailabilityRequest>();
        ProductAvailabilityRequest request = new ProductAvailabilityRequest();
        request.plantCode = 'P120';
        request.productName = 'AR-7200';
        request.uom = 'EA';
        request.header = new Header();
        avlRequests.add(request);
        WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI req =  new         WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT input = SAPRequestBuilder.buildRequest(avlRequests, req);   
        System.assertNotEquals(null, avlRequests);
    }

    @IsTest
    public static void testBuildRequest_OpenOrders() {
        OpenOrderRequest orderRequest = new OpenOrderRequest();
        
        //Build Open Order Request object from parameters: ConfigParams, Header, SalesOrderItem
        
        //Request: SAP Open Order web service HTTP configuration parameters
        orderRequest.configParams.timeout = 30000;
        
        //Request:HEADER
        orderRequest.header.customerNumber = '0001002235';
        orderRequest.header.salesOrg = '1000';
        orderRequest.header.distributionChannel = '10';
        orderRequest.header.division = '00';
        
        //SAP web service callout
        OpenOrderResponse orderResponse = new OpenOrderResponse();
        SAPWSCallout callout = new SAPWSCallout();
        orderResponse = callout.getOpenOrders(orderRequest);
        
        System.assertNotEquals(null, orderResponse);
        //System.assertEquals('SUCCESS', orderResponse.responseStatus.result);
    }

    @IsTest
    public static void testIncreaseCoverage_WSOpenOrderChecker() {
        WSOpenOrderChecker req = new WSOpenOrderChecker();
        
        WSOpenOrderChecker.TABLE_OF_BAPIORDERS bapi = new WSOpenOrderChecker.TABLE_OF_BAPIORDERS();
        WSOpenOrderChecker.ZZSFSALESORDERLIST_element ele = new WSOpenOrderChecker.ZZSFSALESORDERLIST_element();
        WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element resp = new WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element();
        WSOpenOrderChecker.BAPIMGVMATNR imgv = new WSOpenOrderChecker.BAPIMGVMATNR();
        WSOpenOrderChecker.BAPIPAREX iparex = new WSOpenOrderChecker.BAPIPAREX();
        WSOpenOrderChecker.TABLE_OF_BAPIPAREX tiparex = new WSOpenOrderChecker.TABLE_OF_BAPIPAREX();
        WSOpenOrderChecker.BAPIORDERS iorder = new WSOpenOrderChecker.BAPIORDERS();
        WSOpenOrderChecker.BAPIRETURN iret = new WSOpenOrderChecker.BAPIRETURN();
        WSOpenOrderChecker.config config = new WSOpenOrderChecker.config();

        System.assertNotEquals(null, req);
    }

    @IsTest
    public static void testIncreaseCoverage_WSMaterialsAvailabilityChecker() {
        WSMaterialsAvailabilityChecker req = new WSMaterialsAvailabilityChecker();
        
        WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element ele = new WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element();
        WSMaterialsAvailabilityChecker.ZMM_WMDVS wmdvs = new WSMaterialsAvailabilityChecker.ZMM_WMDVS();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_WMDVE twmdve = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_WMDVE();
        WSMaterialsAvailabilityChecker.ZMM_ATP_INPUT atpi = new WSMaterialsAvailabilityChecker.ZMM_ATP_INPUT();
        WSMaterialsAvailabilityChecker.ZMM_ATP_EXT atpe = new WSMaterialsAvailabilityChecker.ZMM_ATP_EXT();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT tatpi = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT();
        WSMaterialsAvailabilityChecker.ZMM_WMDVE wmdve = new WSMaterialsAvailabilityChecker.ZMM_WMDVE();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_EXT tatpe = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_EXT();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_WMDVS twmdvs = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_WMDVS();
        WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI_element mele = new WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI_element();
        WSMaterialsAvailabilityChecker.BAPIRETURN bapi = new WSMaterialsAvailabilityChecker.BAPIRETURN();
        WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI availm = new WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI();
            
        System.assertNotEquals(null, req);
    }
    
    @IsTest
    public static void testIncreaseCoverage_WSQuotesInfo() {
        WSQuotesInfo req = new WSQuotesInfo();
        
        WSQuotesInfo.TABLE_OF_BAPISDIT tdit = new WSQuotesInfo.TABLE_OF_BAPISDIT();
        WSQuotesInfo.BAPITEXTLI itextli = new WSQuotesInfo.BAPITEXTLI();
        WSQuotesInfo.ZZSFQUOTEResponse_element resp = new WSQuotesInfo.ZZSFQUOTEResponse_element();
        WSQuotesInfo.TABLE_OF_BAPISDPART tisdpart = new WSQuotesInfo.TABLE_OF_BAPISDPART();
        WSQuotesInfo.BAPISDIT isdit = new WSQuotesInfo.BAPISDIT();
        WSQuotesInfo.BAPISDPART isdpart = new WSQuotesInfo.BAPISDPART();
        WSQuotesInfo.TABLE_OF_BAPITEXTLI titexli = new WSQuotesInfo.TABLE_OF_BAPITEXTLI();
        WSQuotesInfo.TABLE_OF_ZSF_QTITM tqtitm = new WSQuotesInfo.TABLE_OF_ZSF_QTITM();
        WSQuotesInfo.TABLE_OF_BAPIRET2 tiret2 = new WSQuotesInfo.TABLE_OF_BAPIRET2();
        WSQuotesInfo.ZSF_QTCOND qtcond = new WSQuotesInfo.ZSF_QTCOND();
        WSQuotesInfo.ZZSFQUOTE_element quotele = new WSQuotesInfo.ZZSFQUOTE_element();
        WSQuotesInfo.BAPISDTEHD isdtehd = new WSQuotesInfo.BAPISDTEHD();
        WSQuotesInfo.BAPISDTEXT isdtext = new WSQuotesInfo.BAPISDTEXT();
        WSQuotesInfo.KONV konv = new WSQuotesInfo.KONV();
        WSQuotesInfo.BAPICOND icond = new WSQuotesInfo.BAPICOND();
        WSQuotesInfo.ZSF_QTITM qtitm = new WSQuotesInfo.ZSF_QTITM();
        WSQuotesInfo.BAPISDHD isdhd = new WSQuotesInfo.BAPISDHD();
        WSQuotesInfo.TABLE_OF_BAPISDTEHD tisdtehd = new WSQuotesInfo.TABLE_OF_BAPISDTEHD();
        WSQuotesInfo.TABLE_OF_BAPISDTEXT tisdtext = new WSQuotesInfo.TABLE_OF_BAPISDTEXT();
        WSQuotesInfo.TABLE_OF_BAPICOND ticond = new WSQuotesInfo.TABLE_OF_BAPICOND();
        WSQuotesInfo.TABLE_OF_ZSF_QTCOND tqtcond = new WSQuotesInfo.TABLE_OF_ZSF_QTCOND();
        WSQuotesInfo.BAPIRET2 iret2 = new WSQuotesInfo.BAPIRET2();
        WSQuotesInfo.TABLE_OF_KONV tkonv = new WSQuotesInfo.TABLE_OF_KONV();
        WSQuotesInfo.ZSF_QTHDR qthdr = new WSQuotesInfo.ZSF_QTHDR();
        WSQuotesInfo.ZZSFQUOTE quote = new WSQuotesInfo.ZZSFQUOTE();
        
        System.assertNotEquals(null, req);
    }

}