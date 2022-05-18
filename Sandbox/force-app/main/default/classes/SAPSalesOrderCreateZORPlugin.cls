/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * SAPSalesOrderCreateZORPlugin is used by the Overcast Component SAPSalesOrderCreateZORP.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class SAPSalesOrderCreateZORPlugin extends overcast.ComponentPluginV5 implements overcast.ComponentPluginV3, overcast.Loggable {
    private overcast.Logger logger;
    @TestVisible
    private String recordId;
    @TestVisible
    private overcast.ComponentDefinition.Component cmp;
    private Map<String, Object> refValues;
    global SAPSalesOrderCreateZORPlugin() {
        return;
    }
    global void setLogger(overcast.Logger logger) {
        this.logger = logger;
    }

    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        this.cmp = cmp;
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
        this.refValues = referenceValues;
        return;
    }

    public override void afterStoredDataLoaded(Map<String, Object> storedData, Map<String, Object> slpData) {
        System.debug('storedData');
        System.debug(JSON.serializePretty(storedData));
        System.debug('slpData');
        System.debug(JSON.serializePretty(slpData));
        Map<String, Object> slpParams = (Map<String, Object>) slpData.get('slpParams');
        //this.refValues.put('ORDER_ITEMS_IN', slpParams?.get('ORDER_ITEMS_OUT'));
        Map<String, Object> header = (Map<String, Object>) this.refValues.get('ORDER_HEADER_IN');
        header.put('DOC_TYPE', slpData.get('orderType'));
        /*for(ComponentDefinition.Section sec : this.cmp.sections){
			if(sec.parameterName == 'ORDER_HEADER_IN'){
				sec.findField('DOC_TYPE').display = false;
				System.debug('EDITED value');
				System.debug(JSON.serializePretty(sec.findField('DOC_TYPE')));
			}
		}*/
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        this.recordId = recordId;
        Map<String, Object> orderHeaderIn = (Map<String, Object>) importParameters.get('ORDER_HEADER_IN');
        String headerCurr = (String) orderHeaderIn.get('CURR_ISO');
        //ConditionsIn
        List<Object> condObject = new List<Object>();
        //List<Object> condXObject = new List<Object>();
        List<String> discountConds = new List<String>{ 'ZFRF', 'ZQMD' };
        List<String> otherConds = new List<String>{ 'ZFR0', 'ZMD$', 'ZRSF' };
        List<String> allConds = new List<String>();
        allConds.addAll(discountConds);
        allConds.addAll(otherConds);

        for (String cond : allConds) {
            String condValue = (String) orderHeaderIn.get(cond);
            String currValue = headerCurr;
            if (discountConds.contains(cond)) {
                currValue = '';
            }
            Map<String, Object> condInfo = new Map<String, Object>{
                'ITM_NUMBER' => '000000',
                'COND_TYPE' => cond,
                'COND_VALUE' => condValue,
                'CURRENCY_x' => currValue
            };
            condObject.add(condInfo);
        }
        importParameters.put('ORDER_CONDITIONS_IN', condObject);

        //Text Handling
        for (overcast.ComponentDefinition.Section section : cmp.sections) {
            if (section.structureName == 'ORDER_HEADER_IN') {
                List<Object> dtOrderObj = new List<Object>();
                for (overcast.ComponentDefinition.Field field : section.fields) {
                    if (field.InputOptions != null) {
                        if (field.InputOptions.componentAttributes.get('TextId') != null) {
                            String sTextId = (String) field.InputOptions.componentAttributes.get('TextId');
                            String textLine = (String) orderHeaderIn.get(field.name);
                            if (!String.isBlank(textLine)) {
                                if (textLine.length() < 132) {
                                    Map<String, String> textInfo = new Map<String, String>{
                                        'ITM_NUMBER' => '000000',
                                        'TEXT_ID' => sTextId,
                                        'TEXT_LINE' => textLine.substring(0, textLine.length()),
                                        'LANGU' => 'EN'
                                    };
                                    dtOrderObj.add(textInfo);
                                } else {
                                    Map<String, String> textInfo1 = new Map<String, String>{
                                        'ITM_NUMBER' => '000000',
                                        'TEXT_ID' => sTextId,
                                        'TEXT_LINE' => textLine.substring(0, 132),
                                        'LANGU' => 'EN'
                                    };
                                    dtOrderObj.add(textInfo1);

                                    Map<String, String> textInfo2 = new Map<String, String>{
                                        'ITM_NUMBER' => '000000',
                                        'TEXT_ID' => sTextId,
                                        'TEXT_LINE' => textLine.substring(132),
                                        'LANGU' => 'EN'
                                    };
                                    dtOrderObj.add(textInfo2);
                                }
                            }
                        }
                    }
                }
                importParameters.put('ORDER_TEXT', dtOrderObj);
            }
        }

        //setShippingInstructions(importParameters);
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        Map<String, Object> salesOrderInfo = (Map<String, Object>) returnedData.get('BAPI_SALESORDER_CREATEFROMDAT2');
        String salesDocNo = (String) salesOrderInfo?.get('SALESDOCUMENT');
        if (!String.isBlank(salesDocNo)) {
            List<String> blockedItemStatusList = getSalesOrderUserStatus(salesDocNo, logger);
            if (blockedItemStatusList.size() > 0) {
                String blockedItemNo = String.join(new List<String>(blockedItemStatusList), ',');
                List<Object> returnXList = (List<Object>) returnedData.get('RETURN_x');
                Map<String, Object> itemStatusWarn = new Map<String, Object>{
                    'TYPE_x' => 'W',
                    'MESSAGE' => 'Item awaiting approval ' + blockedItemNo
                };
                returnXList.add(itemStatusWarn);
            }
        }
        Map<String, Object> orderHeaderIn = (Map<String, Object>) returnedData.get('ORDER_HEADER_IN');
        String purchNo = (String) orderHeaderIn?.get('PURCH_NO_C');
        if (!String.isBlank(purchNo)) {
            setData(purchNo, false);
        }

        List<Object> returnMessageList = (List<Object>) returnedData.get('RETURN_x');
        List<String> removalMessageType = new List<String>{ 'KONVKOM', 'VBAPKOM', 'VBAKKOM' };
        if (returnMessageList != null && !returnMessageList.isEmpty()) {
            for (Integer i = returnMessageList.size() - 1; i >= 0; i--) {
                Map<String, Object> retMap = (Map<String, Object>) returnMessageList[i];
                String retMessageType = (String) retMap.get('TYPE_x');
                if (retMessageType != 'S') {
                    return;
                }
                String retMessage = (String) retMap.get('MESSAGE_V1');
                if (removalMessageType.contains(retMessage)) {
                    returnMessageList.remove(i);
                }
            }
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }

    public void onBackendMessageReceived(String backendMessage) {
    }

    @TestVisible
    private OrderUserStatus testOrderStatus;
    @TestVisible
    private List<String> getSalesOrderUserStatus(String salesDocNo, overcast.logger logger) {
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
            respObj = request.runQuery(q, logger, null);
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

    /*
    private static void setShippingInstructions(Map<String, Object> importParams) {
        System.debug('BeforeScenarioCall()');
        System.debug(JSON.serializePretty(importParams));
    }*/

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
        Case getCase(String id);
        void updateCaseRecord(Case record);
    }
    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public Case getCase(String id) {
            Case cs = new Case();
            if (id != null) {
                cs = [SELECT id, Purchase_Order_Number__c FROM Case WHERE Id = :id WITH SECURITY_ENFORCED];
            }
            return cs;
        }
        public void updateCaseRecord(Case record) {
            update record;
        }
    }

    @TestVisible
    private void setData(String purchaseOrderNo, Boolean hasError) {
        //Case Update
        Case cs = databaseAccess.getCase(this.recordId);

        if (!hasError) {
            cs.Purchase_Order_Number__c = purchaseOrderNo;
        }
        databaseAccess.updateCaseRecord(cs);
    }
}