global with sharing class sapOrderSimulatePlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private Boolean reSimulate = false;
    @TestVisible
    private Map<String, Object> ovcPrevPagePartners = new Map<String, Object>();   
    @TestVisible
    private Map<String, Object> matTransGrpPrev = new Map<String, Object>();
    @TestVisible
    Partner orderSearchPartner = new Partner();
    @TestVisible
    private String recordId;   
    @TestVisible
    Map<String, Object> importMap = new Map<String, Object>();    
    @TestVisible
    Map<String, String> shipCondPrevMap = new Map<String, String>();       
    private Boolean shErrorMessage = false;
    private Boolean searchSPPartner = false;
    private Map<String, Object> ovcPrevNotes = new Map<String, Object>();  
    private overcast.Logger logger;
    private String shipToPrevCheck;
    private String shipToCurrent;    
    
    global sapOrderSimulatePlugin() {
        return;
    }

    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        return;
    }

    global void afterReferenceValuesLoaded(Id recordId, String componentName, Map<String, Map<String, Object>> referenceValues) {
        return;
    }

    global void afterReferenceValuesLoaded(
        Id recordId,
        String componentName,
        Map<String, Map<String, Object>> referenceValues,
        Map<String, List<Map<String, Object>>> referenceChildValues
    ) {
        return;
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        System.debug('importParamsTest' + JSON.serialize(importParameters));
        this.importMap = importParameters;
        this.recordId = recordId;
        Map<String, Object> pageInfo = (Map<String, Object>) importParameters.get('ocf_PageData');
        if (pageInfo != null) {
            Map<String, Object> ordHeader = (Map<String, Object>) pageInfo.get('ORDER_HEADER_IN');
            if (ordHeader.get('ovcPrevPartners') != null) {
                String previousPartners = (String) ordHeader.get('ovcPrevPartners');
                if (!String.isEmpty(previousPartners)) {
                    ovcPrevPagePartners = (Map<String, Object>) JSON.deserializeUntyped(previousPartners);
                }
            }
            this.shipToPrevCheck = (String) ovcPrevPagePartners.get('ShiptoBP');
            /*orderSearchPartner.salesOrg = (String) ordHeader.get('SALES_ORG');
            orderSearchPartner.distributionChannel = (String) ordHeader.get('DISTR_CHAN');
            orderSearchPartner.division = (String) ordHeader.get('DIVISION');*/
            if (ordHeader.get('ovcPrevNotes') != null) {
                String previousNotes = (String) ordHeader.get('ovcPrevNotes');
                if (!String.isEmpty(previousNotes)) {
                    ovcPrevNotes = (Map<String, Object>) JSON.deserializeUntyped(previousNotes);
                }
            }      
            this.shipCondPrevMap.put('shipConditionKey', (String) ordHeader.get('ovcShipCondKey'));
            this.shipCondPrevMap.put('shipCondition', (String) ordHeader.get('SHIP_COND'));         
            List<Object> newPartners = new List<Object>();
            Map<String, Object> partners = (Map<String, Object>) pageInfo.get('ocf_PARTNERS');
            Map<String, String> partnerMap = new Map<String, String>{
                'ocf_SHIPTO' => 'SH',
                'ocf_SOLDTO' => 'SP',
                'ocf_BILLTO' => 'BP',
                'Payer' => 'PY'
            };
            String shCurrPartner = (String) partners.get('ocf_SHIPTO');
            this.shipToCurrent = shCurrPartner;
            if (String.isEmpty(shCurrPartner) && !String.isEmpty(this.shipToPrevCheck)) {
                this.shErrorMessage = true;
            }

            if ((String) ordHeader.get('RerunCheck') != 'X') {
                for (String field : partners.keySet()) {
                    String p = (String) partners.get(field);
                    if (String.isNotEmpty(p) && partnerMap.get(field) != null && !(p.length() > 10)) {
                        //this.ovcPagePartners.put(field, p);
                        String partnRole = partnerMap.get(field);
                        if (this.shipToPrevCheck == shCurrPartner) {
                            newPartners.add(new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'PARTN_ROLE' => partnRole, 'PARTN_NUMB' => p });
                        } else if (shCurrPartner != this.shipToPrevCheck && partnRole == 'SH') {
                            newPartners.add(new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'PARTN_ROLE' => 'SH', 'PARTN_NUMB' => shCurrPartner });
                        }
                    }
                }
                if (!newPartners.isEmpty()) {
                    referenceFieldValues.remove('ORDER_PARTNERS');
                    importParameters.put('ORDER_PARTNERS', newPartners);
                }
            }

            List<Object> orderItemsIn = (List<Object>) importParameters.get('ORDER_ITEMS_IN');
            Map<String, Object> itemDelBlock = new Map<String, Object>();
            if (orderItemsIn != null) {
                for (Object orderItemObj : orderItemsIn) {
                    Map<String, Object> orderItem = (Map<String, Object>) orderItemObj;
                    String itemNumber = convertItemNumberString(orderItem.get('ITM_NUMBER'));
                    String deliveryBlock = (String) orderItem.get('ovcDelivery_Block');
                    if (!String.isBlank(deliveryBlock)) {
                        itemDelBlock.put(itemNumber, deliveryBlock);
                    }
					String itemCateg = (String) orderItem.get('ITEM_CATEG');    
                    if(itemCateg == 'ZAGN'){
                    	orderItem.remove('ITEM_CATEG');    
                    }
                }
            }

            List<Object> orderSchedList = (List<Object>) importParameters.get('ORDER_SCHEDULE_IN');
            if (orderSchedList != null && !itemDelBlock.isEmpty()) {
                for (Object orderSchedObj : orderSchedList) {
                    Map<String, Object> orderSchedIn = (Map<String, Object>) orderSchedObj;
                    String schedItemNumber = (String) orderSchedIn.get('ITM_NUMBER');
                    if (itemDelBlock.get(schedItemNumber) != null) {
                        orderSchedIn.put('REQ_DLV_BL', itemDelBlock.get(schedItemNumber));
                    }
                }
            }
            if (ordHeader.get('ovcMatTransGrp') != null) {
                String materialTraGroup = (String) ordHeader.get('ovcMatTransGrp');
                if (!String.isEmpty(materialTraGroup)) {
                    matTransGrpPrev = (Map<String, Object>) JSON.deserializeUntyped(materialTraGroup);
                }
            }
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        //System.debug('returnedDataTest' + JSON.serialize(returnedData));
        Map<String, Object> returnX = (Map<String, Object>) returnedData.get('RETURN_x');
        if (shErrorMessage == true) {
            returnX.put('TYPE_x', 'E');
            returnX.put('MESSAGE', 'Ship To field is required!');
            return;
        }

        List<Object> orderItemsOut = (List<Object>) returnedData.get('ORDER_ITEMS_OUT');
        List<Object> orderSchedItemList = (List<Object>) returnedData.get('ORDER_SCHEDULE_EX');
        Map<String, Object> orderHeaderIn = (Map<String, Object>) returnedData.get('ORDER_HEADER_IN');

        if (!orderSchedItemList.isEmpty()) {
            Map<String, Object> schedItemMatAvailMap = new Map<String, Object>();
            for (Object orderSchedObj : orderSchedItemList) {
                Map<String, Object> schedItemMap = (Map<String, Object>) orderSchedObj;
                if (schedItemMap.get('MS_DATE') != null) {
                    schedItemMatAvailMap.put((String) schedItemMap.get('ITM_NUMBER'), schedItemMap.get('MS_DATE'));
                }
            }
            for (Object orderItemsObj : orderItemsOut) {
                Map<String, Object> orderItems = (Map<String, Object>) orderItemsObj;
                String itemNumber = (String) orderItems.get('ITM_NUMBER');
                if (schedItemMatAvailMap.get(itemNumber) != null) {
                    orderItems.put('ovcMaterial_Availability', schedItemMatAvailMap.get(itemNumber));
                }
            }
        }
        
        Map<String, Object> shipToParty = (Map<String, Object>) returnedData.get('SHIP_TO_PARTY');
        //String currShipTo = (String) shipToParty.get('SHIP_TO');
        //if (this.shipToPrevCheck == currShipTo){
        	//orderHeaderIn.put('ovcShipCond', (String) orderHeaderIn.get('SHIP_COND'));     
        //}      
        //else {
            //orderHeaderIn.put('ovcShipCond', (String) shipToParty.get('SHIP_COND'));
        //}

        if (!orderItemsOut.isEmpty()) {
            List<String> productCodeList = new List<String>();
            Map<String, Object> matTransportGroup = new Map<String, Object>();
            Set<String> prevMaterial = this.matTransGrpPrev.keySet();
            Map<String, Object> itemShipPoint = new Map<String, Object>();

            for (Object orderItemObj : orderItemsOut) {
                Map<String, Object> orderItem = (Map<String, Object>) orderItemObj;
                if (orderItem.get('SHIP_POINT') != null) {
                    itemShipPoint.put((String) orderItem.get('ITM_NUMBER'), orderItem.get('SHIP_POINT'));
                    String itmMaterial = (String) orderItem.get('MATERIAL');
                    if (!prevMaterial.contains(itmMaterial)) {
                        productCodeList.add(itmMaterial);
                    } else {
                        matTransportGroup.put(itmMaterial, matTransGrpPrev.get(itmMaterial));
                    }
                }
            }
            if (!productCodeList.isEmpty()) {
                List<Product2> records = databaseAccess.getProduct(productCodeList);
                for (Product2 product : records) {
                    matTransportGroup.put(product.ProductCode, product.ovcTransport_Group__c);
                    matTransGrpPrev.put(product.ProductCode, product.ovcTransport_Group__c);
                }
            }

            Map<String, Map<String, Object>> itemDepPoint = getShipDepartureInfo(itemShipPoint, logger);
            for (Object orderItemObj : orderItemsOut) {
                String itemRouteSearchKey;
                Map<String, Object> orderItem = (Map<String, Object>) orderItemObj;
                String itemNumber = (String) orderItem.get('ITM_NUMBER');
                String material = (String) orderItem.get('MATERIAL');
                if (itemDepPoint.get(itemNumber) != null) {
                    Map<String, Object> itemDepMap = itemDepPoint.get(itemNumber);
                    String departureCountry = (String) itemDepMap.get('DEP_COUNTRY');
                    String departureZone = (String) itemDepMap.get('DEP_ZONE');
                    //String shipCond = (String) shipToParty.get('SHIP_COND');
                    String transGroup = (String) matTransportGroup.get(material);
                    String destinationCountry = (String) shipToParty.get('DEST_CNTRY');
                    String transportZone = (String) shipToParty.get('TRNSP_ZONE');
                    itemRouteSearchKey = departureCountry + '/' + departureZone + '/' + transGroup + '/' + destinationCountry + '/' + transportZone;
                    orderItem.put('ovcRouteKey', itemRouteSearchKey);
                }
            }
            orderHeaderIn.put('ovcMatTransGrp', JSON.serialize(matTransGrpPrev));
        }

        List<String> shipCondKeyField = new List<String>{ 'DOC_TYPE', 'SALES_ORG', 'DISTR_CHAN' };
        List<String> shipCondKeyList = new List<String>();
        for (String shipKey : shipCondKeyField) {
                String shipCondKeyParam = (String) orderHeaderIn.get(shipKey);
                shipCondKeyList.add(shipCondKeyParam); 
        }
        String shipCondCompactKey = String.join(new List<String>(shipCondKeyList), '/');
        orderHeaderIn.put('ovcShipCondKey', shipCondCompactKey);
         
        System.debug('Test0:'+this.shipCondPrevMap.get('shipConditionKey')+'-'+shipCondCompactKey);
        if(this.shipCondPrevMap.get('shipConditionKey') != shipCondCompactKey ){
            System.debug('Test1:'+(String) shipToParty.get('SHIP_COND'));
        	orderHeaderIn.put('ovcShipCond', (String) shipToParty.get('SHIP_COND'));    
        }
        else{
            System.debug('Test2:'+this.shipCondPrevMap.get('shipCondition'));
        	orderHeaderIn.put('ovcShipCond', this.shipCondPrevMap.get('shipCondition'));    
        }
        
        String salesOrg = (String) orderHeaderIn.get('SALES_ORG');
        String distChan = (String) orderHeaderIn.get('DISTR_CHAN');
        String division = (String) orderHeaderIn.get('DIVISION');        
        if ((String) returnX.get('TYPE_x') == 'E' && (String) returnX.get('CODE') == 'VP113') {
            Map<String, Object> pageInfo = (Map<String, Object>) this.importMap.get('ocf_PageData');
            Map<String, Object> ordHeader = (Map<String, Object>) pageInfo.get('ORDER_HEADER_IN');
            ordHeader.put('RerunCheck', 'X');
            returnedData.put('RETURN_x', new Map<String, Object>());
            List<Object> newPartners = new List<Object>();
            newPartners.add(new Map<String, Object>{ 'ITM_NUMBER' => '000000', 'PARTN_ROLE' => 'SP', 'PARTN_NUMB' => shipToCurrent });
            
            this.importMap.put('ORDER_PARTNERS', newPartners);
            Map<String, Object> rerunReturnedData = new Map<String, Object>();
            if (!Test.isRunningTest()) {
                rerunReturnedData = overcast.ComponentFrameworkController.callScenarioFromApex(
                    this.recordId,
                    'sapOrderSimulateTermCheck',
                    JSON.serialize(this.importMap)
                );
                //workaround for pending call
                reSimulate = true;
                /*returnedData.put('SOLD_TO_PARTY', rerunReturnedData.get('SOLD_TO_PARTY'));
                returnedData.put('ORDER_PARTNERS', rerunReturnedData.get('ORDER_PARTNERS'));
                returnedData.put('BILLING_PARTY', rerunReturnedData.get('BILLING_PARTY'));*/
                returnedData.put('SHIP_TO_PARTY', rerunReturnedData.get('SHIP_TO_PARTY'));
        	} 
        }

        String spCurPartn;
        Map<String, Object> soldToParty = (Map<String, Object>) returnedData.get('SOLD_TO_PARTY');
        if (!soldToParty.isEmpty()) {
            String soldToPartner = (String) soldToParty.get('SOLD_TO');
            orderHeaderIn.put('ovcDefaultSoldTo', soldToPartner);
            //ovcPrevPagePartners.put('SoldtoBP', soldToPartner);
            spCurPartn = soldToPartner;
        }
        
        Map<String, Object> billingParty = (Map<String, Object>) returnedData.get('BILLING_PARTY');
        if (!billingParty.isEmpty()) {
            //re-Simulate workaround
            String billtoDefault;
            if(this.reSimulate == false){
                //orderHeaderIn.put('ovcBillPartner', billtoDefault);
                Map<String, Object> defBilltoPayer = new Map<String, Object>();
                defBilltoPayer = orderSearchPartner.getDefaultBillandPayerPartner(spCurPartn, salesOrg, distChan, division);
                if (!defBilltoPayer.isEmpty()) {
                    billtoDefault = (String) defBilltoPayer.get('RE');
                }                
            }
            orderHeaderIn.put('ovcBillPartner', billtoDefault);
            ovcPrevPagePartners.put('BilltoBP', billtoDefault);             
            String payerPartner = (String) billingParty.get('PAYER');
            orderHeaderIn.put('ovcPayerPartner', payerPartner);
            ovcPrevPagePartners.put('Payer', payerPartner);            
            /*orderHeaderIn.put('ovcBillPartner', payerPartner);
            ovcPrevPagePartners.put('BilltoBP', payerPartner);*/
        }
        
        Map<String,Object> shParty = (Map<String,Object>) returnedData.get('SHIP_TO_PARTY');
        String shCurPartn = (String) shParty.get('SHIP_TO');
        if (((this.shipToPrevCheck != shCurPartn || spCurPartn != (String) ovcPrevPagePartners.get('SoldtoBP')) && this.reSimulate == false)) {
            Map<String, String> soldToShipToMap = new Map<String, String>();
            soldToShipToMap.put('SP', spCurPartn);
            soldToShipToMap.put('SH', shCurPartn);
            Map<String, String> partnershipInsSalesNote = getShippingInstSPSalesNote(soldToShipToMap, salesOrg, distChan, division, logger);
            String shipDefaultText = partnershipInsSalesNote.get('SH');
            String salesNote = partnershipInsSalesNote.get('SP');
            orderHeaderIn.put('ovcShipInst', shipDefaultText);
            orderHeaderIn.put('ovcSalesNote', salesNote);
            ovcPrevNotes = new Map<String, Object> {'SPPartner' => spCurPartn , 'SHPartner'=> shCurPartn, 'SPNote'=> salesNote, 'SHNote'=> shipDefaultText };
        }
        else if(this.shipToPrevCheck == shCurPartn && shCurPartn != null){
        	orderHeaderIn.put('ovcShipInst', ovcPrevNotes.get('SHNote'));
            orderHeaderIn.put('ovcSalesNote', ovcPrevNotes.get('SPNote'));   
        }
        
        ovcPrevPagePartners.put('ShiptoBP', shCurPartn);
        ovcPrevPagePartners.put('SoldtoBP', spCurPartn);
        orderHeaderIn.put('ovcPrevNotes', JSON.serialize(ovcPrevNotes)); 
        orderHeaderIn.put('ovcPrevPartners', JSON.serialize(ovcPrevPagePartners));
    }

    @TestVisible
    private ShippingPointsRT testShipPointDeparture;
    @TestVisible
    private Map<String, Map<String, Object>> getShipDepartureInfo(Map<String, Object> shipPointItem, overcast.logger logger) {
        Map<String, Map<String, Object>> itemDepartureList = new Map<String, Map<String, Object>>();
        if (shipPointItem == null) {
            return itemDepartureList;
        }

        ShippingPointsRT request = new ShippingPointsRT();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(new overcast.Predicate('VSTEL', overcast.Predicate.FilterType.IN1, shipPointItem.values()));

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        ShippingPointsRT respObj;
        if (Test.isRunningTest()) {
            respObj = testShipPointDeparture;
        } else {
            respObj = request.runQuery(q, logger, null);
        }
        List<Object> shipPointList = (List<Object>) respObj.get('TVST');

        for (Object shipPointObj : shipPointList) {
            Map<String, Object> shipPointDepartureInfo = (Map<String, Object>) shipPointObj;
            for (String itemNo : shipPointItem.keyset()) {
                if (((String) shipPointItem.get(itemNo)) == ((String) shipPointDepartureInfo.get('VSTEL'))) {
                    Map<String, Object> shipDeparture = new Map<String, Object>();
                    shipDeparture.put('DEP_COUNTRY', shipPointDepartureInfo.get('ALAND'));
                    shipDeparture.put('DEP_ZONE', shipPointDepartureInfo.get('AZONE'));
                    itemDepartureList.put(itemNo, shipDeparture);
                }
            }
        }
        return itemDepartureList;
    }

    //DatabaseAccess interface implementation
    @TestVisible
    private static IDatabaseAccess databaseAccess {
        get {
            // prettier-ignore
            return databaseAccess == null ? (databaseAccess = new DatabaseAccess()) : databaseAccess;
        }
        set {
            databaseAccess = value;
        }
    }
    @TestVisible
    private interface IDatabaseAccess {
        List<Product2> getProduct(List<String> prodCode);
    }
    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public List<Product2> getProduct(List<String> prodCode) {
            List<Product2> prod = new List<Product2>();
            if (prodCode != null) {
                prod = [SELECT ProductCode, ovcTransport_Group__c FROM Product2 WHERE ProductCode IN :prodCode WITH SECURITY_ENFORCED];
            }
            return prod;
        }
    }

    @TestVisible
    private BusinessPartnerRT testShipInstrSpNote;
    @TestVisible
    private Map<String, String> getShippingInstSPSalesNote(
        Map<String, String> shipToSoldToMap,
        String salesOrg,
        String distrChan,
        String division,
        overcast.logger logger
    ) {
        List<String> keyValues = shipToSoldToMap.values();
        Set<String> bpKeys = new Set<String>(keyValues);

        Map<String, String> spshNotes = new Map<String, String>();
        if (shipToSoldToMap.isEmpty()) {
            return spshNotes;
        }

        BusinessPartnerRT request = new BusinessPartnerRT();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(new overcast.Predicate('BusinessPartner', overcast.Predicate.FilterType.IN1, bpKeys));

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        BusinessPartnerRT respObj;
        if (Test.isRunningTest()) {
            respObj = testShipInstrSpNote;
        } else {
            respObj = request.runQuery(q, logger, null);
        }
        List<Object> customerTextList = (List<Object>) respObj.get('A_CustomerSalesAreaText');
        //System.debug('customerTextListTest' + customerTextList);

        if (!customerTextList.isEmpty()) {
            for (Object customerTextObj : customerTextList) {
                Map<String, Object> customerText = (Map<String, Object>) customerTextObj;
                String textId = (String) customerText.get('LongTextID');
                String customer = (String) customerText.get('Customer');
                if (
                    ((String) customerText.get('SalesOrganization')) == salesOrg &&
                    ((String) customerText.get('DistributionChannel')) == distrChan &&
                    ((String) customerText.get('Division')) == division &&
                    ((String) customerText.get('Language')) == 'EN'
                ) {
                    if (shipToSoldToMap.get('SH') != null) {
                        if (textId == '0002' && customer == shipToSoldToMap.get('SH').replaceFirst('^0+', '')) {
                            String shippingInstruction = (String) customerText.get('LongText');
                            spshNotes.put('SH', shippingInstruction);
                        }
                    }
                    if (shipToSoldToMap.get('SP') != null) {
                        if (textId == '0001' && customer == shipToSoldToMap.get('SP').replaceFirst('^0+', '')) {
                            String soldToSalesNote = (String) customerText.get('LongText');
                            spshNotes.put('SP', soldToSalesNote);
                        }
                    }
                }
            }
        }
        return spshNotes;
    }

    private String convertItemNumberString(Object itemNumberObj) {
        String itemNumber;
        if (itemNumberObj instanceof String) {
            itemNumber = ((String) itemNumberObj).leftPad(6, '0');
        } else if (itemNumberObj != null) {
            itemNumber = String.valueOf((Integer) itemNumberObj).leftPad(6, '0');
        }
        return itemNumber;
    }

    @TestVisible
    private class Partner {
        @TestVisible
        public CustomerMasterPartner testCustomerMasterBill;
        @TestVisible
        public Map<String, String> getDefaultBillandPayerPartner(String custNo, String salesOrg, String distrChannel, String division ) {
            Map<String, String> defaultBillPayer = new Map<String, String>();
            Set<String> partReq = new Set<String>{ 'RE', 'RG' };
            CustomerMasterPartner request = new CustomerMasterPartner();
            overcast.Predicate pred = new overcast.Predicate();
            pred.type = overcast.Predicate.FilterType.AND1;
            pred.add(new overcast.Predicate('KUNNR', overcast.Predicate.FilterType.EQUALS, custNo));
            pred.add(new overcast.Predicate('VKORG', overcast.Predicate.FilterType.EQUALS, salesOrg));
            pred.add(new overcast.Predicate('VTWEG', overcast.Predicate.FilterType.EQUALS, distrChannel));
            pred.add(new overcast.Predicate('SPART', overcast.Predicate.FilterType.EQUALS, division));
            pred.add(new overcast.Predicate('PARVW', overcast.Predicate.FilterType.IN1, partReq));

            overcast.Query q = new overcast.Query();
            q.where_x = pred;
            CustomerMasterPartner respObj;
            if (Test.isRunningTest()) {
                respObj = testCustomerMasterBill;
            } else {
                respObj = request.runQuery(q, null, null);
            }
            List<Object> custPartnerList = (List<Object>) respObj.get('KNVP');

            if (!custPartnerList.isEmpty()) {
                List<String> defpaPartn = new List<String>();
                for (Object custPartner : custPartnerList) {
                    Map<String, Object> custPartnerMap = (Map<String, Object>) custPartner;
                    String partnRole = (String) custPartnerMap.get('PARVW');
                    String partnNo = (String) custPartnerMap.get('KUNN2');
                    String defaultPartCheck = (String) custPartnerMap.get('DEFPA');
                    if (!String.isblank(defaultPartCheck) && !defpaPartn.contains(partnRole)) {
                        defaultBillPayer.put(partnRole, partnNo);
                        defpaPartn.add(partnRole);
                    } else if ((String) custPartnerMap.get('PARZA') == '000' && !defpaPartn.contains(partnRole)) {
                        defaultBillPayer.put(partnRole, partnNo);
                    }
                }
            }
            return defaultBillPayer;
        }
    }    
}