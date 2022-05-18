/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
global with sharing class OvcSAPDeliveriesPerOrderPlugin implements overcast.ComponentPluginV2 {
    global OvcSAPDeliveriesPerOrderPlugin() {
    }

    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
    }

    global void afterReferenceValuesLoaded(Id recordId, String componentName, Map<String, Map<String, Object>> referenceValues) {
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        if (referenceFieldValues.get('IT_VGBEL') == null) {
            throw new overcast.ComponentFrameworkUtility.ComponentFrameworkException('Invalid params');
        }
        if (referenceFieldValues.get('IT_VGBEL') instanceof List<Object>) {
            List<Object> vgbelList = (List<Object>) referenceFieldValues.get('IT_VGBEL');
            if (vgbelList.isEmpty()) {
                Map<String, Object> param = new Map<String, Object>{ 'OPTION' => 'EQ', 'REF_DOC_LOW' => '000', 'SIGN' => 'I' };
                referenceFieldValues.put('IT_VGBEL', param);
            }
        } else if (referenceFieldValues.get('IT_VGBEL') instanceof Map<String, Object>) {
            Map<String, Object> vgbel = (Map<String, Object>) referenceFieldValues.get('IT_VGBEL');
            if (vgbel.get('REF_DOC_LOW') == null || String.isBlank((String) vgbel.get('REF_DOC_LOW'))) {
                Map<String, Object> param = new Map<String, Object>{ 'OPTION' => 'EQ', 'REF_DOC_LOW' => '000', 'SIGN' => 'I' };
                referenceFieldValues.put('IT_VGBEL', param);
            }
        }
    }
    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
}