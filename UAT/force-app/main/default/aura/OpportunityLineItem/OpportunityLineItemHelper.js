({
    fetchAllUOMs: function(component) {
        var fetchAllUoMsAction = component.get("c.fetchAllUnitsOfMeasure");
        fetchAllUoMsAction.setParams({
            
        });
        fetchAllUoMsAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {		
                //console.log(response.getReturnValue()); 
                component.set("v.allUOMs", response.getReturnValue());
            }
            else if (state === "ERROR") {
                console.log('Problem fetching all UOMs, response state: ' + state);
            }
                else {
                    console.log('Unknown problem fetching all UOMs, response state: ' + state);
                }
        });
        
        $A.enqueueAction(fetchAllUoMsAction);
    },

    fetchUoMs: function(component, event) {
        var pbEntryId = component.get("v.item.PricebookEntryId");
       
        var fetchUoMAction = component.get("c.fetchAvailableUoMs");
        fetchUoMAction.setParams({
            "pbEntryId": component.get("v.item.PricebookEntryId"),
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