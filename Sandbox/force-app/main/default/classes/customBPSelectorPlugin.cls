global with sharing class customBPSelectorPlugin implements overcast.ComponentPlugin {

    global void beforeScenarioCall(Id recordId, Map<String, Object> referenceFieldValues, Map<String, Object> importParameters, Map<String, Object> settings) {
        
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> pfs = (List<Object>)returnedData.get('A_CustSalesPartnerFunc');
        if (pfs == null || pfs.isEmpty()) {
            return;
        }
        
        for (Object pf : pfs) {
            Map<String, Object> partnerFunc = (Map<String, Object>)pf;
            partnerFunc.put('BPCustomerNumber2', partnerFunc.get('BPCustomerNumber'));
            partnerFunc.put('BPCustomerNumber3', partnerFunc.get('BPCustomerNumber'));
            partnerFunc.put('BPCustomerNumber4', partnerFunc.get('BPCustomerNumber'));
            partnerFunc.put('BPCustomerNumber5', partnerFunc.get('BPCustomerNumber'));
        }
    }
}