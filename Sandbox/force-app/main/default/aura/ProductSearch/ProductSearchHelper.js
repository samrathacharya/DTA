({
    fetchAllUOMs: function(component) {
        console.log('In the helper fetchAllUOMs');
        var fetchAllUoMsAction = component.get("c.checkAvailability");
        
        fetchAllUoMsAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {		
                console.log('Returned' + response.getReturnValue()); 
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
    
    showHideErrors : function(component,event,helper) {
        if(event.getParam("cmpId").startsWith("product")) {
            component.set("v.plantError", "false");
            if(undefined === component.get("v.PricebookEntryId") 
               || null === component.get("v.PricebookEntryId") ) {
                component.set("v.pbError", "true");
                
            } else {
                component.set("v.pbError", "false");
            }
        } else {
            component.set("v.pbError", "false");
            if(undefined === component.get("v.PlantId") 
               || null === component.get("v.PlantId") ) {
                component.set("v.plantError", "true");
            }
            else {
                component.set("v.plantError", "false");
            }
        }
        //enable search button only when all the input fields are present
        component.set("v.isDisabled", !((undefined != component.get("v.PricebookEntryId") 
                                         || null != component.get("v.PricebookEntryId")) 
                                        && (undefined != component.get("v.PlantId") 
                                            || null != component.get("v.PlantId"))));
        
    }
})