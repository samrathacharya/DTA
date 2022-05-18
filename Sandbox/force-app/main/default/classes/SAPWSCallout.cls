public class SAPWSCallout {
    public  PriceResponse getQuotes(PriceRequest quotesRequest) {
        WSQuotesInfo.ZZSFQUOTE request = new WSQuotesInfo.ZZSFQUOTE();
        WSQuotesInfo.ZSF_QTHDR  IS_QTHEADER = SAPRequestBuilder.buildQuotesHeader(quotesRequest);
        WSQuotesInfo.TABLE_OF_ZSF_QTITM IT_ITEMS = SAPRequestBuilder.buildQuotesItems(quotesRequest);
        WSQuotesInfo.TABLE_OF_ZSF_QTCOND IT_COND = SAPRequestBuilder.buildQuotesConditions(quotesRequest);
        SAPRequestBuilder.buildRequest(quotesRequest, request);
        //WEB SERVICE CALLOUT to SAP        
        PriceResponse priceResponse = new PriceResponse(); 
        if (! Test.isRunningTest()) {
            
            request.timeout_x = 30000;
             WSQuotesInfo.TABLE_OF_BAPICOND ET_CONDITIONS_EX = new  WSQuotesInfo.TABLE_OF_BAPICOND();
			WSQuotesInfo.TABLE_OF_BAPISDIT ET_ITEMS_EX = new WSQuotesInfo.TABLE_OF_BAPISDIT();
            WSQuotesInfo.TABLE_OF_BAPIRET2 ET_RETURN = new WSQuotesInfo.TABLE_OF_BAPIRET2();
            WSQuotesInfo.BAPIRET2[] itemsBAP = new  WSQuotesInfo.BAPIRET2[]{};
                ET_RETURN.item = itemsBAP;
             WSQuotesInfo.TABLE_OF_ZZYPARTFUNCTOUT ET_SHIPTO = new WSQuotesInfo.TABLE_OF_ZZYPARTFUNCTOUT();
            WSQuotesInfo.ZZYPARTFUNCTOUT[] items = new WSQuotesInfo.ZZYPARTFUNCTOUT[]{};
                WSQuotesInfo.ZZYPARTFUNCTOUT item = new WSQuotesInfo.ZZYPARTFUNCTOUT();
            items.add(item);
            ET_SHIPTO.item = items;
            WSQuotesInfo.TABLE_OF_ZSD_PRINTFORM ET_ADDRESS = new  WSQuotesInfo.TABLE_OF_ZSD_PRINTFORM();
            WSQuotesInfo.TABLE_OF_BAPISDTEXT IT_SALES_TEXT = SAPRequestBuilder.populateHeaderSalesText(quotesRequest.headerText);
            
            WSQuotesInfo.ZZSFQUOTEResponse_element response = request.ZZSFQUOTE(ET_ADDRESS,
                                                                                ET_CONDITIONS_EX, 
                                                                                null, 
                                                                                ET_ITEMS_EX, 
                                                                                null, 
                                                                                ET_RETURN,
                                                                                ET_SHIPTO,
                                                                                null, 
                                                                                null, 
                                                                                IS_QTHEADER, 
                                                                                IT_COND, 
                                                                                IT_ITEMS, 
                                                                                IT_SALES_TEXT, 
                                                                                quotesRequest.generateQuote);
            //response = request.ZZSFPRICE(IS_HEADER, ITEMS_EX, IT_ITEMS, RETURN_x);
            //system.debug('Response post callout' + priceResponse.toString());
           // system.debug('The default address is ' + response.E_KUNWE);
           SAPResponseParser.parseResponse(response, priceResponse);
        
           
             
        }   
        system.debug('Response post callout' + priceResponse.toString());
          
        
        return priceResponse;
    }
    
    
    
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
    
    
    
}