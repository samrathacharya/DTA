public class SAPRequestBuilder {
    
    //building request for availanility
    
    //building request for availanility
    public static  WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT  buildRequest(List<ProductAvailabilityRequest> avlRequests, 
                                                                                       WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTI request ) {
                                                                                           request.inputHttpHeaders_x = new Map<String, String>();
                                                                                           
                                                                                           // Credentials for callout retrieved from Named Credential SAP
                                                                                           request.inputHttpHeaders_x.put('Cookie', 'name=value');
                                                                                           request.timeout_x = avlRequests[0].configParams.timeout;
                                                                                           
                                                                                           //$Credential merge field gets the reference because of the endpoint_x being set to the Named Credential SAP
                                                                                           //Need Named Credential to have 
                                                                                           //	Identity: Named Principal, 
                                                                                           //	Authentication Protocol: Password authentication
                                                                                           //	username, password,  
                                                                                           //	Generate Authorization Header.
                                                                                           //	Allow merge fields in HTTP Header
                                                                                           request.endpoint_x = 'callout:SAP_Availability_Multi';
                                                                                           request.inputHttpHeaders_x.put('Authorization', '{!$Credential.AuthorizationMethod} {!$Credential.AuthorizationHeaderValue}');
                                                                                           WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT IT_ATP = new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_INPUT();
                                                                                           IT_ATP.Item = new List<WSMaterialsAvailabilityChecker.ZMM_ATP_INPUT>();
                                                                                           for(ProductAvailabilityRequest avaRequest : avlRequests) {
                                                                                               WSMaterialsAvailabilityChecker.ZMM_ATP_INPUT inputItem = new WSMaterialsAvailabilityChecker.ZMM_ATP_INPUT();
                                                                                               system.debug('Request plant code' + avaRequest.productName );
                                                                                               inputItem.PLANT = avaRequest.plantCode;
                                                                                               inputItem.MATERIAL = avaRequest.productName;
                                                                                               inputItem.UNIT = avaRequest.uom;
                                                                                               IT_ATP.Item.add(inputItem);
                                                                                           } 
                                                                                           return IT_ATP;
                                                                                       }
    
    
    //building request for open orders
    public static void buildRequest(OpenOrderRequest orderRequest, WSOpenOrderChecker.config request) {
        //ConfigParams
        request.inputHttpHeaders_x = new Map<String, String>();
        
        // Credentials for callout retrieved from Named Credential SAP
        request.inputHttpHeaders_x.put('Cookie', 'name=value');
        request.timeout_x = orderRequest.configParams.timeout;
        
        //$Credential merge field gets the reference because of the endpoint_x being set to the Named Credential SAP
        //Need Named Credential to have 
        //	Identity: Named Principal, 
        //	Authentication Protocol: Password authentication
        //	username, password, 
        //	Generate Authorization Header.
        //	Allow merge fields in HTTP Header
        request.endpoint_x = 'callout:SAP_Open_Orders';
        request.inputHttpHeaders_x.put('Authorization', '{!$Credential.AuthorizationMethod} {!$Credential.AuthorizationHeaderValue}');
        
    }
    
    //building request for quotes
    //SAP_Quotes
    ////SOAP_TEST
    public static  void buildRequest(PriceRequest quotesRequest, WSQuotesInfo.ZZSFQUOTE request) {
        request.inputHttpHeaders_x = new Map<String, String>();
        request.inputHttpHeaders_x.put('Cookie', 'name=value');
        request.endpoint_x = 'callout:SAP_Quotes';
        //request.endpoint_x = 'callout:SOAP_TEST';
        request.inputHttpHeaders_x.put('Authorization', '{!$Credential.AuthorizationMethod} {!$Credential.AuthorizationHeaderValue}');
    }
     
    //method for building quotes header
    public static WSQuotesInfo.ZSF_QTHDR  buildQuotesHeader(PriceRequest quotesRequest) {
        WSQuotesInfo.ZSF_QTHDR  IS_QTHEADER = new WSQuotesInfo.ZSF_QTHDR();
        //IS_QTHEADER.KUNNR = quotesRequest.
        IS_QTHEADER.KUNNR = quotesRequest.header.customerNumber;
        //IS_QTHEADER..VKORG = quotesRequest.header.salesOrg;
        IS_QTHEADER.sales_org = quotesRequest.header.salesOrg;
        IS_QTHEADER.DISTR_CHAN = quotesRequest.header.distributionChannel;
        IS_QTHEADER.DIVISION = quotesRequest.header.division;
        IS_QTHEADER.PURCH_NO_C = quotesRequest.title;
        IS_QTHEADER.NAME = quotesRequest.title;
        IS_QTHEADER.INT_NUMBER_ASSIGNMENT = quotesRequest.INT_NUMBER_ASSIGNMENT;
        IS_QTHEADER.SF_OPTY_ID = quotesRequest.SF_OPTY_ID;
        IS_QTHEADER.SALESREP = quotesRequest.SALESREP;
        //quotesRequest.
        system.debug('The KUNWE is' + quotesRequest.KUNWE);
        IS_QTHEADER.KUNWE = quotesRequest.KUNWE;
        system.debug('INT_NUMBER_ASSIGNMENT set in the request ' + quotesRequest.INT_NUMBER_ASSIGNMENT);
        if(quotesRequest.isBomExploded) {
            system.debug('Inside Exploded');
           IS_QTHEADER.NOSTRUCTURE = '';
        } else {
            system.debug('Inside else');
            IS_QTHEADER.NOSTRUCTURE = 'x';
        }
            
        //IS_QTHEADER.PURCH_DATE = String.valueOf(Date.newInstance(2019,3,21));
        return IS_QTHEADER;
    }
    
    public static WSQuotesInfo.TABLE_OF_ZSF_QTITM  buildQuotesItems(PriceRequest quotesRequest) {
        WSQuotesInfo.TABLE_OF_ZSF_QTITM  IT_ITEMS = new WSQuotesInfo.TABLE_OF_ZSF_QTITM();
        //IT_ITEMS.
        List<WSQuotesInfo.ZSF_QTITM> items = new List<WSQuotesInfo.ZSF_QTITM>();
        if(null != quotesRequest.productMap && quotesRequest.productMap.size() > 0) {
        for(ProductLineItem pli : quotesRequest.productMap.Values()) {
            WSQuotesInfo.ZSF_QTITM item = new WSQuotesInfo.ZSF_QTITM();
            item.MATERIAL = pli.productCode;
            item.SHORT_TEXT = pli.shortDescription;
            item.TARGET_QTY = pli.quantity;
            item.TARGET_QU = pli.uom;
            item.itm_number = String.valueOf(pli.itemNumber);
            item.HG_LV_ITEM = pli.groupItem;
            item.ITEM_CATEG = pli.category;
            system.debug('The category is ' +item.ITEM_CATEG );
            items.add(item);
        }
        }
        IT_ITEMS.Item = items;
        return IT_ITEMS;
    }
    
    public  static WSQuotesInfo.TABLE_OF_ZSF_QTCOND  buildQuotesConditions(PriceRequest quotesRequest) {
        //TABLE_OF_ZSF_QTCOND
        WSQuotesInfo.TABLE_OF_ZSF_QTCOND IT_COND =  new WSQuotesInfo.TABLE_OF_ZSF_QTCOND();
        List<WSQuotesInfo.ZSF_QTCOND> items = new List<WSQuotesInfo.ZSF_QTCOND>();
        for(ProductLineItem pli : quotesRequest.productMap.Values()) {
            if(pli.discountPercent != null) {
                items.add(populateConditionItem(String.valueOf(pli.itemNumber),'ZQMD',String.valueOf(pli.discountPercent)));
            }
            if(pli.discount != null) {
               items.add(populateConditionItem(String.valueOf(pli.itemNumber),'ZMD$',String.valueOf(pli.discount)));
                //item.currency = 'AUD';
            }
            if(pli.priceOverdue != null) {
                items.add(populateConditionItem(String.valueOf(pli.itemNumber),'ZQMP',String.valueOf(pli.priceOverdue)));
              }
            
        }
        if(null != quotesRequest.discountOverall) {
            items.add(populateConditionItem('0000','HB00',String.valueOf(quotesRequest.discountOverall)));
        }
        if(null != quotesRequest.discountPercentage) {
            items.add(populateConditionItem('0000','ZQMD',String.valueOf(quotesRequest.discountPercentage)));
        }
        IT_COND.item = items;
        return IT_COND;     
    }
    
    private static WSQuotesInfo.ZSF_QTCOND populateConditionItem(String itemNumber,String condType, String condValue) {
         WSQuotesInfo.ZSF_QTCOND item = new WSQuotesInfo.ZSF_QTCOND();
                item.ITM_NUMBER = itemNumber;
                item.COND_TYPE = condType;
                item.COND_VALUE = condValue;
                item.CURRENCY_x = 'AUD';
        return item;
    }
    
    public static WSQuotesInfo.TABLE_OF_BAPISDTEXT populateHeaderSalesText(String headerText) {
        WSQuotesInfo.TABLE_OF_BAPISDTEXT tableText = new WSQuotesInfo.TABLE_OF_BAPISDTEXT();
        tableText.item = new List<WSQuotesInfo.BAPISDTEXT>();
        WSQuotesInfo.BAPISDTEXT item = new WSQuotesInfo.BAPISDTEXT();
        item.FORMAT_COL = '*';
        item.TEXT_Id = 'ZQH1';
        item.LANGU = 'E';
        item.TEXT_LINE = headerText;
        tableText.item.add(item);
        return tableText;
    }
}