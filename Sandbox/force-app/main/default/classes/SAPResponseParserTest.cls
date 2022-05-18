@isTest
public class SAPResponseParserTest {
    @isTest
    public static void testProductAvailabilityResponseParsing() {
//public static Map<String,ProductAvailabilityResponse> parseResponse(WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element 
//response) {
    WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element response = 
        new WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element();
    	response.ET_RESULT =  new WSMaterialsAvailabilityChecker.TABLE_OF_ZMM_ATP_EXT ();
        WSMaterialsAvailabilityChecker.ZMM_ATP_EXT responseItem = new WSMaterialsAvailabilityChecker.ZMM_ATP_EXT();
        responseItem.MATERIAL = 'AR-7200';
        responseItem.ATP_MSG = 'Out-of-stock';
        responseItem.AV_QTY_PLT = '0.0';
        List<WSMaterialsAvailabilityChecker.ZMM_ATP_EXT> itemList =  new List<WSMaterialsAvailabilityChecker.ZMM_ATP_EXT>{responseItem};
    	response.ET_RESULT.Item = itemList;
        Map<String, ProductAvailabilityResponse> responseMap = SAPResponseParser.parseResponse(response);
        system.assert(responseMap.get('AR-7200').availability == 'Out-of-stock');
    }
    
    
   
//public static void parseResponse(WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element response, OpenOrderResponse orderResponse) {
   @isTest
    public static void testParseOpenOrdersResponse() {
        WSOpenOrderChecker.BAPIRETURN RETURN_x  = new WSOpenOrderChecker.BAPIRETURN();
        RETURN_x.TYPE_x = 'S';
        WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element response = new WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element();
        response.RETURN_x = RETURN_x;
        response.SALES_ORDERS = new WSOpenOrderChecker.TABLE_OF_BAPIORDERS();
        response.SALES_ORDERS.item = new List<WSOpenOrderChecker.BAPIORDERS>();
        //MATERIAL
        WSOpenOrderChecker.BAPIORDERS item = new WSOpenOrderChecker.BAPIORDERS();
        item.MATERIAL = 'AR-7200';
        /*SalesOrderItem salesOrder = new SalesOrderItem();
                    salesOrder.sdDoc = response.SALES_ORDERS.item[i].SD_DOC;
                    salesOrder.itemNumber = response.SALES_ORDERS.item[i].ITM_NUMBER;
                    salesOrder.material = response.SALES_ORDERS.item[i].MATERIAL;
                    salesOrder.shortText = response.SALES_ORDERS.item[i].SHORT_TEXT;
                    salesOrder.reqDate = response.SALES_ORDERS.item[i].REQ_DATE;
                    salesOrder.reqQty = response.SALES_ORDERS.item[i].REQ_QTY;
                    salesOrder.dlvQty = response.SALES_ORDERS.item[i].DLV_QTY;
                    salesOrder.salesUnit = response.SALES_ORDERS.item[i].SALES_UNIT;*/
        item.SD_DOC = '21312';
        item.ITM_NUMBER = 'test1';
        item.SHORT_TEXT = 'Short Text';
        item.REQ_DATE = 'System.today()';
        item.REQ_QTY = '100.0';
        item.DLV_QTY = '2183';
        item.SALES_UNIT = 'sales unit';
        response.SALES_ORDERS.item.add(item);
        //public static void parseResponse(WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element response, OpenOrderResponse orderResponse) {
        //public sappricerequest.BAPIRET2[] item;
       // response.RETURN_x = new List<sappricerequest.BAPIRET2>();
        SAPResponseParser.parseResponse(response, new OpenOrderResponse());
        
        
    }
    
    @isTest
    public static void testParseReponseQuotes() {
        
        
        /*public WSQuotesInfo.TABLE_OF_ZSD_PRINTFORM ET_ADDRESS;
        public WSQuotesInfo.TABLE_OF_BAPICOND ET_CONDITIONS_EX;
        public WSQuotesInfo.TABLE_OF_KONV ET_CONDITIONS_KONV_EX;
        public WSQuotesInfo.TABLE_OF_BAPISDIT ET_ITEMS_EX;
        public WSQuotesInfo.TABLE_OF_BAPISDPART ET_PARTNERS_EX;
        public WSQuotesInfo.TABLE_OF_BAPIRET2 ET_RETURN;
        public WSQuotesInfo.TABLE_OF_ZZYPARTFUNCTOUT ET_SHIPTO;
        public WSQuotesInfo.TABLE_OF_BAPISDTEHD ET_TEXTHEADERS_EX;
        public WSQuotesInfo.TABLE_OF_BAPITEXTLI ET_TEXTLINES_EX;
        public String E_FREIGHT_OUT;
        public WSQuotesInfo.BAPISDHD E_HEADER_OUT;
        public String E_KUNWE;
        public String E_PDF;
        public String E_TAX_OUT;
        public String E_TOTAL_OUT;
        public String E_VBELN;
        public WSQuotesInfo.TABLE_OF_ZSF_QTCOND IT_COND;
        public WSQuotesInfo.TABLE_OF_ZSF_QTITM IT_ITEMS;
        public WSQuotesInfo.TABLE_OF_BAPISDTEXT IT_SALES_TEXT;
*/
        WSQuotesInfo.ZZSFQUOTEResponse_element response = new  WSQuotesInfo.ZZSFQUOTEResponse_element();
        response.ET_ADDRESS = new WSQuotesInfo.TABLE_OF_ZSD_PRINTFORM();
        response.ET_ADDRESS.item  = new List<WSQuotesInfo.ZSD_PRINTFORM>();
        WSQuotesInfo.ZSD_PRINTFORM prntForm = new WSQuotesInfo.ZSD_PRINTFORM();
        prntForm.ADDRESS_LINE = 'Test address';
        prntForm.KUNNR = '234234234';
		prntForm.LINE_TYPE = 'test line Type';        
    	response.ET_ADDRESS.item.add(prntForm);
        response.ET_ITEMS_EX = new WSQuotesInfo.TABLE_OF_BAPISDIT();
        response.ET_ITEMS_EX.item = new List<WSQuotesInfo.BAPISDIT>();
        //MATERIAL = 'AR-7200';
    	WSQuotesInfo.BAPISDIT item = new WSQuotesInfo.BAPISDIT();
        item.MATERIAL = 'AR-7200';
        item.MAT_ENTRD = '21312';
        item.ITM_NUMBER = 'test1';
        item.SHORT_TEXT = 'Short Text';
        item.REQ_QTY = '100.0';
        item.NET_PRICE = '250.00';
        item.NET_VALUE = '250.00';
        item.ITM_NUMBER = '00001';
        item.HG_LV_ITEM = '00000';
        item.SUBTOT_PP2 = '500';
        
       item.SALES_UNIT = 'sales unit';
        response.ET_ITEMS_EX.item.add(item);
        SAPResponseParser.parseResponse(response, new PriceResponse());
    }
    

}