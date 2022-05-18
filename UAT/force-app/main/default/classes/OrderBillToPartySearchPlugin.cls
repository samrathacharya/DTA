global with sharing class OrderBillToPartySearchPlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private String ovcBPDisplay;
    @TestVisible
    private overcast.ComponentDefinition.Component cmp;
    global OrderBillToPartySearchPlugin() {
        return;
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
        return;
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        Map<String, Object> param = (Map<String, Object>) importParameters.remove('ovcParameters');
        if (param == null) {
            return;
        } else {
            overcast.Predicate pTop = new overcast.Predicate();
            pTop.type = overcast.Predicate.FilterType.AND1;
            pTop.add(new overcast.Predicate('VKORG', overcast.Predicate.FilterType.EQUALS, param.get('ovcSalesOrg')));
            pTop.add(new overcast.Predicate('VTWEG', overcast.Predicate.FilterType.EQUALS, param.get('ovcDistChannel')));
            pTop.add(new overcast.Predicate('SPART', overcast.Predicate.FilterType.EQUALS, param.get('ovcDivision')));
            pTop.add(new overcast.Predicate('PARVW', overcast.Predicate.FilterType.EQUALS, param.get('ovcPartnerRole')));           
            if(param.containsKey('ovcSoldToParty')){
                this.ovcBPDisplay = 'KUNN2';
                pTop.add(new overcast.Predicate('KUNNR', overcast.Predicate.FilterType.EQUALS, param.get('ovcSoldToParty')));
            }
            else if(param.containsKey('ovcShipToParty')){
                pTop.add(new overcast.Predicate('KUNN2', overcast.Predicate.FilterType.EQUALS, param.get('ovcShipToParty')));
                this.ovcBPDisplay = 'KUNNR';    
            }

            importParameters.put('KNVP', pTop);
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> partnerList = (List<Object>) returnedData.get('KNVP');
        List<String> bpList = new List<String>();
        for (Object partnerObj : partnerList) {
            Map<String, Object> partnerMap = (Map<String, Object>) partnerObj;
            if (!partnerMap.isEmpty()) {
                List<String> ovcDisplayFields = new List<String>{ 'KUNN2', 'KUNNR' };
                if (ovcDisplayFields.contains(this.ovcBPDisplay)) {
                    String bpCode = (String) partnerMap.get(this.ovcBPDisplay);
                    bpList.add(bpCode);
                }
            }
        }

        Map<String, List<Account>> bpMap = new Map<String, List<Account>>();
        if (bpList.size() > 0) {
            List<Account> accList = databaseAccess.getAccounts(bpList);
            for (Account acc : accList) {
                if (!bpMap.containsKey(acc.Customer_Number__c)) {
                    bpMap.put(acc.Customer_Number__c, new List<Account>());
                }
                bpMap.get(acc.Customer_Number__c).add(acc);
            }
            for (Object partnerObj : partnerList) {
                Map<String, Object> partnerMap = (Map<String, Object>) partnerObj;
                String bpCode = (String) partnerMap.get(this.ovcBPDisplay);
                if (bpMap.containsKey(bpCode)) {
                    Account acc = bpMap.get(bpCode)[0];
                    partnerMap.put('ovcBPAccountName', acc.Name);
                    partnerMap.put('ovcBPAccountNameBPCode', '(' + bpCode + ') ' + acc.Name);
                    System.Address addr = (System.Address) acc.BillingAddress;
                    if (addr != null) {
                        partnerMap.put('ovcBillingAddress_street', addr.street);
                        partnerMap.put('ovcBillingAddress_city', addr.city);
                        partnerMap.put('ovcBillingAddress_state', addr.state);
                        partnerMap.put('ovcBillingAddress_postalCode', addr.postalcode);
                        partnerMap.put('ovcBillingAddress_country', addr.country);
                    }
                }
            }
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
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
        List<Account> getAccounts(List<String> bpNumber);
    }
    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public List<Account> getAccounts(List<String> bpNumber) {
            List<Account> accounts = new List<Account>();
            if (bpNumber != null) {
                accounts = [
                    SELECT Customer_Number__c, Name, BillingAddress
                    FROM Account
                    WHERE Customer_Number__c IN :bpNumber
                    WITH SECURITY_ENFORCED
                ];
            }
            return accounts;
        }
    }
}