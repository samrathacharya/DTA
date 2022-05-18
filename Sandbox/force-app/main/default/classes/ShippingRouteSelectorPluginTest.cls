/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
@IsTest
public with sharing class ShippingRouteSelectorPluginTest {
    @IsTest
    static void testEmptyMethod() {
        ShippingRouteSelectorPlugin plugin = new ShippingRouteSelectorPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        System.assert(true, 'always true');
    }

    @IsTest
    private static void testBeforeScenarioCall(){
        
        Map<String,Object> importParameters = new Map<String,Object>{
            'ovcKeySection' => new Map<String,Object>{
                'ovcCompactKey' => 'AT/NSW-SYD/04/KI/EX-KI'
            }
        };

        ShippingRouteSelectorPlugin plugin = new ShippingRouteSelectorPlugin();
        plugin.beforeScenarioCall(
            null,
            null,
            importParameters,
            null
        );
        
        String queryString = ((overcast.Predicate) importParameters.get('TROLZ')).serialize();
        System.assertEquals(true, queryString.contains('ALAND'),'Departure country information is missing!');
        System.assertEquals(true, queryString.contains('TRAGR'),'Transport group information is missing!');
        System.assertEquals(true, queryString.contains('LZONE'),'Destination zone information is missing!');       
    }

    @IsTest
    private static void testAfterScenarioCall(){
        Map<String,Object> returnedData = new Map<String,Object>();
        returnedData.put('TROLZ', new List<Object>{
            new Map<String,Object>{'ROUTE' => 'AU0001'},
            new Map<String,Object>{'ROUTE' => 'AU0002'}
        }
        );

        ShippingRouteSelectorPlugin plugin = new ShippingRouteSelectorPlugin();
        plugin.testShipRouteObj = new ShippingRouteDescRT();
        List<Map<String, Object>> shipRoute = new List<Map<String, Object>>{
            new Map<String, Object>{ 'ROUTE' => 'AU0001', 'BEZEI' => 'Test Route 1'},
            new Map<String, Object>{ 'ROUTE' => 'AU0002', 'BEZEI' => 'Test Route 2'}
        };
        plugin.testShipRouteObj.set('TVROT', shipRoute);

        plugin.afterScenarioCall(
            returnedData,
            null,
            null
        );   

        List<String> shippingRouteTexts = new List<String>();
        List<Object> shipRouteList = (List<Object>) returnedData.get('TROLZ');
        for (Object shipRouteObj : shipRouteList) {
            Map<String, Object> shipRouteMap = (Map<String, Object>) shipRouteObj;
            shippingRouteTexts.add((String) shipRouteMap.get('RouteDescription'));
        }

        String RouteDescTexts = String.join( shippingRouteTexts, ',' ); 

        System.assertEquals(2, shippingRouteTexts.size(), 'Expected text list size is different!');
        System.assertEquals('Test Route 1,Test Route 2', RouteDescTexts, 'Expected text list size is different!');
    }
}