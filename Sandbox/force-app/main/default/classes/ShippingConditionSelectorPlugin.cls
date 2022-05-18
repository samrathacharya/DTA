/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * ShippingRouteSelectorPlugin is used by the Overcast Component ShippingRouteSelector in Sales Order Poster.
 */
global with sharing class ShippingConditionSelectorPlugin implements overcast.ComponentPluginV3,overcast.Loggable {
    private overcast.Logger logger;
    global ShippingConditionSelectorPlugin() {
    }
    
	global void setLogger(overcast.Logger logger) {
		this.logger = logger;
	}
    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        return;
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

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        Map<String, Object> keysMap = (Map<String, Object>) importParameters.remove('ovcKeySection');
        String compactKey = (String) keysMap?.get('ovcCompactKey');
        if (String.isBlank(compactKey)) {
            return;
        } else {
            List<String> keys = compactKey.split('/');
            overcast.Predicate pTop = new overcast.Predicate();
            pTop.type = overcast.Predicate.FilterType.AND1;
            pTop.add(new overcast.Predicate('AUART', overcast.Predicate.FilterType.EQUALS, keys[0]));
            pTop.add(new overcast.Predicate('VKORG', overcast.Predicate.FilterType.EQUALS, keys[1]));
            pTop.add(new overcast.Predicate('VTWEG', overcast.Predicate.FilterType.EQUALS, keys[2]));        
            importParameters.put('ZSD_AUART_VSBED', pTop);
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        list<Object> DocShipCondList = (list<Object>) returnedData.get('ZSD_AUART_VSBED');
        Set<String> CondKeySet = new Set<String>();
        for (Object docShipObj : DocShipCondList) {
            Map<String, Object> docShipMap = (Map<String, Object>) docShipObj;
            CondKeySet.add((String) docShipMap.get('VSBED'));
        }
        if (CondKeySet != null && !CondKeySet.isEmpty()) {
            Map<String, String> ShipCondText = getCondText(CondKeySet, logger);
            for (Object docShipObj : DocShipCondList) {
                Map<String, Object> docShipMap = (Map<String, Object>) docShipObj;
                String condType = (String) docShipMap.get('VSBED');
                String condText = (String) ShipCondText.get(condType);
                docShipMap.put('ovcShipCondText', condText);
            }
        }
    }

    @TestVisible
    private ShippingCondTextRT testShipCond;
    @TestVisible
    private Map<String, String> getCondText(Set<String> CondKeys, overcast.logger logger) {
        Map<String, String> shipCondText = new Map<String, String>();
        if (CondKeys == null) {
            return shipCondText;
        }

        ShippingCondTextRT request = new ShippingCondTextRT();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(new overcast.Predicate('VSBED', overcast.Predicate.FilterType.IN1, CondKeys));
        pred.add(new overcast.Predicate('SPRAS', overcast.Predicate.FilterType.EQUALS, 'E'));

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        ShippingCondTextRT respObj;
        //Overcast.Logger loggerX = new Overcast.Logger('ShippingCondTextRT');
        if (Test.isRunningTest()) {
            respObj = testShipCond;
        } else {
            respObj = request.runQuery(q, logger, null);
        }
        List<Object> condList = (List<Object>) respObj.get('TVSBT');

        for (Object condObj : condList) {
            Map<String, Object> condMap = (Map<String, Object>) condObj;
            String condKey = (String) condMap.get('VSBED');
            String condText = (String) condMap.get('VTEXT');
            shipCondText.put(condKey, condText);
        }
        return shipCondText;
    }
}