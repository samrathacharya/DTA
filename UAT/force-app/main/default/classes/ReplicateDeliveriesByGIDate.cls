public with sharing class ReplicateDeliveriesByGIDate implements overcast.ScheduledCalloutHandler.DynamicCodeExecutor {
    public void run(overcast__ScheduleTask__c task, overcast.ScheduledCalloutHandler.DynamicCodeHelper helper) {
        if (String.isBlank(task.overcast__ScenarioInput__c) || String.isBlank(task.overcast__Scenario__c)) {
        	return;
        }

        // Prep the input set
        if(task.overcast__ScenarioInput__c == 'daily_STO'){
            List<deliveryDocRep_IS_DLV_DATA_CONTROL__c> datacontrolEntries = [SELECT Id, Name FROM deliveryDocRep_IS_DLV_DATA_CONTROL__c WHERE Name = :task.overcast__ScenarioInput__c LIMIT 1];
            if (datacontrolEntries.isEmpty()) {
                insert new deliveryDocRep_IS_DLV_DATA_CONTROL__c(Name = task.overcast__ScenarioInput__c, ITEM__c = 'X');
            }
            List<deliveryDocRep_IT_WADAT_IST__c> goodsIssueEntries = [SELECT Id, Name FROM deliveryDocRep_IT_WADAT_IST__c WHERE Name = :task.overcast__ScenarioInput__c LIMIT 1];
            if (goodsIssueEntries.isEmpty()) {
                goodsIssueEntries.add(new deliveryDocRep_IT_WADAT_IST__c(Name = task.overcast__ScenarioInput__c, SIGN__c = 'I', OPTION__c = 'GE'));
            }
            goodsIssueEntries[0].LOW__c = Date.today().addDays(-1);
            upsert goodsIssueEntries;
        }
        else if(task.overcast__ScenarioInput__c == 'daily_ZREP'){
            List<deliveryDocRep_IS_DLV_DATA_CONTROL__c> datacontrolEntries = [SELECT Id, Name FROM deliveryDocRep_IS_DLV_DATA_CONTROL__c WHERE Name = :task.overcast__ScenarioInput__c LIMIT 1];
            if (datacontrolEntries.isEmpty()) {
                insert new deliveryDocRep_IS_DLV_DATA_CONTROL__c(Name = task.overcast__ScenarioInput__c, ITEM__c = 'X');
            }
            List<deliveryDocRep_IT_ERDAT__c> repairOrderEntries = [SELECT Id, Name FROM deliveryDocRep_IT_ERDAT__c WHERE Name = :task.overcast__ScenarioInput__c LIMIT 1];
            if (repairOrderEntries.isEmpty()) {
                repairOrderEntries.add(new deliveryDocRep_IT_ERDAT__c(Name = task.overcast__ScenarioInput__c, SIGN__c = 'I', OPTION__c = 'GE'));
            }
            repairOrderEntries[0].CR_ON_LOW__c = Date.today().addDays(-1);
            upsert repairOrderEntries;             

        }
        // Run the scenario
        if (!Test.isRunningTest()) {
            helper.executeScenarioForThisTask();
        }
    }
}