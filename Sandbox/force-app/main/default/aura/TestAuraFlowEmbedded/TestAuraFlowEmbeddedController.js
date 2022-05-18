({
	init : function (component) {
        //var sURL = window.location.href;
		//var recordIdValue = sURL.split('c__recordId=')[1];
        
        var mypageRef = component.get("v.pageReference");
        //alert(mypageRef.state.c__recordId);
        var recordIdValue = mypageRef.state.c__recordId;        
        
        // Find the component whose aura:id is "flowData"
        var flow = component.find("flowData");
        // In that component, start your flow. Reference the flow's API Name.
        var inputVariables = [{ name : "Id", type : "String", value: recordIdValue }];
        flow.startFlow("TEST_Stock_Query", inputVariables);    
        //flow.startFlow("TEST_Stock_Query");      
    },
})