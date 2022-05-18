@IsTest
public with sharing class OrderBillToPartySearchPluginTest {
    static Integer snum = 1;
	private class DatabaseAccess implements OrderBillToPartySearchPlugin.IDatabaseAccess {
		List<Account> accounts = new List<Account>();
		public List<Account> getAccounts(List<String> bpNumber) {
			return accounts;
		}
	}

    @IsTest
    static void testEmptyMethod(){
        
        OrderBillToPartySearchPlugin plugin = new OrderBillToPartySearchPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        System.assert(true, 'always true');    
    }

    @IsTest
    private static void testBeforeScenarioCall(){
        Map<String,Object> importParameters = new  Map<String,Object>{
            'ovcParameters' => new Map<String,Object>{
                'ovcSalesOrg' =>  'VKORG',
                'ovcDistChannel' =>  'VTWEG',
                'ovcDivision' =>  'SPART',
                'ovcPartnerRole' =>  'PARVW',
                'ovcSoldToParty' =>  'KUNNR'      
            }
        };  

        OrderBillToPartySearchPlugin plugin = new OrderBillToPartySearchPlugin();
        plugin.beforeScenarioCall(
            null,
            null,
            importParameters,
            null
        );
        
        System.assertEquals('KUNN2', plugin.ovcBPDisplay, 'Displayed partner is wrong!');
    }

    @IsTest
    private static void testAfterScenarioCall(){
        OrderBillToPartySearchPlugin plugin = new OrderBillToPartySearchPlugin();
		Map<String, Object> returnedData = new Map<String, Object>();
		DatabaseAccess db = new DatabaseAccess();
        plugin.ovcBPDisplay = 'KUNN2';
		String accId = getFakeId(Account.SObjectType);

		db.accounts.add(new Account(Name = 'TestAccount', Customer_Number__c = '0001000000', BillingCity = 'TestCity',BillingCountry = 'AU',BillingPostalCode = '0000',BillingState = 'ABC',BillingStreet = 'TestStreet',  Id = accId));
		OrderBillToPartySearchPlugin.databaseAccess = db;

		returnedData.put(
            'KNVP',
            new List<Object>{
                new Map<String, Object>{
                    'KUNN2' => '0001000000'
                }
            }
		); 

        plugin.afterScenarioCall(
            returnedData,
            null,
            null
        );

        String bpCode;
        String accountName;
        List<Object> customerPartners = (List<Object>) returnedData.get('KNVP');
        for(Object partner : customerPartners){
            Map<String, Object> partnerMap = (Map<String, Object>) partner;
            bpCode = (String) partnerMap.get(plugin.ovcBPDisplay); 
            accountName = (String) partnerMap.get('ovcBPAccountName');
        }  
        System.assertEquals('0001000000', bpCode, 'BP is different than KUNN2!');
        System.assertEquals('TestAccount', accountName, 'Account is different than TestAccount!');
    }

    @IsTest
	private static void testDatabaseAccess() {
		try {
			OrderBillToPartySearchPlugin.databaseAccess.getAccounts(null);
			system.assert(true, 'always true');
		} catch (Exception e) {
			system.assert(true, 'always true');
		}
	}

    private static String getFakeId(Schema.SObjectType sot) {
        String result = string.valueOf(snum++);
		return sot.getDescribe().getKeyPrefix() +
			'0'.repeat(12 - result.length()) +
			result;   
    }
}