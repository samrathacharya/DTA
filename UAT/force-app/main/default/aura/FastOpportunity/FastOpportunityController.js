/**
 * Created by cxu on 7/02/2017.
 */
({
    doInit : function(cmp, event, helper) {
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
    onPricebookChange : function (cmp, event, helper) {
        var pricebookId = cmp.find("pricebookId").get("v.value");
        console.log(pricebookId);
        cmp.set("v.pricebookId", pricebookId);
    },
    disableEditMode : function (cmp) {
        cmp.set("v.editMode", false);
    },
    enableEditMode : function (cmp) {
        cmp.set("v.editMode", true);
    },
    openWizard1: function(component, event, helper) {
        component.set("v.isEditPage", false);
        component.set("v.isAddPage", true);
        component.set("v.isWizardOpen", true);
    }, 
    openWizard2: function(component, event, helper) {
        component.set("v.isEditPage", true);
        component.set("v.isAddPage", false);
        component.set("v.isWizardOpen", true);
    },
    checkAndUpdateAvailability: function(component, event, helper) {
        component.set("v.showOLI", true);
        console.log("checkAndUpdateAvailability");  
        var lineItems = component.get("v.opportunity.OpportunityLineItems");
        var opportunityId = component.get("v.opportunity.Id");
        console.log(opportunityId);
        var action = component.get("c.updateAvailability");
        action.setParams ({
            lineItems : lineItems,
            opportunityId : opportunityId
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            window.location.reload();
        });
        $A.enqueueAction(action);
        
    },
    closeWizard: function(component, event, helper) {
        component.set("v.isWizardOpen", false);
    },
    openChoosePricebook: function(component, event, helper){
        component.set("v.isPricebookWindowOpen", true);
    },
    closeChoosePricebook: function(component, event, helper){
        component.set("v.isPricebookWindowOpen", false);
    },
    generateQuote : function(component, event, helper) {
        console.log('In generate quote function');
        component.set("v.showSpinner", "true");
        var action = component.get("c.generateQuoteWS");
        var optyId = component.get("v.opportunity.Id");
        console.log('Opty id ' +  optyId);
        action.setParams ({
            optyId : optyId
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            var message  = response.getReturnValue();
            var toastMessage;
            var toastType;
            if(state == "SUCCESS") {
                component.set("v.showSpinner", "false");
                console.log('Success');
                if(response.getReturnValue() != null) {
                    if(message.includes('The record is locked for approval')) {
                        toastMessage = 'Quote cannot be generated.The record is locked for approval';
                        toastType = 'Error';
                    } else if (message.includes('The quote was rejected by the approver')){
                         toastMessage = 'Quote cannot be generated.The quote was rejected by the approver';
                        toastType = 'Error';
                    } else if (message.includes('The quote was recalled and needs to be resubmitted for approval, cannot generate a quote')){
                         toastMessage = 'Quote cannot be generated. The quote was recalled and needs to be resubmitted for approval';
                        toastType = 'Error';
                    } else{
                        toastMessage =  "Quotes generated successfully. Attachment Name : " + response.getReturnValue();
                        toastType = 'Success';
                    }
                	//var message = "Quotes generated successfully. Attachment Name : " + response.getReturnValue();
                   
                } else {
                     toastMessage = 'There was an error in quote generation. Please try after some time';
                        toastType = 'error';
                }
                //generateQuote
                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "mode" : "sticky",
                    "title" : toastType,
                    "type" : toastType,
                    "message": toastMessage,
                     
                });
        
                toastEvent.fire();
                //window.location.reload();
            } else{
                 console.log('Error');
                 component.set("v.showSpinner", "false");
               
            }
            
        });
        $A.enqueueAction(action);
    }
    
})