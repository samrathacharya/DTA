/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * sapSalesOrderDetailForRetPlugin is used by the Overcast Component OvcSAPSalesOrderDetailsCase.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class sapSalesOrderDetailForRetPlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private String recordId;    
    global sapSalesOrderDetailForRetPlugin() {
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
        this.recordId = recordId;
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
        System.debug('importParameters'+JSON.serialize(importParameters));
        return;
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        System.debug('returnedDataTEst'+JSON.serialize(returnedData));
        List<Object> headers = (List<Object>) returnedData.get('ORDER_HEADERS_OUT');
        Map<String, Object> headerOut = (Map<String, Object>) headers[0];
        String salesDocNumber = (String) headerOut.get('DOC_NUMBER');
        
        Map<String, Object> importMap = new Map<String, Object>();
        Map<String, Object> invMap = new Map<String, Object>{
            'PARTNER_NUMBER' => '0001002026',
            'PARTNER_ROLE' => 'AG',
            'BILLINGDOC' => '0092479215'
        };                 
        importMap.put('BAPI_WEBINVOICE_GETDETAIL', new List<Object>{ invMap });        

        Map<String, Object> retData = new Map<String, Object>();
        returnedData = overcast.ComponentFrameworkController.callScenarioFromApex(
                this.recordId,
                'dtaInvDetForRetOrds',
                JSON.serialize(importMap)
        );
        System.debug('retDataTest'+JSON.serialize(returnedData));
        System.assertEquals(true,false);
    }
}