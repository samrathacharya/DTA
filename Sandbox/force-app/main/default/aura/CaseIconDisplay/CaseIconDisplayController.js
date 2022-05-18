({
    doInit : function(cmp, event, helper) {
        var workspaceAPI = cmp.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            //var focusedTabId = response.tabId;
            var focusedTabId = cmp.get("v.tabId");
            var action = cmp.get("c.getIcon");
            //action.setParams({ caseId: response.recordId});
            action.setParams({ caseId: cmp.get("v.recordId")});
            action.setCallback(this,$A.getCallback(function(response1)
               {
                var state = response1.getState();
                if (state == "SUCCESS")  
                {
                 var result= response1.getReturnValue();
                 var finalString=result.split("-");                                                      
                 workspaceAPI.setTabIcon({tabId: focusedTabId, icon: "utility:"+ finalString[0], iconAlt: finalString[1]});   
                }
             }
           ));
            $A.enqueueAction(action);       
            
        })
        
    }
})