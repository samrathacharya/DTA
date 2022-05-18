({
    doInit : function(component, event, helper) {
        // showSpinner
        component.set("v.showSpinner", "true");
        component.set("v.messages", "");
        
        var recordId = component.get("v.recordId");

        var action = component.get("c.getOpenOrders");
        action.setParams ({
            accountRecordId : recordId
        });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var stringResponse = response.getReturnValue();
                console.log(stringResponse);
                if (stringResponse.includes('There was an error retrieving Open Orders')) {
                    component.set("v.message", stringResponse);
                } else {
                    var items = JSON.parse(stringResponse);
                    if (null != items) {
                        component.set("v.items", items);
                        component.set("v.message", "");
                    }
                }
                component.set("v.showSpinner", "false");
            }
            else if (state === "INCOMPLETE") {
                // component.set("v.showSpinner", "false");
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " +
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                    component.set("v.showSpinner", "false");
                }
        });
        $A.enqueueAction(action);
	}
})