/*
 * Copyright © 2019 Vigience Co., Ltd. All Rights Reserved
 *
 * SAP Asset Replication Utility
 */
public with sharing class OvcAssetHelper {
    public static Map<String, Id> getPartnerMap(Set<String> objectKeys, String partnerFunc) {
        Map<String, Id> objectPartnerMap = new Map<String, Id>();

        if (String.isEmpty(partnerFunc)) {
            partnerFunc = 'WE';
        }

        if (!objectKeys.isEmpty()) {
            List<ovcSapPMPartner__c> partners = [SELECT Id, ovcObjectNumber__c, ovcAccount__c FROM ovcSapPMPartner__c WHERE ovcObjectNumber__c IN :objectKeys AND ovcPartnerFunction__c = :partnerFunc ORDER BY ovcCounter__c ASC];
            for (ovcSapPMPartner__c partner : partners) {
                //Only use the first instance
                if (!objectPartnerMap.keySet().contains(partner.ovcObjectNumber__c)) {
                    objectPartnerMap.put(partner.ovcObjectNumber__c, partner.ovcAccount__c);
                }
            }
        }

        return objectPartnerMap;
    }


    public static Map<String, Asset> getAssetMap(Set<String> sapNumbers) {
        Map<String, Asset> assetMap = new Map<String, Asset>();
        if (!sapNumbers.isEmpty()) {
            List<Asset> assets = [SELECT Id, Name, ovcSapNumber__c, ParentId, ovcGeographicLocationName__c, ovcGeographicLocationRoad__c, ovcGeographicLocationCountry__c, 
                                        ovcGeographicLocationZipcode__c, ovcGeographicLocationCity__c, ovcGeographicLocationState__c, 
                                        ovcShippedDate__c, ovcStartupDate__c, ovcWarrantyStartDate__c, ovcWarrantyEndDate__c
                                        FROM Asset WHERE ovcSapNumber__c IN :sapNumbers];
            for (Asset asset : assets) {
                assetMap.put(asset.ovcSapNumber__c, asset);
            }
        }

        return assetMap;
    }

    public class ExecuteScenarioQueue implements Queueable {
        @TestVisible
        private String scenario;
        @TestVisible
        private String inputSet;
        @TestVisible
        private overcast.EpgwWebServices.Operation operation;

        public ExecuteScenarioQueue(String scen, String input) {
            this.scenario = scen;
            this.inputSet = input;
            this.operation = overcast.EpgwWebServices.Operation.EpgwRead;
        }

        public ExecuteScenarioQueue(String scen, String input, overcast.EpgwWebServices.Operation ope) {
            this.scenario = scen;
            this.inputSet = input;
            this.operation = ope;
        }

        public void execute(QueueableContext context) {
            overcast.EpgwWebServices.EpgwWebServiceResult res = overcast.EpgwWebServices.ExecuteScenario(scenario, overcast.EpgwWebServices.Action.Populate, operation, inputSet);
            System.debug(LoggingLevel.INFO, res);
        }

    }
}