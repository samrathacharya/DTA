({
    doInit : function(component, event, helper) {
        var avlabilityText = component.get("v.availability");
        var imageColor;
        console.log('Availability text ' + avlabilityText + component.get("v.availability") );
        switch (avlabilityText) {
            case "in-Stock":
                imageColor = "green.JPG";
                break;
            case "out-of-stock":
                imageColor = "ns.JPG";
                break;
            case "low-stock":
                imageColor = "amber.JPG";
                break;
            case "back-order":
                imageColor = "red.JPG";
                break;
            
        }
		var fullPath = $A.get('$Resource.trafficlights') + '/light_images/' + imageColor;
        console.log(fullPath);
    }
})