/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * ShippingRouteSelectorPlugin is used by the Overcast Component ShippingRouteSelector.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class ShippingRouteSelectorPlugin implements overcast.ComponentPluginV3 {
    private static final List<String> QUERY_FIELDS = new List<String>{ 'ALAND', 'AZONE', 'TRAGR', 'LLAND', 'LZONE' };
    global ShippingRouteSelectorPlugin() {
        return;
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
            for (Integer i = 0; i < keys.size(); i++) {
                String key = keys[i];
                if (key != 'null') {
                    pTop.add(new overcast.Predicate(QUERY_FIELDS[i], overcast.Predicate.FilterType.EQUALS, key));
                }
            }
            importParameters.put('TROLZ', pTop);
        }
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        list<Object> shipRouteList = (list<Object>) returnedData.get('TROLZ');
        Set<String> routeKeySet = new Set<String>();
        for (Object shipRouteObj : shipRouteList) {
            Map<String, Object> shipRoute = (Map<String, Object>) shipRouteObj;
            routeKeySet.add((String) shipRoute.get('ROUTE'));
        }
        if (routeKeySet != null) {
            Map<String, String> ShipRouteDesc = getRouteText(routeKeySet);
            for (Object shipRouteObj : shipRouteList) {
                Map<String, Object> shipRoute = (Map<String, Object>) shipRouteObj;
                String routeType = (String) shipRoute.get('ROUTE');
                String routeText = (String) ShipRouteDesc.get(routeType);
                shipRoute.put('RouteDescription', routeText);
            }
        }
    }

    @TestVisible
    private ShippingRouteDescRT testShipRouteObj;
    @TestVisible
    private Map<String, String> getRouteText(Set<String> RouteKeys) {
        Map<String, String> shipRouteText = new Map<String, String>();
        if (RouteKeys == null) {
            return shipRouteText;
        }

        ShippingRouteDescRT request = new ShippingRouteDescRT();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(new overcast.Predicate('ROUTE', overcast.Predicate.FilterType.IN1, RouteKeys));
        pred.add(new overcast.Predicate('SPRAS', overcast.Predicate.FilterType.EQUALS, 'E'));

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        ShippingRouteDescRT respObj;
        if (Test.isRunningTest()) {
            respObj = testShipRouteObj;
        } else {
            respObj = request.runQuery(q, null, null);
        }
        List<Object> routeList = (List<Object>) respObj.get('TVROT');

        for (Object routeObj : routeList) {
            Map<String, Object> route = (Map<String, Object>) routeObj;
            String routeKey = (String) route.get('ROUTE');
            String routeText = (String) route.get('BEZEI');
            shipRouteText.put(routeKey, routeText);
        }
        return shipRouteText;
    }
}