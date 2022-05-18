// Update this test class to correspond to your updates to Mapping_BPAddressRep.
@istest
private class Mapping_BPAddressRepTest {
    
    // Assert in code that your mapping configuration is correct
    @istest
    private static void testObjectMapping() {
        overcast__Run__c r = getExecution();
        
        overcast__IntegrationFieldMap__c mapping = new overcast__IntegrationFieldMap__c(overcast__Active__c=true, overcast__Direction__c='Inbound');
        mapping.overcast__ApexClass__c = 'Mapping_BPAddressRep';
        mapping.overcast__ScenarioName__c = 'BusinessPartnerRep';
        mapping.overcast__Target__c = 'Account';
        mapping.overcast__TargetObjectName__c = 'Account';
        mapping.overcast__Source__c = 'BusinessPartnerRep_ABusinessPartnerAddre__c';
        mapping.overcast__SourceObjectName__c = 'BusinessPartnerRep_ABusinessPartnerAddre__c';
        // Query your actual mapping records and add the field data here
        // mapping.overcast__Joins__c = '';
        // mapping.overcast__Map__c = '';
        
        // set the input record fields and assert that output record matches your mapping.
        BusinessPartnerRep_ABusinessPartnerAddre__c input = new BusinessPartnerRep_ABusinessPartnerAddre__c();
        
        Mapping_BPAddressRep plugin = new Mapping_BPAddressRep();
        
        Test.startTest();
        
        plugin.execute(r, new List<BusinessPartnerRep_ABusinessPartnerAddre__c>{ input });
        
        Test.stoptest();
        
        List<Account> output = [SELECT Id FROM Account LIMIT 1];
        // Add your assertions about your mapping configuration here.
        system.assert(true);
    }
    
    @istest
    private static void testBeforeUpsert() {
        Mapping_BPAddressRep plugin = new Mapping_BPAddressRep();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        BusinessPartnerRep_ABusinessPartnerAddre__c source = new BusinessPartnerRep_ABusinessPartnerAddre__c();
        Account target = new Account();
        Formula.recalculateFormulas(new List<BusinessPartnerRep_ABusinessPartnerAddre__c>{ source });
        boolean response = plugin.beforeUpsert(source, target);
        
        // Assert any transformations on the target record you perform in beforeUpsert()
        system.assertEquals(true, response);
    }
    
    @istest
    private static void testAfterInsert() {
        Mapping_BPAddressRep plugin = new Mapping_BPAddressRep();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        Account target = new Account(Name='a');
        
        overcast.ObjectMapping.InboundMappingIsRunning = true;
        List<sObject> inserted = new List<sObject>{ target };
        List<Database.SaveResult> saveResults = (List<Database.SaveResult>)JSON.deserialize('[{"id":"a006F00000000xx","success":true,"errors":[]}]', List<Database.SaveResult>.class);
        plugin.afterInsert(inserted, saveResults);
        
        // afterInsert allows for post-processing and may not require any assertions.
        system.assert(true);
    }
    
    @istest
    private static void testAfterUpdate() {
        Mapping_BPAddressRep plugin = new Mapping_BPAddressRep();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        Account target = new Account(Name='a');
        
        overcast.ObjectMapping.InboundMappingIsRunning = true;
        List<sObject> updated = new List<sObject>{ target };
        List<Database.SaveResult> saveResults = (List<Database.SaveResult>)JSON.deserialize('[{"id":"a006F00000000xx","success":true,"errors":[]}]', List<Database.SaveResult>.class);
        plugin.afterUpdate(updated, saveResults);
        
        // afterUpdate allows for post-processing and may not require any assertions.
        system.assert(true);
    }
    
    @istest
    private static void testLogging() {
        overcast__Run__c r = getExecution();
        Mapping_BPAddressRep plugin = new Mapping_BPAddressRep();
        plugin.m_logger = new overcast.Logger(r.Id);
        
        plugin.logInfo('MESSAGE');
        plugin.logWarning('WARNING');
        plugin.setStatusToWarning();
        plugin.logError('ERROR');
        plugin.logDEBUG('DEBUG');
        plugin.setStatusToError();
        plugin.saveLogs();
        
        overcast__Log__c[] logs = [SELECT Id, overcast__LogLevel__c, overcast__Message__c FROM overcast__Log__c];
        system.assert(logs.size() >= 3);
        for (overcast__Log__c l : logs) {
            if (l.overcast__LogLevel__c == 'DEBUG') {
                system.assert(false, 'DEBUG message not filtered out');
            }
        }
        system.assertEquals(400, plugin.m_logger.getStatusCode());
        overcast__Run__c r2 = [SELECT overcast__StatusCode__c FROM overcast__Run__c WHERE Id = :r.Id];
        system.assertEquals(400, r2.overcast__StatusCode__c);
    }

    @istest
    private static void testFailure() {
        Mapping_BPAddressRep plugin = new Mapping_BPAddressRep();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        Account target = new Account();
        target.Name = 'a';
        overcast.ObjectMapping.InboundMappingIsRunning = true;
        List<sObject> inserted = new List<sObject>{ target };
        Database.SaveResult failed1 = (Database.SaveResult)JSON.deserialize('{"success":false,"errors":[{"message":"Running unit test.","statusCode":"MAPPING_UNIT_TEST_CHECK","fields":["Name"]}]}', Database.SaveResult.class);
        plugin.afterUpdate(inserted, new List<Database.SaveResult>{ failed1 });
        plugin.m_logger.commitToDatabase();
        list<overcast__Log__c> logs = [SELECT Id, overcast__Message__c FROM overcast__Log__c WHERE overcast__LogLevel__c = 'ERROR' ORDER BY CreatedDate ASC];
        system.assert(logs.size() >= 2);
        string expected = '[Mapping_BPAddressRep] Failed to save record [ID=null, Message=MAPPING_UNIT_TEST_CHECK:Running unit test.';
        system.assertNotEquals(null, logs[0].overcast__Message__c);
        system.assert(logs[0].overcast__Message__c.startsWith(expected));
        system.assert(logs[0].overcast__Message__c.contains('Name'));
    }

    private static overcast__Run__c getExecution() {
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment('BusinessPartnerRep');
        scen.overcast__LogLevel__c = 'INFO';
        update scen;
        overcast__Run__c r = new overcast__Run__c(overcast__Scenario__c=scen.Id, overcast__Input__c='A', overcast__Mode__c='Run', overcast__Operation__c='Read');
        insert r;
        return r;
    }
}