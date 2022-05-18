public class PricingWSCallout {
    /*
    
    
    
    //multiple products availability requests
    public static Map<String,ProductAvailabilityResponse> getAvailability(List<ProductAvailabilityRequest> avlRequests) { 
        
        //Build Request        
        //WSMaterialAvailabilityChecker.ZY_MATERIAL_AVAILABILITYResponse_element response;
        WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI request = new WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI();
        
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_EXT ET_RESULT = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_EXT();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_WMDVS ET_WMDVSX = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_WMDVS();
        WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT IT_ATP = SAPRequestBuilder.buildRequest(avlRequests, request);
        WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element response 
            = new WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element();
        if (! Test.isRunningTest()) {
        	response = request.ZY_MATERIAL_AVAIL_MULTI(ET_RESULT, null,ET_WMDVSX,IT_ATP);
        }
        Map<String,ProductAvailabilityResponse> responseMap  = SAPResponseParser.parseResponse(response);
        return responseMap; 
        
       
    }
    
    public OpenOrderResponse getOpenOrders(OpenOrderRequest orderRequest) {
        
        //Request Parameters
        //
        WSOpenOrderChecker.TABLE_OF_BAPIPAREX EXTENSIONEX = new WSOpenOrderChecker.TABLE_OF_BAPIPAREX();
        WSOpenOrderChecker.TABLE_OF_BAPIPAREX EXTENSIONIN = new WSOpenOrderChecker.TABLE_OF_BAPIPAREX();
        WSOpenOrderChecker.config request = new WSOpenOrderChecker.config();
        SAPRequestBuilder.buildRequest(orderRequest, request);
        
        //Response Parameters
        WSOpenOrderChecker.TABLE_OF_BAPIORDERS SALES_ORDERS = new WSOpenOrderChecker.TABLE_OF_BAPIORDERS();
        WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element response;
        OpenOrderResponse orderResponse = null;
        
        try {
            //WEB SERVICE CALLOUT to SAP
            if (! Test.isRunningTest()) {
                String DOCUMENT_DATE = null; //'2019-01-01';
                String DOCUMENT_DATE_TO = null; //'2019-03-31';
                response = request.ZZSFSALESORDERLIST(orderRequest.customerNumber, DOCUMENT_DATE, DOCUMENT_DATE_TO, 
                                                      null, null, null, null, null, null, 
                                                      SALES_ORDERS, orderRequest.salesOrganisation, null);
                //Parse Response
            }   
            
            orderResponse = new OpenOrderResponse();
            SAPResponseParser.parseResponse(response, orderResponse);
        } catch (Exception e) {
            orderResponse = null;
        }
        return orderResponse;
        
    }

	
    public QuotesResponse getQuotes(QuotesRequest quotesRequest) {
        //Request parameters
        //
        //WSQuotesInfo.TABLE_OF_BAPICOND ET_CONDITIONS_EX,
        //WSQuotesInfo.TABLE_OF_KONV ET_CONDITIONS_KONV_EX,
        //WSQuotesInfo.TABLE_OF_BAPISDIT ET_ITEMS_EX,
        //WSQuotesInfo.TABLE_OF_BAPISDPART ET_PARTNERS_EX,
        //WSQuotesInfo.TABLE_OF_BAPIRET2 ET_RETURN,
        //WSQuotesInfo.TABLE_OF_BAPISDTEHD ET_TEXTHEADERS_EX,
        //WSQuotesInfo.TABLE_OF_BAPITEXTLI ET_TEXTLINES_EX,
        //WSQuotesInfo.ZSF_QTHDR IS_QTHEADER,
        //WSQuotesInfo.TABLE_OF_ZSF_QTCOND IT_COND,
        //WSQuotesInfo.TABLE_OF_ZSF_QTITM IT_ITEMS,
        //WSQuotesInfo.TABLE_OF_BAPISDTEXT IT_SALES_TEXT,
        //String TESTRUN
        //TODO: Initialize required request parameters
        WSQuotesInfo.ZZSFQUOTE request = new WSQuotesInfo.ZZSFQUOTE();
        SAPRequestBuilder.buildRequest(quotesRequest, request);

        //Response Parameters
        //TODO: Initialize other required response parameters
        WSQuotesInfo.TABLE_OF_BAPIRET2 ET_RETURN = new WSQuotesInfo.TABLE_OF_BAPIRET2();
        WSQuotesInfo.ZZSFQUOTEResponse_element response;
        QuotesResponse quotesResponse = new QuotesResponse();
        
        //WEB SERVICE CALLOUT to SAP
        if (! Test.isRunningTest()) {
            //TODO: Add applicable request parameters
            response = request.ZZSFQUOTE(null, null, null, null, ET_RETURN, null,
                                         null, null, null, null, null, null);
            //Parse Response
        }   
        
        SAPResponseParser.parseResponse(response, quotesResponse);
        return quotesResponse;

    }
	*/
}