/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcS4BPFunctionSelectorPlugin is used by the Overcast Components ovcS4PayerSelectorWorkOrder, ovcS4BillToSelectorSvcContract,
 * ovcS4BillToSelectorWorkOrder, ovcS4ShipToSelectorSvcContract, ovcS4ShipToSelectorWorkOrder and ovcS4PayerSelectorSvcContract.
 * It is used to set values to custom fields for displaying Business Partner address information after the Scenario call.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class OvcS4BPFunctionSelectorPlugin implements overcast.ComponentPluginV3 {
    @SuppressWarnings('PMD.EmptyStatementBlock')
    global OvcS4BPFunctionSelectorPlugin() {
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

    @SuppressWarnings('PMD.EmptyStatementBlock')
    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> partnerFuncList = (List<Object>) returnedData.get('A_CustSalesPartnerFunc');
        if (partnerFuncList != null) {
            for (Object partnerFunc : partnerFuncList) {
                Map<String, Object> pf = (Map<String, Object>) partnerFunc;
                String custNo = (String) pf.get('BPCustomerNumber');
                pf.put('ovcBPCustomerNumber2', custNo); // For displaying Street
                pf.put('ovcBPCustomerNumber3', custNo); // For displaying City
                pf.put('ovcBPCustomerNumber4', custNo); // For displaying State
                pf.put('ovcBPCustomerNumber5', custNo); // For displaying Postal Code
            }
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
}