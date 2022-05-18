({
    doInit : function(component, event, helper) {
        
        // Prepare the action to load account record
        var action = component.get("c.getOpportunity");
        action.setParams({"opportunityId": component.get("v.recordId")});
        
        // Configure response handler
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.opportunity", response.getReturnValue());
            } else {
                console.log('Problem getting opportunity, response state: ' + state);
            }
        });
        $A.enqueueAction(action);
        
        // Fetch all UoMs at the outset
        helper.fetchAllUOMs(component);
    },
    
    updateAndSaveOLI: function(component, event, helper) {
        if(helper.validateOLIForm(component)) {
            
            //copy pbEntryId from dummy to new
//			console.log('newOLIId - ' + component.get('v.newOLI.PricebookEntryId'));
//			console.log('newDummyOLIId - ' + component.get('v.newDummyOLI.PricebookEntryId'));

            component.set('v.newOLI.PricebookEntryId', component.get('v.newDummyOLI.PricebookEntryId'));

//			console.log('set newOLIId to - ' + component.get('v.newOLI.PricebookEntryId'));
//			console.log('set UOM__c - ' + component.get('v.newOLI.UOM__c'));
            
            // Prepare the action to create the new oli
            var saveOLIAction = component.get("c.createOLI");
            saveOLIAction.setParams({
                "oli": component.get("v.newOLI"),
                "opportunityId": component.get("v.recordId")
            });
            
            // Configure the response handler for the action
            saveOLIAction.setCallback(this, function(response) {
                var state = response.getState();
                if(state === "SUCCESS") {
                    
                    // Prepare a toast UI message
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Opportunity Line Item Saved",
                        "message": "The new Opportunity Line Item (Product) was created."
                    });
                    
                    // Update the UI: close panel, show toast, refresh account page
                    $A.get("e.force:closeQuickAction").fire();
                    resultsToast.fire();
                    $A.get("e.force:refreshView").fire();
                }
                else if (state === "ERROR") {
//                    console.log('Problem saving Opportunity Line Item, response state: ' + state);
                    let errors = response.getError();
                    let errMessage = 'Unknown error'; // Default error message
                    // Retrieve the error message sent by the server
                    if (errors && Array.isArray(errors) && errors.length > 0) {
                        errMessage = errors[0].message;
                    }
                    console.log(errMessage);
                    component.set("v.errorMessageStr", errMessage);
                    setTimeout(function() { component.set("v.errorMessageStr", '') }, 8000);
                }
                else {
                   console.log('Unknown problem, response state: ' + state);
                }
            });
            
            // Send the request to create the new oli
            $A.enqueueAction(saveOLIAction);
        }
        
    },
    
    handleCancel: function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    },    
    
    fetchUoMs: function(component, event, helper) {
        var pbEntryId = component.get("v.newDummyOLI.PricebookEntryId");
        
        var fetchUoMAction = component.get("c.fetchAvailableUoMs");
        fetchUoMAction.setParams({
            "pbEntryId": component.get("v.newDummyOLI.PricebookEntryId"),
        });
        // Configure the response handler for the action
        fetchUoMAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {		
                var allUnitsMap = component.get("v.allUOMs");
                var options = [];
                var availableUnitMap = response.getReturnValue();
//                console.log('availableUnitMap.length: ' + availableUnitMap.length);
                var idx = 0;
                for (idx = 0; idx < availableUnitMap.length; idx++) {
                    var key = availableUnitMap[idx];
//                    console.log('value: ' + key + ' label: ' + allUnitsMap[key]);
                    options.push({value: key, label: allUnitsMap[key]});
                }
                // Update the UOM picklist values in view
                component.set("v.availableUOMs", options);
            }
            else if (state === "ERROR") {
                console.log('Problem fetching UOMs, response state: ' + state);
            }
            else {
                console.log('Unknown problem fetching UOMs, response state: ' + state);
            }
        });
        
        // Send the request to create the new OLI
        $A.enqueueAction(fetchUoMAction);        
    },
    
})