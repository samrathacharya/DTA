/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * ShipToPartySearchWithAddressPlugin is used by the Overcast Component ShipToPartySearchWithAddress.
 * It is used to determine Ship to Party in Sales Order Poster.
 */
global with sharing class ShipToPartySearchWithAddressPlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private String ovcBPDisplay;
    @TestVisible
    private overcast.ComponentDefinition.Component cmp;
    global ShipToPartySearchWithAddressPlugin() {
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
        //System.debug('paramTEst'+JSON.serialize(param));
        if (param == null) {
            return;
        } else {
            overcast.Predicate pTop = new overcast.Predicate();
            pTop.add(new overcast.Predicate('VKORG', overcast.Predicate.FilterType.EQUALS, param.get('ovcSalesOrg')));
            pTop.add(new overcast.Predicate('VTWEG', overcast.Predicate.FilterType.EQUALS, param.get('ovcDistChannel')));
            pTop.add(new overcast.Predicate('SPART', overcast.Predicate.FilterType.EQUALS, param.get('ovcDivision')));
            pTop.add(new overcast.Predicate('PARVW', overcast.Predicate.FilterType.EQUALS, param.get('ovcPartnerRole')));             
            pTop.type = overcast.Predicate.FilterType.AND1;
            List<Map<String, Object>> accountList;  
            if (param.containsKey('ovcAddressSearch')) {
                String searchStr = (String) param.get('ovcAddressSearch');
                if (SearchStr instanceof Id) {
                    accountList = overcast.OcfLookupController.getLookupList(
                        'Account',
                        searchStr,
                        null,
                        'Customer_Number__c',
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        1,
                        null
                    );
                } else {
                    searchStr = '*' + searchStr + '*';
                    List<List<sObject>> findAccounts = [FIND :searchStr IN ALL FIELDS RETURNING Account(Id, Customer_Number__c, Name) LIMIT 30];
                    accountList = new List<Map<String, Object>>();
                    for (sObject obj : findAccounts[0]) {
                        accountList.add(
                            new Map<String, Object>{ 'Id' => obj.get('Id'), 'Key' => obj.get('Customer_Number__c'), 'Name' => obj.get('Name') }
                        );
                    }
                }
            } 
            
            else if(param.containsKey('ovcInitializeSearch')){  
                    String searchStr = (String) param.get('ovcInitializeSearch');
                    accountList = overcast.OcfLookupController.getLookupList(
                        'Account',
                        searchStr,
                        null,
                        'Customer_Number__c',
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        1,
                        null
                    );
            } 
            else {
            accountList = overcast.OcfLookupController.getLookupList(
                'Account',
                null,
                null,
                'Customer_Number__c',
                null,
                null,
                null,
                null,
                null,
                null,
                5,
                null
            );
        }            
            
            
            System.debug(accountList);
            List<String> accountNumbers = new List<String>();
            for (Map<String, Object> acc : accountList) {
                if (!String.isEmpty((String) acc.get('Key'))) {
                    accountNumbers.add((String) acc.get('Key'));
                }
            }
            if (accountNumbers.isEmpty()) {
                accountNumbers.add('X');
            }
			pTop.add(new overcast.Predicate('KUNNR', overcast.Predicate.FilterType.IN1, accountNumbers)); 
            importParameters.put('KNVP', pTop);
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> retTable = (List<Object>) returnedData.get('KNVP');
        List<String> bpNumbers = new List<String>();
        for (Object rowObj : retTable) {
            Map<String, Object> retMap = (Map<String, Object>) rowObj;
            bpNumbers.add((String) retMap.get('KUNN2'));
        }

        List<Account> accList = [
            SELECT Id, Name, Customer_Number__c, BillingAddress
            FROM Account
            WHERE Customer_Number__c IN :bpNumbers
            WITH SECURITY_ENFORCED
        ];
        Map<String, List<Account>> bpMap = new Map<String, List<Account>>();
        for (Account acc : accList) {
            if (!bpMap.containsKey(acc.Customer_Number__c)) {
                bpMap.put(acc.Customer_Number__c, new List<Account>());
            }
            bpMap.get(acc.Customer_Number__c).add(acc);
        }
        List<Object> removeList = new List<Object>();
        List<Object> newList = new List<Object>();
        for (Object rowObj : retTable) {
            Map<String, Object> retMap = (Map<String, Object>) rowObj;
            String bpNumber = (String) retMap.get('KUNN2');
            if (String.isEmpty(bpNumber)) {
                removeList.add(rowObj);
            } else {
                if (bpMap.containsKey(bpNumber)) {
                    System.debug(bpMap.get(bpNumber).size());
                    Account acc = bpMap.get(bpNumber)[0];
                    retmap.put('ovcBPAccountName', acc.Name);
                    retmap.put('ovcBPAccountNameBPCode', '(' + bpNumber + ') ' + acc.Name);
                    retmap.put('ovcAccountId', acc.Id);
                    System.Address addr = (System.Address) acc.BillingAddress;
                    if (addr != null) {
                        retMap.put('ovcBillingAddress_street', addr.street);
                        retMap.put('ovcBillingAddress_city', addr.city);
                        retMap.put('ovcBillingAddress_state', addr.state);
                        retMap.put('ovcBillingAddress_postalCode', addr.postalcode);
                        retMap.put('ovcBillingAddress_country', addr.country);
                    }
                    if (bpMap.get(bpNumber).size() > 1) {
                        for (Integer i = 1; i < bpMap.get(bpNumber).size(); i++) {
                            Map<String, Object> newrow = retMap.clone();
                            Account acc2 = bpMap.get(bpNumber)[i];
                            newrow.put('ovcBPAccountName', acc2.Name);
                            newrow.put('ovcBPAccountNameBPCode', +'(' + bpNumber + ') ' + acc.Name);
                            newrow.put('ovcAccountId', acc2.Id);
                            System.Address addr2 = (System.Address) acc2.BillingAddress;
                            if (addr2 != null) {
                                newrow.put('ovcBillingAddress_street', addr2.street);
                                newrow.put('ovcBillingAddress_city', addr2.city);
                                newrow.put('ovcBillingAddress_state', addr2.state);
                                newrow.put('ovcBillingAddress_postalCode', addr2.postalcode);
                                newrow.put('ovcBillingAddress_country', addr2.country);
                            }
                            newList.add(newrow);
                        }
                    }
                } else {
                    retmap.put('ovcAccountName', bpNumber);
                }
            }
        }
        for (Object removeRow : removeList) {
            Integer i = retTable.indexOf(removeRow);
            retTable.remove(i);
        }
        System.debug(retTable);
        System.debug(retTable.size());
        retTable.addAll(newList);
        System.debug(newList.size());
        System.debug(retTable.size());
        
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }
}