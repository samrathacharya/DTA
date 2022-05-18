({
    validateOLIForm: function(component) {
        var validOLI = true;
        
        return(validOLI);
    },
    
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
    
})