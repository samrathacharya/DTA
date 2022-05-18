/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcSAPSalesOrderSearchPlugin is used by the Overcast Component OvcSAPSalesOrderSearch.
 * It sets the filters for querying SAP based on the inputs set in the component's UI.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class OvcSAPSalesOrderSearchPlugin implements overcast.ComponentPluginV3 {
    private static final List<String> CONTAINS_FIELDS = new List<String>{ 'VBELN', 'IHREZ', 'BSTNK' }; //Sales doc., Your reference, PO number

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global OvcSAPSalesOrderSearchPlugin() {
    }

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
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
        if (importParameters == null) {
            return;
        }
        overcast.Predicate allConditions = new overcast.Predicate(null, overcast.Predicate.FilterType.AND1, '');

        Map<String, Object> dateFields = (Map<String, Object>) importParameters.get('ovcVBAK');
        Map<String, Object> otherFields = (Map<String, Object>) importParameters.get('VBAK');
        if (dateFields != null && otherFields?.remove('ovcIgnoreDateFilter') == null) {
            Object startDate = dateFields.get('ovcRangeStartDate');
            if (startDate != null) {
                allConditions.add(new overcast.Predicate('AUDAT', overcast.Predicate.FilterType.GREATER_THAN_OR_EQUAL_TO, startDate));
            }
            Object endDate = dateFields.get('ovcRangeEndDate');
            if (endDate != null) {
                allConditions.add(new overcast.Predicate('AUDAT', overcast.Predicate.FilterType.LESS_THAN_OR_EQUAL_TO, endDate));
            }
        }
        if (otherFields != null) {
            for (String field : otherFields.keySet()) {
                if (field == 'ovcDocHasBlock') {
                    overcast.Predicate blocksConditions = new overcast.Predicate(null, overcast.Predicate.FilterType.OR1, '');
                    List<String> blockedValues = new List<String>{ 'B', 'C' };
                    blocksConditions.add(new overcast.Predicate('FSSTK', overcast.Predicate.FilterType.IN1, blockedValues));
                    blocksConditions.add(new overcast.Predicate('LSSTK', overcast.Predicate.FilterType.IN1, blockedValues));
                    allConditions.add(blocksConditions);
                } else {
                    allConditions.add(
                        new overcast.Predicate(
                            field,
                            CONTAINS_FIELDS.contains(field) ? overcast.Predicate.FilterType.CONTAINS : overcast.Predicate.FilterType.EQUALS,
                            otherFields.get(field)
                        )
                    );
                }
            }
        }
        importParameters.put('VBAK', allConditions);
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> results = (List<Object>) returnedData.get('VBAK');
        if (results != null) {
            for (Object result : results) {
                Map<String, Object> salesOrd = (Map<String, Object>) result;
                //This custom field is used for displaying Customer Name
                salesOrd.put('ovcKUNNR', salesOrd.get('KUNNR'));
            }
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
}