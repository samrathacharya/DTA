global with sharing class EquipmentStatusCheckPlugin implements overcast.ComponentPluginV3 {
	private overcast.Logger logger;    
    @TestVisible
	private String recordId;    
    global EquipmentStatusCheckPlugin() {
        return;
    }
    global void setLogger(overcast.Logger logger) {
        this.logger = logger;
    }
    
	@TestVisible
	private overcast.ComponentDefinition.Component cmp;
  
    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        this.cmp = cmp;
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

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        this.recordId = recordId;   
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        List<Object> equiSystemStatList = (List<Object>) returnedData.get('SYSTEM_STATUS');
        Boolean dlflExist = false;
        for(Object equiStatObj : equiSystemStatList){
        	Map<String, Object> equiStatMap = (Map<String, Object>) equiStatObj;  
            String equiStat = (String) equiStatMap.get('STATUS');
            if(equiStat == 'I0076'){
            	dlflExist = true;
            }
        }
        if(dlflExist == true){
        	setData(false);    
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        return true;
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
    private interface IDatabaseAccess{
        Asset getAsset(String id);
        void updateAssetRecord(Asset record);
    }
    private without sharing class DatabaseAccess implements IDatabaseAccess{
        public Asset getAsset(String id){
        	Asset asst = new Asset();
            if(id != null){
                asst = [SELECT id, ovcAsset_Deletion_Flag__c FROM Asset WHERE Id = :id WITH SECURITY_ENFORCED];
            }
            return asst;
        }  
        public void updateAssetRecord(Asset record){
        	update record;
        }
    }
    
	private void setData(Boolean hasError) {
		//Asset Update
		Asset asst = databaseAccess.getAsset(this.recordId);
        	
		if (!hasError) {
			asst.ovcAsset_Deletion_Flag__c = true;
		} 
		databaseAccess.updateAssetRecord(asst);
	}    

}