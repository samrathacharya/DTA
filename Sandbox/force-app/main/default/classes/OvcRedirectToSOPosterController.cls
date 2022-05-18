/*
 * Copyright © 2022 Vigience Co., Ltd. All Rights Reserved
 */
public with sharing class OvcRedirectToSOPosterController {
    @AuraEnabled(cacheable=true)
    public static String getSecureLinkParam(
        Id recordId,
        String componentName,
        String slpParamsJSON,
        String detailComponentName,
        String slpParamsDetailJSON
    ) {
        /*System.debug('recordId:'+recordId);
        System.debug('componentName:'+componentName);
        System.debug('slpParamsJSON:'+slpParamsJSON);
        System.debug('detailComponentName:'+detailComponentName);
        System.debug('slpParamsDetailJSON:'+slpParamsDetailJSON);*/
        try {
            overcast.ComponentSecurity.SecureLinkParameter slp;
            if (String.isNotBlank(componentName)) {
                slp = new overcast.ComponentSecurity.SecureLinkParameter(
                    recordId,
                    componentName,
                    String.isNotBlank(slpParamsJSON) ? (Map<String, Object>) JSON.deserializeUntyped(slpParamsJSON) : null
                );
            }
            if (slp != null && String.isNotBlank(detailComponentName)) {
                slp.addComponentScope(
                    detailComponentName,
                    String.isNotBlank(slpParamsDetailJSON) ? (Map<String, Object>) JSON.deserializeUntyped(slpParamsDetailJSON) : null
                );
            }
            return slp?.encode();
        } catch (Exception ex) {
            return null;
        }
    }
}