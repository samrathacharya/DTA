({
    doInit : function(cmp, event, helper) {
        helper.getOpportunity(cmp);
        helper.getPricebooks(cmp);
    },
    backToOpportunity : function(cmp, event, helper) {
        $A.get('e.force:closeQuickAction').fire();
    },
    handleRefreshLineItems : function(cmp, event, helper) {
//        console.log("EditProductController.handleRefreshLineItems: RefreshLineItems HANDLER");
        helper.getOpportunity(cmp);
        helper.getPricebooks(cmp);
	},
    updatePricebook : function (cmp, event, helper) {
        var opportunity = cmp.get("v.opportunity");
        var pricebookId = cmp.get("v.pricebookId");
        opportunity.Pricebook2Id = pricebookId;
        opportunity.sobjectType = 'Opportunity';
        console.log(opportunity);

        var action = cmp.get("c.updateOpportunity");
        action.setParams ({
            opportunity : opportunity,
            pricebookId : pricebookId
        });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var error = response.getReturnValue();
                console.log(error);
                
                if(error.includes('cannot change pricebook on opportunity with line items')){
                    alert('Cannot change pricebook on opportunity with line items. Please remove all items on Opp before changing pricebook.');
                }

                $A.get('e.force:refreshView').fire();
                //cmp.set("v.opportunity", opportunity);
                helper.getOpportunity(cmp);
            }
            else if (state === "INCOMPLETE") {
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
                }
        });
        $A.enqueueAction(action);
    },
    disableEditMode : function (cmp) {
        cmp.set("v.editMode", false);
    },
    enableEditMode : function (cmp) {
        cmp.set("v.editMode", true);
    },

})