/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcSAPSalesOrderDetailsCasePlugin is used by the Overcast Component OvcSAPSalesOrderDetailsCase.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class OvcSAPSalesOrderDetailsCasePlugin implements overcast.ComponentPluginV3 {
    global OvcSAPSalesOrderDetailsCasePlugin() {
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

    @TestVisible
    private String testResponse;
    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        return;
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> headers = (List<Object>) returnedData.get('ORDER_HEADERS_OUT');
        //List<Object> conditions = (List<Object>)returnedData.get('ORDER_CONDITIONS_OUT');
        if (headers.size() != 1) {
            return;
        }

        List<Object> orderTexts = (List<Object>) returnedData.get('ORDER_TEXTLINES_OUT');

        Map<String, Object> headerOut = (Map<String, Object>) headers[0];
        List<String> headerTextIds = new List<String>{ '0002', 'V002', 'ZSPI', '0012' };

        if (!orderTexts.isEmpty()) {
            for (Object orderText : orderTexts) {
                Map<String, Object> orderTextMap = (Map<String, Object>) orderText;
                String textId = (String) orderTextMap.get('TEXT_ID');
                String appObject = (String) orderTextMap.get('APPLOBJECT');
                if (headerTextIds.contains(textId) && appObject == 'VBBK') {
                    String textLine = (String) orderTextMap.get('LINE');
                    switch on textId {
                        when 'V002' {
                            headerOut.put('SalesText', textLine);
                        }
                        when '0002' {
                            headerOut.put('HeaderNote1', textLine);
                        }
                        when 'ZSPI' {
                            headerOut.put('CarrierSpecialInstructions', textLine);
                        }
                        when '0012' {
                            headerOut.put('ShippingInstructions', textLine);
                        }
                    }
                }
            }
        }
        List<Object> orderCondOut = (List<Object>) returnedData.get('ORDER_CONDITIONS_OUT');
        List<String> condTypes = new List<String>{ 'ZQMD', 'ZMD$', 'ZFR0', 'ZFRF' };
        Map<String, Object> condData = new Map<String, Object>();
        if (!orderCondOut.isEmpty()) {
            for (Object orderCond : orderCondOut) {
                Map<String, Object> orderCondMap = (Map<String, Object>) orderCond;
                String condItemNumber = (String) orderCondMap.get('ITM_NUMBER');
                String condType = (String) orderCondMap.get('COND_TYPE');
                String condCount = (String) orderCondMap.get('COND_COUNT');
                if (condTypes.contains(condType) && condItemNumber == '000000') {
                    Decimal condValue = Math.abs((Decimal) orderCondMap.get('COND_VALUE'));
                    condData.put(condType, condValue);
                }
            }
        }

        if (!condData.isEmpty()) {
            returnedData.put('ovc_CONDITIONS', condData);
        }

        List<Object> orderPartners = (List<Object>) returnedData.get('ORDER_PARTNERS_OUT');
        String soldToParty;
        if (!orderPartners.isEmpty()) {
            for (Object orderPartner : orderPartners) {
                Map<String, Object> orderPartnerMap = (Map<String, Object>) orderPartner;
                String partnerRole = (String) orderPartnerMap.get('PARTN_ROLE');
                if (partnerRole == 'AG') {
                    soldToParty = (String) orderPartnerMap.get('CUSTOMER');
                }
            }
        }

        List<Object> orderflows = (List<Object>) returnedData.get('ORDER_FLOWS_OUT');
        List<Object> invoiceList = new List<Object>();
        if (!orderflows.isEmpty()) {
            for (Integer i = orderflows.size() - 1; i >= 0; i--) {
                Map<String, Object> orderFlowMap = (Map<String, Object>) orderflows[i];
                String docCateg = (String) orderFlowMap.get('DOCCATEGOR');
                if (docCateg == 'M') {
                    orderFlowMap.put('PARTNER_NUMBER', soldToParty);
                    invoiceList.add(orderFlowMap);
                }
                if (docCateg != 'J') {
                    orderflows.remove(i);
                }
            }
        }
        returnedData.put('ovcInvoice', invoiceList);

        String salesDocNumber = (String) headerOut.get('DOC_NUMBER');
        List<String> itemBlockedList = getSalesOrderUserStatus(salesDocNumber);
        if (itemBlockedList.size() > 0) {
            List<Object> orderItemsList = (List<Object>) returnedData.get('ORDER_ITEMS_OUT');
            for (Object orderItem : orderItemsList) {
                Map<String, Object> orderItemMap = (Map<String, Object>) orderItem;
                String itemNumber = (String) orderItemMap.get('ITM_NUMBER');
                if (itemBlockedList.contains(itemNumber)) {
                    orderItemMap.put('ovcPricingBlock', 'X');
                }
            }
        }
    }

    @TestVisible
    private OrderUserStatus testOrderStatus;
    @TestVisible
    private List<String> getSalesOrderUserStatus(String salesDocNo) {
        List<String> salesOrderItemBlockedList = new List<String>();
        if (salesDocNo == null) {
            return salesOrderItemBlockedList;
        }
        String objSearchString = 'VB' + salesDocNo;

        OrderUserStatus request = new OrderUserStatus();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(new overcast.Predicate('OBJNR', overcast.Predicate.FilterType.STARTS_WITH, objSearchString));
        //Check stat E0002
        pred.add(new overcast.Predicate('STAT_x', overcast.Predicate.FilterType.EQUALS, 'E0002'));

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        OrderUserStatus respObj;
        if (Test.isRunningTest()) {
            respObj = testOrderStatus;
        } else {
            respObj = request.runQuery(q, null, null);
        }
        List<Object> jestList = (List<Object>) respObj.get('JEST');

        for (Object userStatusObj : jestList) {
            Map<String, Object> userStatusMap = (Map<String, Object>) userStatusObj;
            String blockedObj = (String) userStatusMap.get('OBJNR');
            String blockedItem = blockedObj.substringAfter(objSearchString);
            salesOrderItemBlockedList.add(blockedItem);
        }
        return salesOrderItemBlockedList;
    }
}