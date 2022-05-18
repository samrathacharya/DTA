/**
 * Created by cxu on 8/02/2017.
 */
({
    doInit: function(cmp, event, helper) {
        helper.fetchAllUOMs(cmp);
    },

    removeItem : function (cmp, event, helper) {
        var appEvent = $A.get("e.c:RemoveLineItem");
        appEvent.setParams({
            "item" : cmp.get("v.item") });
        appEvent.fire();
    },
    
    setEditMode : function (cmp, event, helper) {
        cmp.set("v.editMode", true);
        helper.fetchAllUOMs(cmp);
        helper.fetchUoMs(cmp, event);
    },
    
    unsetEditMode : function (cmp, event, helper) {
        cmp.set("v.editMode", false);        
    },
    
    saveOLI : function (cmp, event, helper) {
        var action = cmp.get("c.updateOLI");
        action.setParams ({
            oli : cmp.get("v.item"),
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.editMode", false);
            } else if (state === "INCOMPLETE") {
                //Do nothing
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
        
        //fire refresh line items event
        var refreshEvent = $A.get("e.c:RefreshLineItems");
        refreshEvent.fire();
    },

})