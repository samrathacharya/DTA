/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcSAPPricingCheckSvcContractPlugin is used by the Overcast component ovcSAPPricingCheckSvcContract which
 * sets SAP Pricing to the Contract Line Items on a Service Contract record.
 */
global with sharing class OvcSAPPricingCheckSvcContractPlugin implements overcast.ComponentPluginV3 {
    @TestVisible
    private Map<String, Id> itemMap = new Map<String, Id>();
    @TestVisible
    private String recordId;
    @TestVisible
    Boolean autoApplyPrices = false;
    overcast.sapPricingAvailabilityPlugin managedPlugin;

    global OvcSAPPricingCheckSvcContractPlugin() {
        managedPlugin = new overcast.sapPricingAvailabilityPlugin();
    }

    global void afterComponentMetadataLoaded(Id recordId, overcast.ComponentDefinition.Component cmp) {
        this.recordId = recordId;
    }

    global void afterReferenceValuesLoaded(Id recordId, String componentName, Map<String, Map<String, Object>> referenceValues) {
    }

    global void afterReferenceValuesLoaded(
        Id recordId,
        String componentName,
        Map<String, Map<String, Object>> referenceValues,
        Map<String, List<Map<String, Object>>> referenceChildValues
    ) {
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        Object applyPricesSetting = settings.remove('AutoApplyPrices');
        if (applyPricesSetting != null) {
            this.autoApplyPrices = Boolean.valueOf(applyPricesSetting);
        }
        this.managedPlugin.beforeScenarioCall(recordId, referenceFieldValues, importParameters, settings);
        OvcSAPPricingCheckWorkOrderPlugin.saveItemData(referenceFieldValues, this.itemMap);
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        this.managedPlugin.afterScenarioCall(returnedData, null, settings);
        if (!this.autoApplyPrices) {
            return;
        }
        Map<Id, ContractLineItem> contractlineItemMap = new Map<Id, ContractLineItem>(
            databaseAccess.getContractLineItems(new Set<Id>(itemMap.values()))
        );
        ServiceContract svContract = databaseAccess.getServiceContract(this.recordId);
        OvcSAPPricingCheckWorkOrderPlugin.setDataInRecords(returnedData, this.itemMap, svContract, contractlineItemMap);
        if (!contractlineItemMap.isEmpty()) {
            databaseAccess.updateContractLineItem(contractlineItemMap.values());
        }
        if (svContract != null) {
            databaseAccess.updateServiceContract(svContract);
        }
    }

    global Boolean onScenarioException(Exception ex, Map<String, Object> retData) {
        if (this.autoApplyPrices) {
            ServiceContract svContract = databaseAccess.getServiceContract(this.recordId);
            if (svContract != null) {
                svContract.ovcSAP_Message__c = ex.getMessage().left(255);
                databaseAccess.updateServiceContract(svContract);
            } else {
                System.debug(ex.getMessage());
            }
        }
        return true;
    }

    //DatabaseAccess interface implementation
    @TestVisible
    private static IDatabaseAccess databaseAccess {
        get {
            return databaseAccess == null ? (databaseAccess = new DatabaseAccess()) : databaseAccess;
        }
        set {
            databaseAccess = value;
        }
    }

    @TestVisible
    private interface IDatabaseAccess {
        List<ContractLineItem> getContractLineItems(Set<Id> lineItemIds);
        void updateContractLineItem(List<ContractLineItem> contractLineItems);
        ServiceContract getServiceContract(Id svContractId);
        void updateServiceContract(ServiceContract svContract);
    }

    private without sharing class DatabaseAccess implements IDatabaseAccess {
        public List<ContractLineItem> getContractLineItems(Set<Id> lineItemIds) {
            // prettier-ignore
            return [ SELECT Id, ServiceContractId, UnitPrice, ovcSAP_Pricing_Status__c, Tax__c FROM ContractLineItem WHERE Id IN :lineItemIds WITH SECURITY_ENFORCED ];
        }

        public void updateContractLineItem(List<ContractLineItem> contractLineItems) {
            update contractLineItems;
        }

        public ServiceContract getServiceContract(Id svContractId) {
            // prettier-ignore
            List<ServiceContract> svContractList = [ SELECT Id, ovcSAP_Message__c FROM ServiceContract WHERE Id = :svContractId WITH SECURITY_ENFORCED ];
            return svContractList.isEmpty() ? null : svContractList[0];
        }

        public void updateServiceContract(ServiceContract svContract) {
            update svContract;
        }
    }
}