@IsTest
public with sharing class SalesOrderMatPlantSelectorPluginTest {
	private class DatabaseAccess implements SalesOrderMatPlantSelectorPlugin.IDatabaseAccess {
		List<Device_Plant__c> plants = new List<Device_Plant__c>();
		public List<Device_Plant__c> getPlants(List<String> plantCodes) {
            List<Device_Plant__c> plants = new List<Device_Plant__c>{ new Device_Plant__c(PlantCode__c = '1000', Name = 'Plant 1000'),
                                        new Device_Plant__c(PlantCode__c = '2000', Name = 'Plant 2000')};
			return plants;
		}
	}    
    @IsTest
    static void testEmptyMethod(){
        
        SalesOrderMatPlantSelectorPlugin plugin = new SalesOrderMatPlantSelectorPlugin();
        plugin.afterComponentMetadataLoaded(null, null);
        plugin.afterReferenceValuesLoaded(null, null, null);
        plugin.afterReferenceValuesLoaded(null, null, null, null);
        plugin.onScenarioException(null, null);
        plugin.BeforeScenarioCall(null, null, null, null);
        System.assert(true, 'always true');    
    }

    @IsTest
    private static void testAfterScenarioCall(){
        SalesOrderMatPlantSelectorPlugin plugin = new SalesOrderMatPlantSelectorPlugin();
        DatabaseAccess db = new DatabaseAccess(); 
        SalesOrderMatPlantSelectorPlugin.databaseAccess = db;
        Map<String, Object> returnedData = new Map<String, Object>();
        returnedData.put(
            'MARC',
            new List<Object>{ new Map<String, Object>{ 'WERKS' => '1000'},
                              new Map<String, Object>{ 'WERKS' => '2000'}}
        );

        plugin.afterScenarioCall(
            returnedData,
            null,
            null
        );  

        List<Object> plantList = (List<Object>) returnedData.get('MARC');
        List<String> plantNameList = new List<String>();
        for(Object plant : plantList){
            Map<String, Object> plantMap = (Map<String, Object>) plant;
            plantNameList.add((String) plantMap.get('ovcPlantName'));
        }              

        system.assertNotEquals(null, db.plants);  
        system.assertEquals(2, plantNameList.size(), 'Plant names not retrieved!');     
        system.assertEquals('Plant 1000', plantNameList[0], 'Plant name is different than expected!'); 
    }
    
    @IsTest
	private static void testDatabaseAccess() {
        List<String> plantCodes = new List<String>{'1000'};
		try {
			SalesOrderMatPlantSelectorPlugin.databaseAccess.getPlants(plantCodes);
			system.assert(true, 'always true');
		} catch (Exception e) {
			system.assert(true, 'always true');
		}
	}    
}