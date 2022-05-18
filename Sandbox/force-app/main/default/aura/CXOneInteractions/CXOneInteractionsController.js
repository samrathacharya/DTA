({
    // function automatic called by aura:waiting event  
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for displaying loading spinner 
        component.set("v.spinner", true); 
    },
     
    // function automatic called by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hiding loading spinner    
        component.set("v.spinner", false);
    },
    
    handleClose : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    },
    
    handleConfirm: function(component, event, helper) {
        let action = component.get("c.endInteraction");
        action.setParams({ recordId : component.get("v.recordId") });
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.statusResponse",response.getReturnValue());
                component.set("v.showStatusResponse",true);
                component.set("v.showConfirmation",false);
            }
            else {
                console.log("Failed with state: " + state);
            }
            //$A.get("e.force:closeQuickAction").fire();
        });
        $A.enqueueAction(action);
    }
})