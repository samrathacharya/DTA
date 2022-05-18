({
	doInit : function(component, event, helper) {
        console.log(component.get("v.recordId"));
        console.log(component.get("v.optyId"));
        var generateQuote = component.get("c.generateQuote");
        generateQuote.setParams({
            "optyId": component.get("v.optyId")
            
        });
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
        
        $A.enqueueAction(generateQuote);
	}
})