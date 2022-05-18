/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
@IsTest
public with sharing class ShipToPartySearchWithAddressPluginTest {
    @IsTest
    static void testEmptyMethod() {
        ShipToPartySearchWithAddressPlugin plugin = new ShipToPartySearchWithAddressPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        System.assert(true, 'always true');
    }

    @IsTest
    private static void testBeforeScenarioCall() {
        Map<String, Object> importParameters = new Map<String, Object>{
            'ovcParameters' => new Map<String, Object>{
                'ovcInitializeSearch' => 'TestInitialSearch',
                'ovcPartnerRole' => 'SP',
                'ovcSalesOrg' => '1000',
                'ovcDistChannel' => '10',
                'ovcDivision' => '00'
            }
        };
        createAccount();
        ShipToPartySearchWithAddressPlugin plugin = new ShipToPartySearchWithAddressPlugin();
        plugin.beforeScenarioCall(null, null, importParameters, null);
        String queryString = ((overcast.Predicate) importParameters.get('KNVP')).serialize();
        System.assertEquals(true, queryString.contains('VKORG'), 'Sales Org is missing');
        System.assertEquals(true, queryString.contains('VTWEG'), 'Distribution center is missing');
        System.assertEquals(true, queryString.contains('SPART'), 'Division is missing');
        System.assertEquals(true, queryString.contains('PARVW'), 'Partner Role is missing');
        System.assertEquals(true, queryString.contains('1111111111'), 'Deafult value is missing');
    }

    @IsTest
    private static void testBeforeScenarioCallNoInitial() {
        Account searchAccount = getAccount();
        Map<String, Object> importParameters = new Map<String, Object>{
            'ovcParameters' => new Map<String, Object>{
                'ovcAddressSearch' => searchAccount.Id,
                'ovcPartnerRole' => 'SP',
                'ovcSalesOrg' => '1000',
                'ovcDistChannel' => '10',
                'ovcDivision' => '00'
            }
        };

        ShipToPartySearchWithAddressPlugin plugin = new ShipToPartySearchWithAddressPlugin();
        plugin.beforeScenarioCall(null, null, importParameters, null);

        String queryString = ((overcast.Predicate) importParameters.get('KNVP')).serialize();
        System.assertEquals(true, queryString.contains('VKORG'), 'Sales Org is missing');
        System.assertEquals(true, queryString.contains('VTWEG'), 'Distribution center is missing');
        System.assertEquals(true, queryString.contains('SPART'), 'Division is missing');
        System.assertEquals(true, queryString.contains('PARVW'), 'Partner Role is missing');
        System.assertEquals(true, queryString.contains('0001025518'), 'Customer number is missing');
    }

    @IsTest
    private static void testBeforeScenarioCallNoParam() {
        Map<String, Object> importParameters = new Map<String, Object>{
            'ovcParameters' => new Map<String, Object>{
                'ovcPartnerRole' => 'SP',
                'ovcSalesOrg' => '2000',
                'ovcDistChannel' => '10',
                'ovcDivision' => '00'
            }
        };

        ShipToPartySearchWithAddressPlugin plugin = new ShipToPartySearchWithAddressPlugin();
        plugin.beforeScenarioCall(null, null, importParameters, null);

        String queryString = ((overcast.Predicate) importParameters.get('KNVP')).serialize();
        System.assertEquals(true, queryString.contains('VKORG'), 'Sales Org is missing');
        System.assertEquals(true, queryString.contains('VTWEG'), 'Distribution center is missing');
        System.assertEquals(true, queryString.contains('SPART'), 'Division is missing');
        System.assertEquals(true, queryString.contains('PARVW'), 'Partner Role is missing');
    }

    @IsTest
    private static void testAfterScenarioCall() {
        Map<String, Object> returnedData = new Map<String, Object>();
        returnedData.put(
            'KNVP',
            new List<Object>{ new Map<String, Object>{ 'KUNN2' => '0001025518' }, new Map<String, Object>{ 'KUNN2' => '0001025519' } }
        );
        createAccount();

        ShipToPartySearchWithAddressPlugin plugin = new ShipToPartySearchWithAddressPlugin();
        plugin.afterScenarioCall(returnedData, null, null);

        List<Object> partnerList = (List<Object>) returnedData.get('KNVP');
        Map<String, Object> bp1Partner = new Map<String, Object>();
        for (Object partnerObj : partnerList) {
            Map<String, Object> partnerMap = (Map<String, Object>) partnerObj;
            if ((String) partnerMap.get('ovcBPAccountName') == 'TestBP1') {
                bp1Partner.putAll(partnerMap);
            }
        }

        System.assertEquals(2, partnerList.size(), 'Expected text list size is different!');
        System.assertEquals('ALLCHURCH AVE', bp1Partner.get('ovcBillingAddress_street'), 'Street is different!');
        System.assertEquals('BENOWA', bp1Partner.get('ovcBillingAddress_city'), 'City is different!');
        System.assertEquals('QLD', bp1Partner.get('ovcBillingAddress_state'), 'State is different!');
    }

    private static Account getAccount() {
        Account accBPTest = new Account(Name = 'TestBP1', Customer_Number__c = '0001025518');
        insert accBPTest;
        return accBPTest;
    }

    private static void createAccount() {
        List<Account> accList = new List<Account>();
        Account accountTest1 = new Account(Name = 'TestInitialSearch', Customer_Number__c = '1111111111');
        Account accountTest2 = new Account(
            Name = 'TestBP1',
            Customer_Number__c = '0001025518',
            BillingCity = 'BENOWA',
            BillingCountry = 'AU',
            BillingPostalCode = 'TestPostal',
            BillingState = 'QLD',
            BillingStreet = 'ALLCHURCH AVE'
        );
        Account accountTest3 = new Account(
            Name = 'TestBP2',
            Customer_Number__c = '0001025519',
            BillingCity = 'HERSTON',
            BillingCountry = 'AU',
            BillingPostalCode = 'TestPostal2',
            BillingState = 'QLD',
            BillingStreet = 'BUTTERFIELD ST'
        );
        accList.add(accountTest1);
        accList.add(accountTest2);
        accList.add(accountTest3);
        insert accList;
    }
}