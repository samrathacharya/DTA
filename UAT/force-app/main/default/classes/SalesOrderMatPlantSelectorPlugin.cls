/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * SalesOrderMatPlantSelectorPlugin is used by the Overcast Component SalesOrderMatPlantSelector.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class SalesOrderMatPlantSelectorPlugin implements overcast.ComponentPluginV3 {
    global SalesOrderMatPlantSelectorPlugin() {
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
        return;
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> materialPlants = (List<Object>) returnedData.get('MARC');
        List<String> plantCodeList = new List<String>();
        for (Object materialPlantObj : materialPlants) {
            Map<String, Object> materialPlantMap = (Map<String, Object>) materialPlantObj;
            String selectablePlant = (String) materialPlantMap.get('WERKS');
            plantCodeList.add(selectablePlant);
        }

        if (plantCodeList.size() > 0) {
            Map<String, String> plantCodeName = new Map<String, String>();
            List<Device_Plant__c> plantNameList = databaseAccess.getPlants(plantCodeList);
            for (Device_Plant__c plantObj : plantNameList) {
                plantCodeName.put(plantObj.PlantCode__c, plantObj.Name);
            }
            for (Object materialPlant : materialPlants) {
                Map<String, Object> materialPlantMap = (Map<String, Object>) materialPlant;
                String plantCode = (String) materialPlantMap.get('WERKS');
                if (plantCodeName.containsKey(plantCode)) {
                    materialPlantMap.put('ovcPlantName', (String) plantCodeName.get(plantCode));
                }
            }
        }
    }

    //DatabaseAccess interface implementation
    @TestVisible
    private static IDatabaseAccess databaseAccess {
        get {
            // prettier-ignore
            return databaseAccess == null ? (databaseAccess = new DatabaseAccess()) : databaseAccess;
        }
        set {
            databaseAccess = value;
        }
    }
    @TestVisible
    private interface IDatabaseAccess {
        List<Device_Plant__c> getPlants(List<String> plantCode);
    }
    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public List<Device_Plant__c> getPlants(List<String> plantCode) {
            List<Device_Plant__c> plants = new List<Device_Plant__c>();
            if (plantCode != null) {
                plants = [SELECT PlantCode__c, Name FROM Device_Plant__c WHERE PlantCode__c IN :plantCode WITH SECURITY_ENFORCED];
            }
            return plants;
        }
    }
}