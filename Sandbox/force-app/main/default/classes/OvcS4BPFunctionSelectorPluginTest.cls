@isTest
private class OvcS4BPFunctionSelectorPluginTest {
    @isTest
    static void assertAfterComponentMetadataLoadedThrowsNoException() {
        OvcS4BPFunctionSelectorPlugin plugin = new OvcS4BPFunctionSelectorPlugin();
        try {
            plugin.afterComponentMetadataLoaded(null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false, 'AfterComponentMetadataLoaded threw an exception when called with null');
        }
    }

    @isTest
    static void assertAfterReferenceValuesLoadedThrowsNoException() {
        OvcS4BPFunctionSelectorPlugin plugin = new OvcS4BPFunctionSelectorPlugin();
        try {
            plugin.afterReferenceValuesLoaded(null, null, null);
            plugin.afterReferenceValuesLoaded(null, null, null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false, 'AfterReferenceValuesLoaded threw an exception when called with null');
        }
    }

    @isTest
    static void assertBeforeScenarioCallThrowsNoException() {
        OvcS4BPFunctionSelectorPlugin plugin = new OvcS4BPFunctionSelectorPlugin();
        try {
            plugin.beforeScenarioCall(null, null, null, null);
            System.assert(true);
        } catch (Exception ex) {
            System.assert(false, 'BeforeScenarioCall threw an exception when called with null');
        }
    }

    @isTest
    static void assertOnScenarioExceptionThrowsNoException() {
        OvcS4BPFunctionSelectorPlugin plugin = new OvcS4BPFunctionSelectorPlugin();
        try {
            System.assert(plugin.onScenarioException(null, null));
        } catch (Exception ex) {
            System.assert(false, 'OnScenarioException threw an exception when called with null');
        }
    }

    @isTest
    static void assertCustomFieldsAreSetAfterScenarioCall() {
        OvcS4BPFunctionSelectorPlugin plugin = new OvcS4BPFunctionSelectorPlugin();
        Map<String, Object> retData = new Map<String, Object>{ 'BPCustomerNumber' => '123' };
        plugin.afterScenarioCall(new Map<String, Object>{ 'A_CustSalesPartnerFunc' => new List<Object>{ retData } }, null, null);
        for (String custFld : new List<String>{ 'ovcBPCustomerNumber2', 'ovcBPCustomerNumber3', 'ovcBPCustomerNumber4', 'ovcBPCustomerNumber5' }) {
            System.assertEquals('123', retData.get(custFld), custFld + ' has not been set');
        }
    }
}