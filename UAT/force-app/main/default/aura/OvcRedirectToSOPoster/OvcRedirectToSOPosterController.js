({
    invoke: function (cmp, event, helper) {
        let action = cmp.get('c.getSecureLinkParam');
        let rcdId = cmp.get('v.recordId');
        let cmpName = cmp.get('v.componentName');
        let detailCmpName = cmp.get('v.detailComponentName');
        let actParams = {
            recordId: rcdId,
            componentName: cmpName,
            detailComponentName: detailCmpName
        };
        let slpParams = cmp.get('v.slpParamsJSON');
        if (slpParams) {
            actParams.slpParamsJSON = JSON.stringify(JSON.parse(slpParams));
        }
        let slpParamsDetail = cmp.get('v.slpParamsDetailJSON');
        if (slpParamsDetail) {
            actParams.slpParamsDetailJSON = JSON.stringify(JSON.parse(slpParamsDetail));
        }
        console.log('actParams');
        console.log(actParams);
        action.setParams(actParams);
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === 'SUCCESS') {
                let retVal = response.getReturnValue();
                let pageRef = {type: 'standard__component', attributes: {componentName: 'overcast__ocfSalesOrderPoster'}};
                let param = {cmpOpts: {mode: cmp.get('v.mode'), detailComponentDef: detailCmpName}, inputValues: {slp: retVal}};
                pageRef.state = {
                    overcast__cdef: cmpName,
                    overcast__rec: rcdId,
                    overcast__prm: btoa(unescape(encodeURIComponent(JSON.stringify(param))))
                };
                console.log('pageRef');
                console.log(JSON.stringify(pageRef));
                console.log('param');
                console.log(JSON.stringify(param));
                let navService = cmp.find('navService');
                //event.preventDefault();
                navService.navigate(pageRef, true);
            }
        });
        $A.enqueueAction(action);
    }
});