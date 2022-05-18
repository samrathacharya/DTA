@isTest
private class OvcSAPSalesOrderSearchPluginTest {
    @isTest
    static void assertAfterComponentMetadataLoadedThrowsNoException() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        try {
            plugin.afterComponentMetadataLoaded(null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false, 'AfterComponentMetadataLoaded threw an exception when called with null');
        }
    }

    @isTest
    static void assertAfterReferenceValuesLoadedThrowsNoException() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        try {
            plugin.afterReferenceValuesLoaded(null, null, null);
            plugin.afterReferenceValuesLoaded(null, null, null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false, 'AfterReferenceValuesLoaded threw an exception when called with null');
        }
    }

    @isTest
    static void assertOnScenarioExceptionThrowsNoException() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        System.assert(plugin.onScenarioException(null, null), 'OnScenarioException returned false when called with null');
    }

    @isTest
    static void assertNullForNullImportParameters() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        Map<String, Object> importParams;
        plugin.beforeScenarioCall(null, null, importParams, null);
        System.assertEquals(null, importParams, 'importParamaters were not null');
    }

    @isTest
    static void assertDatePredicateIsSetWhenConditionsAreMet() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        Map<String, Object> importParams = new Map<String, Object>{
            'ovcVBAK' => new Map<String, Object>{
                'ovcRangeStartDate' => Datetime.now().addDays(-14).date(),
                'ovcRangeEndDate' => Datetime.now().date()
            }
        };
        plugin.beforeScenarioCall(null, null, importParams, null);
        Object conditions = importParams.get('VBAK');
        System.assertNotEquals(null, conditions, 'importParamaters did not have VBAK value');
        overcast.Predicate conds = (overcast.Predicate) conditions;
        System.assertEquals(2, conds.subFilters.size(), 'importParamaters did not have 2 date-related subfilters');
    }

    @isTest
    static void assertDocBlockPredicateIsSetWhenConditionsAreMet() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        Map<String, Object> importParams = new Map<String, Object>{ 'VBAK' => new Map<String, Object>{ 'ovcDocHasBlock' => true } };
        plugin.beforeScenarioCall(null, null, importParams, null);
        Object conditions = importParams.get('VBAK');
        System.assertNotEquals(null, conditions, 'importParamaters did not have VBAK value');
        overcast.Predicate conds = (overcast.Predicate) conditions;
        System.assertEquals(1, conds.subFilters.size(), 'main filter for doc blocks was not set correctly');
        System.assertEquals(2, conds.subFilters[0].subFilters.size(), 'subfilters for doc blocks were not set correctly');
    }

    @isTest
    static void assertFilterTypeIsSetCorrectly() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        Map<String, Object> importParams = new Map<String, Object>{ 'VBAK' => new Map<String, Object>{ 'VBELN' => '123', 'AUART' => 'ZOR' } };
        plugin.beforeScenarioCall(null, null, importParams, null);
        Object conditions = importParams.get('VBAK');
        System.assertNotEquals(null, conditions, 'importParamaters did not have VBAK value');
        overcast.Predicate conds = (overcast.Predicate) conditions;
        System.assertEquals(2, conds.subFilters.size(), 'subfilters were not set correctly');
        System.assert(
            conds.subFilters[0].type == overcast.Predicate.FilterType.CONTAINS &&
            conds.subFilters[0].columnName == 'VBELN',
            'CONTAINS filter type was not set correctly'
        );
        System.assert(
            conds.subFilters[1].type == overcast.Predicate.FilterType.EQUALS &&
            conds.subFilters[1].columnName == 'AUART',
            'EQUALS filter type was not set correctly'
        );
    }

    @isTest
    static void assertCustomFieldIsSetAfterScenarioCall() {
        OvcSAPSalesOrderSearchPlugin plugin = new OvcSAPSalesOrderSearchPlugin();
        Map<String, Object> retData = new Map<String, Object>{ 'KUNNR' => '123' };
        plugin.afterScenarioCall(new Map<String, Object>{ 'VBAK' => new List<Object>{ retData } }, null, null);
        System.assertEquals('123', retData.get('ovcKUNNR'), 'value was not set in custom field');
    }
}