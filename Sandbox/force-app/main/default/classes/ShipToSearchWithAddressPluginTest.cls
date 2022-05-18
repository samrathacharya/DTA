@IsTest
public with sharing class ShipToSearchWithAddressPluginTest {
    @IsTest
    static void testEmptyMethod() {
        ShipToSearchWithAddressPlugin plugin = new ShipToSearchWithAddressPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        System.assert(true, 'always true');
    }

    @IsTest
    private static void testBeforeScenarioCall() {
        Map<String, Object> importParameters = new Map<String, Object>{
            'ovcParameters' => new Map<String, Object>{ 'ovcInitializeSearch' => 'TestInitialSearch', 'ovcAddressSearch' => 'ABC' }
        };
        createAccount();
        ShipToSearchWithAddressPlugin plugin = new ShipToSearchWithAddressPlugin();
        plugin.beforeScenarioCall(null, null, importParameters, null);

        System.assertEquals(((overcast.Predicate) importParameters.get('KNVP')).serialize(), '{"type":"IN1","operator":"IN1","columnValueObject":["1111111111"],"columnValue":"1111111111","columnName":"KUNNR"}','Wrong value!');      
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
        
        ShipToSearchWithAddressPlugin plugin = new ShipToSearchWithAddressPlugin();
        plugin.beforeScenarioCall(null, null, importParameters, null);

        System.assertEquals(((overcast.Predicate) importParameters.get('KNVP')).serialize(), '{"type":"AND1","subFilters":[{"type":"IN1","operator":"IN1","columnValueObject":["0001025518"],"columnValue":"0001025518","columnName":"KUNNR"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"SP","columnValue":"SP","columnName":"PARVW"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"1000","columnValue":"1000","columnName":"VKORG"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"10","columnValue":"10","columnName":"VTWEG"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"00","columnValue":"00","columnName":"SPART"}],"operator":"AND1"}','Wrong value!');      
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
        
        ShipToSearchWithAddressPlugin plugin = new ShipToSearchWithAddressPlugin();
        plugin.beforeScenarioCall(null, null, importParameters, null);

        System.assertEquals(((overcast.Predicate) importParameters.get('KNVP')).serialize(), '{"type":"AND1","subFilters":[{"type":"IN1","operator":"IN1","columnValueObject":["X"],"columnValue":"X","columnName":"KUNNR"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"SP","columnValue":"SP","columnName":"PARVW"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"2000","columnValue":"2000","columnName":"VKORG"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"10","columnValue":"10","columnName":"VTWEG"},{"type":"EQUALS","operator":"EQUALS","columnValueObject":"00","columnValue":"00","columnName":"SPART"}],"operator":"AND1"}','Wrong value!');      
    }

    @IsTest
    private static void testAfterScenarioCall() {
        Map<String, Object> returnedData = new Map<String, Object>();
        returnedData.put('KNVP', new List<Object>{ new Map<String, Object>{ 'KUNN2' => '0001025518' }, new Map<String, Object>{ 'KUNN2' => '0001025519' } });
        createAccount();

        ShipToSearchWithAddressPlugin plugin = new ShipToSearchWithAddressPlugin();
        plugin.afterScenarioCall(returnedData, null, null);

        List<Object> partnerList = (List<Object>) returnedData.get('KNVP');
        Map<String, Object> bp1Partner = new Map<String, Object>();
        for (Object partnerObj : partnerList) {
            Map<String, Object> partnerMap = (Map<String, Object>) partnerObj;
            if((String)partnerMap.get('ovcAccountName') == 'TestBP1'){
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

    private static void createAccount(){
        List<Account> accList = new List<Account>();
        Account accountTest1 = new Account(Name = 'TestAccountABC', Customer_Number__c = '1111111111');
        Account accountTest2 = new Account(Name = 'TestBP1', Customer_Number__c = '0001025518', BillingCity = 'BENOWA', BillingCountry = 'AU',BillingPostalCode = 'TestPostal', BillingState = 'QLD' , BillingStreet = 'ALLCHURCH AVE' );
        Account accountTest3 = new Account(Name = 'TestBP2', Customer_Number__c = '0001025519', BillingCity = 'HERSTON', BillingCountry = 'AU',BillingPostalCode = 'TestPostal2', BillingState = 'QLD' , BillingStreet = 'BUTTERFIELD ST' );
        accList.add(accountTest1);
        accList.add(accountTest2);
        accList.add(accountTest3);    
        insert accList;     
    }

}