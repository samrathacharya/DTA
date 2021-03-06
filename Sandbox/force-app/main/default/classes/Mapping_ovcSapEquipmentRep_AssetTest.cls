/*
 * Copyright © 2019 Vigience Co., Ltd. All Rights Reserved
 */

// This code was generated by Overcast for running the outbound mappings. 2019-11-26 08:41:13Z
//
// Update this test class to correspond to your updates to Mapping_ovcSapEquipmentRep_Asset.
@istest
private class Mapping_ovcSapEquipmentRep_AssetTest {
    // Assert in code that your mapping configuration is correct
    @istest
    private static void testObjectMapping() {
        overcast.TestingUtilities.SetupTestEnvironment('OrderUserStatus');
        overcast.TestingUtilities.SetupTestEnvironment('PlantMaintenancePartnerRT');

        overcast__Run__c r = getExecution();

        overcast__IntegrationFieldMap__c mapping = new overcast__IntegrationFieldMap__c(
            overcast__Active__c = true,
            overcast__Direction__c = 'Inbound'
        );
        mapping.overcast__ApexClass__c = 'Mapping_ovcSapEquipmentRep_Asset';
        mapping.overcast__ScenarioName__c = 'ovcSapEquipmentRep';
        mapping.overcast__Target__c = 'Asset';
        mapping.overcast__TargetObjectName__c = 'Asset';
        mapping.overcast__Source__c = 'ovcSapEquipmentRep_V_EQUI__c';
        mapping.overcast__SourceObjectName__c = 'ovcSapEquipmentRep_V_EQUI__c';
        // Query your actual mapping records and add the field data here
        // mapping.overcast__Joins__c = '';
        // mapping.overcast__Map__c = '';

        // set the input record fields and assert that output record matches your mapping.
        ovcSapEquipmentRep_V_EQUI__c input = new ovcSapEquipmentRep_V_EQUI__c();

        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();

        plugin.testEquiStatus = new OrderUserStatus();
        plugin.testEquiStatus.JEST = new List<OrderUserStatusJEST>();
        List<Map<String, Object>> statusList = new List<Map<String, Object>>{ new Map<String, Object>{ 'OBJNR' => '123' } };
        plugin.testEquiStatus.set('JEST', statusList);

        Test.startTest();

        plugin.execute(r, new List<ovcSapEquipmentRep_V_EQUI__c>{ input });

        Test.stoptest();

        Asset[] output = [SELECT Id FROM Asset LIMIT 1];
        // Add your assertions about your mapping configuration here.
        system.assert(true);
    }

    @istest
    private static void testObjectMappingSuccess() {
        overcast.TestingUtilities.SetupTestEnvironment('OrderUserStatus');
        overcast.TestingUtilities.SetupTestEnvironment('PlantMaintenancePartnerRT');
        overcast__Run__c r = getExecution();

        overcast__IntegrationFieldMap__c mapping = new overcast__IntegrationFieldMap__c(
            overcast__Active__c = true,
            overcast__Direction__c = 'Inbound'
        );
        mapping.overcast__ApexClass__c = 'Mapping_ovcSapEquipmentRep_Asset';
        mapping.overcast__ScenarioName__c = 'ovcSapEquipmentRep';
        mapping.overcast__Target__c = 'Asset';
        mapping.overcast__TargetObjectName__c = 'Asset';
        mapping.overcast__Source__c = 'ovcSapEquipmentRep_V_EQUI__c';
        mapping.overcast__SourceObjectName__c = 'ovcSapEquipmentRep_V_EQUI__c';
        // Query your actual mapping records and add the field data here
        // mapping.overcast__Joins__c = '';
        // mapping.overcast__Map__c = '';

        // setup another scenario
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment('ovcSapAssetAddressRep');
        overcast__ScenarioTables__c st = new overcast__ScenarioTables__c(overcast__Scenario__c = scen.id);
        insert st;

        // setup Account records
        Account acc = new Account(name = 'test Account');
        insert acc;

        // setup Material records
        Product2 prod = new Product2(Name = 'test Mat', ProductCode = 'MAT001', Product_Code_ID__c = 'MAT001', ovcSAPMaterialNumber__c = 'MAT001');
        insert prod;

        // setup PMPartner record
        ovcSapPMPartner__c pmPartner = new ovcSapPMPartner__c(
            ovcObjectNumber__c = '1000',
            ovcAccount__c = acc.id,
            ovcPartnerFunction__c = 'WE',
            ovcCounter__c = '1'
        );
        insert pmPartner;

        // setup Parent Asset
        Asset ast = new Asset(Name = 'parent Asset', ovcSapNumber__c = '0002', accountId = acc.Id, SerialNumber = 'XYZ123');
        insert ast;

        // set the input record fields and assert that output record matches your mapping.
        ovcSapEquipmentRep_V_EQUI__c input = new ovcSapEquipmentRep_V_EQUI__c();
        input.OBJNR__c = '1000';
        input.TPLNR__c = '0001';
        input.HEQUI__c = '0002'; //parent
        input.EQUNR__c = 'EQUIP001';
        input.MATNR__c = 'MAT001';
        input.ADRNR__c = '9999';

        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();

        plugin.testEquiStatus = new OrderUserStatus();
        plugin.testEquiStatus.JEST = new List<OrderUserStatusJEST>();
        List<Map<String, Object>> statusList = new List<Map<String, Object>>{ new Map<String, Object>{ 'OBJNR' => '123' } };
        plugin.testEquiStatus.set('JEST', statusList);

        ovcSapEquipmentRep_V_EQUI__c source = new ovcSapEquipmentRep_V_EQUI__c();
        source.OBJNR__c = '1000';
        source.TPLNR__c = '0001';
        source.HEQUI__c = '0002'; //parent
        source.EQUNR__c = 'EQUIP001';
        source.MATNR__c = 'MAT001';
        source.ADRNR__c = '9999';

        Asset target = new Asset();
        target.id = getFakeId(Asset.SObjectType);

        boolean response;
        Test.startTest();

        plugin.execute(r, new List<ovcSapEquipmentRep_V_EQUI__c>{ input });
        response = plugin.beforeUpsert(source, target);
        Test.stoptest();

        system.assertEquals(true, response);
    }

    @istest
    private static void testObjectMappingSuccess2() {
        overcast.TestingUtilities.SetupTestEnvironment('OrderUserStatus');
        overcast.TestingUtilities.SetupTestEnvironment('PlantMaintenancePartnerRT');
        overcast__Run__c r = getExecution();

        overcast__IntegrationFieldMap__c mapping = new overcast__IntegrationFieldMap__c(
            overcast__Active__c = true,
            overcast__Direction__c = 'Inbound'
        );
        mapping.overcast__ApexClass__c = 'Mapping_ovcSapEquipmentRep_Asset';
        mapping.overcast__ScenarioName__c = 'ovcSapEquipmentRep';
        mapping.overcast__Target__c = 'Asset';
        mapping.overcast__TargetObjectName__c = 'Asset';
        mapping.overcast__Source__c = 'ovcSapEquipmentRep_V_EQUI__c';
        mapping.overcast__SourceObjectName__c = 'ovcSapEquipmentRep_V_EQUI__c';
        // Query your actual mapping records and add the field data here
        // mapping.overcast__Joins__c = '';
        // mapping.overcast__Map__c = '';

        // setup another scenario
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment('ovcSapAssetAddressRep');
        overcast__ScenarioTables__c st = new overcast__ScenarioTables__c(overcast__Scenario__c = scen.id);
        insert st;

        // setup Account records
        Account acc = new Account(name = 'test Account');
        insert acc;

        // setup Material records
        Product2 prod = new Product2(Name = 'test Mat', ProductCode = 'MAT001', Product_Code_ID__c = 'MAT001', ovcSAPMaterialNumber__c = 'MAT001');
        insert prod;

        // setup PMPartner record
        ovcSapPMPartner__c pmPartner = new ovcSapPMPartner__c(
            ovcObjectNumber__c = '1000',
            ovcAccount__c = acc.id,
            ovcPartnerFunction__c = 'WE',
            ovcCounter__c = '1'
        );
        insert pmPartner;

        // setup Parent Asset
        Asset ast = new Asset(Name = 'parent Asset', ovcSapNumber__c = '0002', accountId = acc.Id, SerialNumber = 'XYZ123');
        insert ast;

        // set the input record fields and assert that output record matches your mapping.
        ovcSapEquipmentRep_V_EQUI__c input = new ovcSapEquipmentRep_V_EQUI__c();
        input.OBJNR__c = '1000';
        input.TPLNR__c = '0002'; //Parent
        input.HEQUI__c = '0001'; //parent
        input.EQUNR__c = 'EQUIP001';
        input.MATNR__c = 'MAT001';
        input.ADRNR__c = '9999';

        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();

        plugin.testEquiStatus = new OrderUserStatus();
        plugin.testEquiStatus.JEST = new List<OrderUserStatusJEST>();
        List<Map<String, Object>> statusList = new List<Map<String, Object>>{ new Map<String, Object>{ 'OBJNR' => '123' } };
        plugin.testEquiStatus.set('JEST', statusList);

        ovcSapEquipmentRep_V_EQUI__c source = new ovcSapEquipmentRep_V_EQUI__c();
        source.OBJNR__c = '1000';
        source.TPLNR__c = '0002'; //parent
        source.HEQUI__c = '0001';
        source.EQUNR__c = 'EQUIP001';
        source.MATNR__c = 'MAT001';
        source.ADRNR__c = '9999';

        Asset target = new Asset();
        target.id = getFakeId(Asset.SObjectType);

        boolean response;
        Test.startTest();

        plugin.execute(r, new List<ovcSapEquipmentRep_V_EQUI__c>{ input });
        response = plugin.beforeUpsert(source, target);
        Test.stoptest();

        system.assertEquals(true, response);
    }

    @istest
    private static void testObjectMappingNoScenarioError() {
        overcast.TestingUtilities.SetupTestEnvironment('OrderUserStatus');
        overcast.TestingUtilities.SetupTestEnvironment('PlantMaintenancePartnerRT');
        overcast__Run__c r = getExecution();

        overcast__IntegrationFieldMap__c mapping = new overcast__IntegrationFieldMap__c(
            overcast__Active__c = true,
            overcast__Direction__c = 'Inbound'
        );
        mapping.overcast__ApexClass__c = 'Mapping_ovcSapEquipmentRep_Asset';
        mapping.overcast__ScenarioName__c = 'ovcSapEquipmentRep';
        mapping.overcast__Target__c = 'Asset';
        mapping.overcast__TargetObjectName__c = 'Asset';
        mapping.overcast__Source__c = 'ovcSapEquipmentRep_V_EQUI__c';
        mapping.overcast__SourceObjectName__c = 'ovcSapEquipmentRep_V_EQUI__c';
        // Query your actual mapping records and add the field data here
        // mapping.overcast__Joins__c = '';
        // mapping.overcast__Map__c = '';

        // setup Account records
        Account acc = new Account(name = 'test Account');
        insert acc;

        // setup Material records
        Product2 prod = new Product2(Name = 'test Mat', ProductCode = 'MAT001', Product_Code_ID__c = 'MAT001', ovcSAPMaterialNumber__c = 'MAT001');
        insert prod;

        // setup PMPartner record
        ovcSapPMPartner__c pmPartner = new ovcSapPMPartner__c(
            ovcObjectNumber__c = '1000',
            ovcAccount__c = acc.id,
            ovcPartnerFunction__c = 'WE',
            ovcCounter__c = '1'
        );
        insert pmPartner;

        // setup Parent Asset
        Asset ast = new Asset(Name = 'parent Asset', ovcSapNumber__c = '0002', accountId = acc.Id, SerialNumber = 'XYZ123');
        insert ast;

        // set the input record fields and assert that output record matches your mapping.
        ovcSapEquipmentRep_V_EQUI__c input = new ovcSapEquipmentRep_V_EQUI__c();
        input.OBJNR__c = '1000';
        input.TPLNR__c = '0001';
        input.HEQUI__c = '0002'; //parent
        input.EQUNR__c = 'EQUIP001';
        input.MATNR__c = 'MAT001';
        input.ADRNR__c = '9999';

        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();

        plugin.testEquiStatus = new OrderUserStatus();
        plugin.testEquiStatus.JEST = new List<OrderUserStatusJEST>();
        List<Map<String, Object>> statusList = new List<Map<String, Object>>{ new Map<String, Object>{ 'OBJNR' => '123' } };
        plugin.testEquiStatus.set('JEST', statusList);

        ovcSapEquipmentRep_V_EQUI__c source = new ovcSapEquipmentRep_V_EQUI__c();
        source.OBJNR__c = '1000';
        source.TPLNR__c = '0001';
        source.HEQUI__c = '0002'; //parent
        source.EQUNR__c = 'EQUIP001';
        source.MATNR__c = 'MAT001';
        source.ADRNR__c = '9999';

        Asset target = new Asset();

        boolean response;
        Test.startTest();

        plugin.execute(r, new List<ovcSapEquipmentRep_V_EQUI__c>{ input });

        Test.stoptest();

        overcast__Run__c resultRun = [SELECT Id, overcast__StatusCode__c FROM overcast__Run__c WHERE Id = :r.Id];
        system.assert(resultRun.overcast__StatusCode__c >= 300);
    }

    @istest
    private static void testBeforeUpsert() {
        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        ovcSapEquipmentRep_V_EQUI__c source = new ovcSapEquipmentRep_V_EQUI__c();
        Asset target = new Asset();
        boolean response = plugin.beforeUpsert(source, target);

        // Assert any transformations on the target record you perform in beforeUpsert()
        system.assertEquals(false, response);
    }

    @istest
    private static void testAfterInsert() {
        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        Asset target = new Asset(Name = 'a');

        overcast.ObjectMapping.InboundMappingIsRunning = true;
        sobject[] inserted = new List<sobject>{ target };
        Database.SaveResult[] saveResults = Database.insert(inserted, false);
        plugin.afterInsert(inserted, saveResults);

        // afterInsert allows for post-processing and may not require any assertions.
        system.assert(true);
    }

    @istest
    private static void testAfterUpdate() {
        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        Asset target = new Asset(Name = 'a');

        overcast.ObjectMapping.InboundMappingIsRunning = true;
        sobject[] updated = new List<sobject>{ target };
        Database.SaveResult[] saveResults = Database.insert(updated, false);
        plugin.afterUpdate(updated, saveResults);

        // afterUpdate allows for post-processing and may not require any assertions.
        system.assert(true);
    }

    @istest
    private static void testLogging() {
        overcast__Run__c r = getExecution();
        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();
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
        Mapping_ovcSapEquipmentRep_Asset plugin = new Mapping_ovcSapEquipmentRep_Asset();
        plugin.m_logger = new overcast.Logger(getExecution().Id);
        Asset target = new Asset();
        target.Name = 'a';
        overcast.ObjectMapping.InboundMappingIsRunning = true;
        sobject[] inserted = new List<sobject>{ target };
        Database.SaveResult failed1 = (Database.SaveResult) JSON.deserialize(
            '{"success":false,"errors":[{"message":"Inserted bad data","statusCode":"FIELD_CUSTOM_VALIDATION_EXCEPTION","fields":["Name"]}]}',
            Database.SaveResult.class
        );
        plugin.afterUpdate(inserted, new List<Database.SaveResult>{ failed1 });
        plugin.m_logger.commitToDatabase();
        list<overcast__Log__c> logs = [
            SELECT Id, overcast__Message__c
            FROM overcast__Log__c
            WHERE overcast__LogLevel__c = 'ERROR'
            ORDER BY CreatedDate ASC
        ];
        system.assert(logs.size() >= 2);

        system.assertEquals(
            '[Mapping_ovcSapEquipmentRep_Asset] Failed to save record [ID=null, Message=FIELD_CUSTOM_VALIDATION_EXCEPTION:Inserted bad data, Name=a]',
            logs[0].overcast__Message__c
        );
    }

    private static overcast__Run__c getExecution() {
        overcast__Scenario__c scen = overcast.TestingUtilities.SetupTestEnvironment('ovcSapEquipmentRep');
        scen.overcast__LogLevel__c = 'INFO';
        update scen;
        overcast__Run__c r = new overcast__Run__c(
            overcast__Scenario__c = scen.Id,
            overcast__Input__c = 'A',
            overcast__Mode__c = 'Run',
            overcast__Operation__c = 'Read'
        );
        insert r;
        return r;
    }

    static Integer snum = 1;
    private static String getFakeId(Schema.SObjectType sot) {
        String result = String.valueOf(snum++);
        return sot.getDescribe().getKeyPrefix() + '0'.repeat(12 - result.length()) + result;
    }
}