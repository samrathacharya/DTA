public class SAPResponseParser {
    
    
    public static void parseResponse(WSQuotesInfo.ZZSFQUOTEResponse_element response, PriceResponse priceResponse) {
        
        if (null != response) {
            if (null != response) {
                if (null != response.ET_ITEMS_EX.item) { // No error
                    priceResponse.responseStatus.result = 'SUCCESS';
                    priceResponse.responseStatus.message = 'Entire request processed successfully';
                    priceResponse.pdfString = response.E_PDF;
                    for (Integer i = 0; i < response.ET_ITEMS_EX.item.size(); i++) {
                        
                        priceResponse.documentNumber = response.ET_ITEMS_EX.item[i].DOC_Number;
                        OpportunityLineItem oli = new OpportunityLineItem();
                        String productCode;
                        //condition for replacement products
                        if(response.ET_ITEMS_EX.item[i].MATERIAL != response.ET_ITEMS_EX.item[i].MAT_ENTRD) 
                            productCode = response.ET_ITEMS_EX.item[i].MATERIAL;
                        else
                            productCode = response.ET_ITEMS_EX.item[i].MAT_ENTRD;
                        
                        oli.Product2 = new Product2(Product_Code_Id__c = productCode);
                        oli.Quantity = Decimal.valueOf(response.ET_ITEMS_EX.item[i].REQ_QTY);
                        system.debug('The Product and Subtotal2 ' + response.ET_ITEMS_EX.item[i].MAT_ENTRD +' ' + response.ET_ITEMS_EX.item[i].SUBTOT_PP2);
                        oli.UnitPrice = Double.valueOf(response.ET_ITEMS_EX.item[i].NET_PRICE);
                        oli.totalPrice__c = Double.valueOf(response.ET_ITEMS_EX.item[i].NET_VALUE);
                        oli.UOM__c = response.ET_ITEMS_EX.item[i].TARGET_QU;
                        oli.Item_Number__c = Integer.valueOf(response.ET_ITEMS_EX.item[i].ITM_NUMBER);
                        oli.category__c = response.ET_ITEMS_EX.item[i].ITEM_CATEG;//ITEM_CATEG
                        oli.List_Price__c = Double.valueOf(response.ET_ITEMS_EX.item[i].SUBTOT_PP2);
                        oli.Group_Item__c = String.valueOf(Integer.valueOf(response.ET_ITEMS_EX.item[i].HG_LV_ITEM));
                        priceResponse.optyLineItems.put(Integer.valueOf(response.ET_ITEMS_EX.item[i].ITM_NUMBER),oli);
                        priceResponse.productLineItems.put(response.ET_ITEMS_EX.item[i].MAT_ENTRD,oli);
                        system.debug('The oli is' + oli +  oli.List_Price__c);
                        priceResponse.shiptoAddressMap = fetchShipToAddress(response);
                        //oli.Product2.Product_Code_Id__c = 
                    }
                } else if(null != response.E_KUNWE) {
                    priceResponse.responseStatus.result = 'SUCCESS';
                    priceResponse.responseStatus.message = 'Entire request processed successfully';
                    priceResponse.shiptoAddressMap = fetchShipToAddress(response);
                }
                else { // Partial error: either in header or in product line item
                    priceResponse.responseStatus.result = 'ERROR';
                    priceResponse.responseStatus.message = 'Partial error. Request header or requested item in error.';
                    for (Integer i = 0; i < response.ET_RETURN.item.size(); i++) {
                        if (! response.ET_RETURN.item[i].TYPE_x.equals('E')) {
                            continue;
                        } else { // Price response should contain details of first error encountered
                            priceResponse.responseStatus.errorDetail = response.ET_RETURN.item[i].MESSAGE;
                            if (response.ET_RETURN.item[i].PARAMETER.equals('SALES_HEADER_IN')) {
                                priceResponse.responseStatus.errorSource = 'Request Header';
                                priceResponse.responseStatus.erringEntity = 'HEADER';
                            } else if (response.ET_RETURN.item[i].PARAMETER.equals('SALES_ITEM_IN')) {
                                priceResponse.responseStatus.errorSource = 'Requested Product';
                                priceResponse.responseStatus.erringEntity = response.IT_ITEMS.item[i - 1].Material;    
                            } else {
                                priceResponse.responseStatus.errorSource = 'Unknown';
                                priceResponse.responseStatus.erringEntity = 'UNKNOWN';
                            }
                            break;
                        }
                    }
                }
            } else { // SAP response product item list is empty
                priceResponse.responseStatus.result = 'ERROR';
                priceResponse.responseStatus.message = 'Unknown error. Empty product item list received from SAP.';
                priceResponse.productList = null;
            }
        } else { // entire SAP response object is null
            priceResponse.responseStatus.result = 'ERROR';
            priceResponse.responseStatus.message = 'Unknown error. No response received from SAP.';
            priceResponse.productList = null;
        }
    }
    
    
    
    public static Map<String,ProductAvailabilityResponse> parseResponse(WSMaterialsAvailabilityChecker.ZY_MATERIAL_AVAIL_MULTIResponse_element response) {
        Map<String,ProductAvailabilityResponse> responseMap = new Map<String,ProductAvailabilityResponse>();
        if(null != response && null != response.ET_RESULT && null != response.ET_RESULT.item) {
            for (WSMaterialsAvailabilityChecker.ZMM_ATP_EXT responseItem : response.ET_RESULT.item ) {
                if (responseItem != null && responseItem.MATERIAL != null) {
                    ProductAvailabilityResponse responseBlock = new ProductAvailabilityResponse();
                    system.debug('responseItem.MATERIAL' + responseItem.MATERIAL);
                    responseBlock.productCode = responseItem.MATERIAL;
                    responseBlock.availability = responseItem.ATP_MSG.replace(' ', '-');
                    responseBlock.availableQuantity = responseItem.AV_QTY_PLT;
                    responseMap.put(responseItem.MATERIAL,responseBlock );
                }
            }
        }
        return responseMap;
        
    }
    
    //public static void parseResponse()
    public static void parseResponse(WSOpenOrderChecker.ZZSFSALESORDERLISTResponse_element response, OpenOrderResponse orderResponse) {
        if (null != response) { // Some response means error or success
            if (response.RETURN_x.TYPE_x.equals('E')) { // Error
                orderResponse.responseStatus.result = 'ERROR';
                orderResponse.responseStatus.message = response.RETURN_x.MESSAGE;
                orderResponse.salesOrderList = null;
            } else { // Success
                orderResponse.responseStatus.result = 'SUCCESS';
                orderResponse.responseStatus.message = 'Request processed successfully';
                for (Integer i = 0; i < response.SALES_ORDERS.item.size(); i++) {
                    SalesOrderItem salesOrder = new SalesOrderItem();
                    salesOrder.sdDoc = response.SALES_ORDERS.item[i].SD_DOC;
                    salesOrder.itemNumber = response.SALES_ORDERS.item[i].ITM_NUMBER;
                    salesOrder.material = response.SALES_ORDERS.item[i].MATERIAL;
                    salesOrder.shortText = response.SALES_ORDERS.item[i].SHORT_TEXT;
                    salesOrder.docDate = response.SALES_ORDERS.item[i].DOC_DATE;
                    salesOrder.reqDate = response.SALES_ORDERS.item[i].REQ_DATE;
                    salesOrder.reqQty = response.SALES_ORDERS.item[i].REQ_QTY;
                    salesOrder.dlvQty = response.SALES_ORDERS.item[i].DLV_QTY;
                    salesOrder.salesUnit = response.SALES_ORDERS.item[i].SALES_UNIT;
                    orderResponse.salesOrderList.add(salesOrder);
                }
            }
        } else { // Null response is error
            orderResponse.responseStatus.result = 'ERROR';
            orderResponse.responseStatus.message = 'Unknown error. No response received from SAP.';
            orderResponse.salesOrderList = null;
        }
    }
    private static Map<String, string> fetchShipToAddress(WSQuotesInfo.ZZSFQUOTEResponse_element response) {
        //WSQuotesInfo.ZSD_PRINTFORM[] item
        Map<String, string> addressMap = new Map<String, string> ();
        WSQuotesInfo.TABLE_OF_ZZYPARTFUNCTOUT  addTable  = response.ET_SHIPTO;
        system.debug('The address table is ' + addTable );
        system.debug('Cust num is' + response.E_KUNWE);
        if(null != addTable ){
            WSQuotesInfo.ZZYPARTFUNCTOUT[] items = addTable.item;
            // public String KUNNR;
            //public String PARVW;
            //public String LINE_TYPE;
            //public String ADDRESS_LINE;
            if(null != response.ET_SHIPTO) {
               
                for( WSQuotesInfo.ZZYPARTFUNCTOUT item : response.ET_SHIPTO.Item) {
                    if(null != item.ADDRESS && item.ADDRESS.length() > 0 ) {
						system.debug('Address in parser' + item.KUNNR + item.ADDRESS);
                  		 addressMap.put(item.KUNNR, item.NAME1);                        
                    }
                    
                }        
            }
            
        } 
        return addressMap;
    }
    
    
    
}