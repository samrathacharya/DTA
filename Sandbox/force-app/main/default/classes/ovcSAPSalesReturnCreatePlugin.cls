/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * ovcSAPSalesReturnCreatePlugin is used by the Overcast Component ovcSAPSalesReturnCreate
 * which is used to create an SAP Sales Return with or without a reference to an invoice.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class ovcSAPSalesReturnCreatePlugin implements overcast.ComponentPluginV3, overcast.Loggable {
    private SAPSalesOrderCreateZORPlugin pluginForZOR;

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global ovcSAPSalesReturnCreatePlugin() {
        pluginForZOR = new SAPSalesOrderCreateZORPlugin();
    }

    global void setLogger(overcast.Logger logger) {
        pluginForZOR.setLogger(logger);
    }

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        pluginForZOR.afterComponentMetadataLoaded(recordId, cmp);
    }

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global void afterReferenceValuesLoaded(Id recordId, String componentName, Map<String, Map<String, Object>> referenceValues) {
    }

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global void afterReferenceValuesLoaded(
        Id recordId,
        String componentName,
        Map<String, Map<String, Object>> referenceValues,
        Map<String, List<Map<String, Object>>> referenceChildValues
    ) {
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        pluginForZOR.beforeScenarioCall(recordId, referenceFieldValues, importParameters, settings);
        transformData(importParameters);
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        transformData(returnedData);
        pluginForZOR.afterScenarioCall(returnedData, cmp, settings);
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }

    private void transformData(Map<String, Object> data) {
        System.debug('original data');
        System.debug(JSON.serializePretty(data));
        if (data == null) {
            return;
        }
        Map<String, Object> newData = new Map<String, Object>();
        Boolean isZORdata = data.containsKey('BAPI_SALESORDER_CREATEFROMDAT2');
        if (isZORdata) {
            newData.put('BAPI_CUSTOMERRETURN_CREATE', data.remove('BAPI_SALESORDER_CREATEFROMDAT2'));
        } else {
            newData.put('BAPI_SALESORDER_CREATEFROMDAT2', data.remove('BAPI_CUSTOMERRETURN_CREATE'));
        }
        for (String key : data.keySet()) {
            newData.put(key == 'RETURN_x' ? key : isZORdata ? key.replace('ORDER', 'RETURN') : key.replace('RETURN', 'ORDER'), data.remove(key));
        }
        data.putAll(newData);
        System.debug('transformed data');
        System.debug(JSON.serializePretty(data));
    }
}