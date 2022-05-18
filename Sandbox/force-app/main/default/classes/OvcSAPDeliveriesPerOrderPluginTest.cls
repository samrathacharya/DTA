/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
@istest
public with sharing class OvcSAPDeliveriesPerOrderPluginTest {
    @istest
    private static void testPlugin() {
        OvcSAPDeliveriesPerOrderPlugin plugin = new OvcSAPDeliveriesPerOrderPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterScenarioCall(null, null, null);
        plugin.onScenarioException(null, null);
        try {
            plugin.beforeScenarioCall(null, new Map<String, Object>(), null, null);
            System.assert(false);
        } catch (Exception ex) {
            System.assert(true);
        }
        Map<String, Object> listMap = new Map<String, Object>{ 'IT_VGBEL' => (Object) new List<Object>{} };
        plugin.beforeScenarioCall(null, listMap, null, null);
        System.assertEquals('000', ((Map<String, Object>) listMap.get('IT_VGBEL')).get('REF_DOC_LOW'));
        Map<String, Object> listMap2 = new Map<String, Object>{
            'IT_VGBEL' => (Object) new List<Object>{ new Map<String, Object>{ 'REF_DOC_LOW' => 'TESTTESTTEST' } }
        };
        plugin.beforeScenarioCall(null, listMap2, null, null);
        System.assertEquals(1, ((List<Object>) listMap2.get('IT_VGBEL')).size());
        System.assertEquals('TESTTESTTEST', ((Map<String, Object>) ((List<Object>) listMap2.get('IT_VGBEL'))[0]).get('REF_DOC_LOW'));

        Map<String, Object> map3 = new Map<String, Object>{ 'IT_VGBEL' => (Object) new Map<String, Object>{} };
        plugin.beforeScenarioCall(null, map3, null, null);
        System.assertEquals('000', ((Map<String, Object>) map3.get('IT_VGBEL')).get('REF_DOC_LOW'));
        Map<String, Object> map4 = new Map<String, Object>{ 'IT_VGBEL' => (Object) new Map<String, Object>{ 'REF_DOC_LOW' => 'TESTTESTTEST' } };
        plugin.beforeScenarioCall(null, map4, null, null);
        System.assertEquals('TESTTESTTEST', ((Map<String, Object>) map4.get('IT_VGBEL')).get('REF_DOC_LOW'));
    }
}