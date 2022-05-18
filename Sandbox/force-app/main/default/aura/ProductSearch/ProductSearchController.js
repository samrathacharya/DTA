({
    doInit : function(component,event,helper) {
        console.log('In init');
        var fetchAllUoMsAction = component.get("c.fetchAllUnitsOfMeasure");
        
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
        //helper.fetchAllUOMs();
    },
    
    SearchButtonClick : function(component, event, helper) {
       // showSpinner
        component.set("v.showSpinner", "true");
        var plantCode = component.get("v.PlantId");
        var pbEId = component.get("v.PricebookEntryId");
        var selectedUOM = component.get("v.selectedUOM");
        var availabilityCheck = component.get("c.checkAvailability");
        console.log('Selected UOM is ' + component.get("v.selectedUOM"));
        availabilityCheck.setParams({
            "plantCode": plantCode,
            "pbEntryId" : pbEId,
            "uom" : selectedUOM
        });
        availabilityCheck.setCallback(this, function(response) {
            
            var state = response.getState();
            if(state === "SUCCESS") {		
                var availabilityResponse = JSON.parse(response.getReturnValue());
                //showSearchResults
                component.set("v.showSearchResults", "true");
                component.set("v.availability", availabilityResponse.availability);
                component.set("v.availableQuantity", availabilityResponse.availableQuantity);
                component.set("v.productCode",  availabilityResponse.productCode );
                var avlabilityText = component.get("v.availability").replace(" ", "-");
               
                var fullPath = $A.get('$Resource.trafficlights') + '/light_images/' + avlabilityText + '.JPG';
                component.set("v.imagePath", encodeURI(fullPath));
                component.set("v.showSpinner", "false");
                
            }
            else if (state === "ERROR") {
                console.log('Problem fetching all UOMs, response state: ' + state);
            }
                else {
                    console.log('Unknown problem fetching all UOMs, response state: ' + state);
                }
        });
        
        $A.enqueueAction(availabilityCheck);
        
        
        
        // var action = component.get("c.checkAvailability");
    },
    fetchUoMs: function(component, event, helper) {
        var pbEntryId = component.get("v.PricebookEntryId");
        console.log('Price book entry id' +pbEntryId );
        var fetchUoMAction = component.get("c.fetchAvailableUoMs");
        fetchUoMAction.setParams({
            "pbEntryId": component.get("v.PricebookEntryId"),
        });
        // Configure the response handler for the action
        fetchUoMAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                console.log('All UOMs' + component.get("v.allUOMs"));
                var allUnitsMap = component.get("v.allUOMs");
                var options = [];
                var availableUnitMap = response.getReturnValue();
                //                console.log('availableUnitMap.length: ' + availableUnitMap.length);
                var idx = 0;
                var selectedFag = false;
                for (idx = 0; idx < availableUnitMap.length; idx++) {
                    var key = availableUnitMap[idx];
                    //                    console.log('value: ' + key + ' label: ' + allUnitsMap[key]);
                    if(idx === 0) {
                        selectedFag = true; 
                   		 component.set("v.selectedUOM",key);
                    }else 
                        selectedFag = false;
                    options.push({value: key, label: allUnitsMap[key], selected : selectedFag});
                    
                    console.log('Selected flag' + selectedFag + idx );
                }
                // Update the UOM picklist values in view
                //options.get[0].selected = true;
                component.set("v.availableUOMs", options);
            }
            else if (state === "ERROR") {
                console.log('Problem fetching UOMs ' + state); 
            }
                else {
                    console.log('Unknown problem fetching UOMs, response state: ' + state);
                }
        });
        
        // Send the request to create the new OLI
        $A.enqueueAction(fetchUoMAction);        
    },
    
    handleBlur : function(component, event, helper) {
        
        console.log('In onBlur');
        helper.showHideErrors(component, event, helper);
        
    },
    
    handleChange : function(component, event, helper) {
        console.log('Value changed');
    	 helper.showHideErrors(component, event, helper);      
    }
    
   
})