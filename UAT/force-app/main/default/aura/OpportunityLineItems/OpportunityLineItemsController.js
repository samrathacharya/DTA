/**
 * Created by cxu on 8/02/2017.
 */
({
    saveLineItems : function(cmp, event, helper) {
        var items = cmp.get("v.items");
        var valid = true;
        items.forEach(function (item) {
            item.sobjectType = 'OpportunityLineItem';
            if (!helper.validateItem(item)) {
                valid = false;
            }
        });
        if (valid) {
            helper.showSpinner(cmp);

            var action = cmp.get("c.updateLineItems");
            action.setParam("lineItems", items);
            action.setParam("opportunityId", cmp.get("v.recordId"));
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var newItems = response.getReturnValue();
                    var toastEvent = $A.get("e.force:showToast");
                    if (newItems != null) {
                        cmp.set("v.items", newItems);
                        toastEvent.setParams({
                            "title": "Success",
                            "message": "Opportunity products have been updated successfully.",
                            "type": "success"
                        });
                        $A.get('e.force:refreshView').fire();
                        cmp.set("v.editMode", false);
                    } else {
                        console.log('Line items update failed. Please check developer log.');
                        toastEvent.setParams({
                            "title": "Error",
                            "message": "Opportunity products failed to update. Please contact administrator.",
                            "type": "error"
                        });
                    }
                    helper.hideSpinner(cmp);
                    toastEvent.fire();
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
        } else {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error",
                "message": "You must assign product to all items.",
                "type": "error"
            });
            toastEvent.fire();
        }
    },
    addNewItem : function(cmp, event, helper) {
        var newItem = { 
            'Quantity': 1,
            'OpportunityId': cmp.get("v.recordId")
        };
        var items = cmp.get("v.items");
        items.push(newItem);
        cmp.set("v.items", items);
    },
    removeAllItems : function (cmp, event, helper) {
        cmp.set("v.items", []);
    },
    handleItemRemoval : function (cmp, event, helper) {
//        console.log('OpportunityLineItemsController.handleItemRemoval');
    	console.log('recordId: ' + cmp.get("v.recordId"));
        var item = event.getParam("item");
        console.log('handleItemRemoval:item.Id: ' + item.Id);
        var items = cmp.get("v.items");
        //var index = items.indexOf(item);
        var index = -1;
        for (var j in items) {
        	console.log('handleItemRemoval:items[' + j + '].Id: ' + items[j].Id);
        	if (item.Id == items[j].Id) {
        		index = j;
        		break;
        	}
        }
        console.log('handleItemRemoval:index: ' + index);
        if (index > -1) {
        	var deleteConfirmation = confirm('Delete ' + items[index].Name + ' Opportunity Product?');
        	if (true == deleteConfirmation) {
        		items.splice(index, 1);

	        	//call backend function to remove oli from opportunity
	            var action = cmp.get("c.removeLineItem");
	            action.setParam("lineItem", item);
	            action.setParam("opportunityId", cmp.get("v.recordId"));
	            
	            action.setCallback(this, function(response) {
	                var state = response.getState();
	                if (state === "SUCCESS") {
	                	cmp.set("v.items", items);
	                } else {
	                    console.log('Line item deletion failed. Please check developer log.');
	                }
	            });
	            $A.enqueueAction(action);
	            
       	        //fire refresh line items event
		        var refreshEvent = $A.get("e.c:RefreshLineItems");
		        refreshEvent.fire();
	        }
        }
    },
    disableEditMode : function (cmp) {
        cmp.set("v.editMode", false);
    },
   deleteOLI: function(component, event, helper) {
        // Prevent the form from getting submitted
        event.preventDefault();
        // Get the value from the field that's in the form
        var oliName = event.target.getElementsByClassName('oli-name')[0].value;
        var oliId = event.target.getElementsByClassName('oli-id')[0].value;
        confirm('Delete the ' + oliName + ' Opportunity Product? (Id = ' + oliId + ')');
      }
})