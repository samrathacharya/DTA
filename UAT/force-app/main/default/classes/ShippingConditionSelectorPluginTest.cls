@isTest
private class ShippingConditionSelectorPluginTest{
    @IsTest
    static void testEmptyMethod() {
        ShippingConditionSelectorPlugin plugin = new ShippingConditionSelectorPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        plugin.setLogger(null);
        System.assert(true, 'always true');
    }
    
    @IsTest
    static void testBeforeScenarioCall(){
        Map<String,Object> impParams = new Map<String,Object>{
            'ovcKeySection' => new Map<String,Object>{
                'ovcCompactKey' => '1000/10/00'
            }
        };          
        ShippingConditionSelectorPlugin plugin = new ShippingConditionSelectorPlugin();
        plugin.beforeScenarioCall(
            null,
            null,
            impParams,
            null
        );   
        
        String queryString = ((overcast.Predicate) impParams.get('ZSD_AUART_VSBED')).serialize();
        System.assertEquals(true, queryString.contains('AUART'));
        System.assertEquals(true, queryString.contains('VKORG'));
        System.assertEquals(true, queryString.contains('VTWEG'));
        
    }
    
    @IsTest
    static void testAfterScenarioCall(){
        Map<String, Object> retData = new Map<String, Object>();
        List<Object> sdDocCondList = new List<Object>();
        Map<String, Object> docShipCondMap = new Map<String, Object>();
        docShipCondMap.put('VSBED','01');
        sdDocCondList.add(docShipCondMap);
        retData.put('ZSD_AUART_VSBED', sdDocCondList);

		ShippingConditionSelectorPlugin plugin = new ShippingConditionSelectorPlugin();        
        plugin.testShipCond = new ShippingCondTextRT();
        List<Object> condTextList = new List<Object>();
        Map<String, Object> condTextMap = new Map<String, Object>{'VSBED' => '01', 'VTEXT' => 'Standard'};
        condTextList.add(condTextMap);
        plugin.testShipCond.set('TVSBT', condTextList);
        
        plugin.afterScenarioCall(
            retData,
            null,
            null
        );   
        
        System.debug('testMT2'+JSON.serializePretty(retData));
        Map<String, Object> shipTextMap = (Map<String, Object>) ((List<Object>) retData.get('ZSD_AUART_VSBED'))[0];
		String conditionText = (String) shipTextMap.get('ovcShipCondText');
        System.assertEquals('Standard', conditionText, 'Shipping Condition Text is wrong!');
    }
    
}