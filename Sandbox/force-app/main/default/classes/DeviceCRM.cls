/*
 * Name: DeviceCRM
 *       REST API Entry Point
 * 
 * Purpose: Apex based REST service to support Device CRM API calls
 */ 
@RestResource(urlMapping='/devicecrm/*')
global with sharing class DeviceCRM {
    
    @HttpPost
    global static String doCreate() {
        RestRequest req = RestContext.request;
        String objectType = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        String ret = null;
        try {
            String requestBodyStr = req.requestBody.toString();
            DeviceCrmProcessor processor = ObjectProcessorFactory.getProcessor(objectType, requestBodyStr);
            String objectId = processor.write();
            String status = (null == objectId) ? 'ERROR' : 'SUCCESS';
            String message = objectType + ' create/update ' + status;
            ret = ResponseBuilder.buildResponse(status, message, objectId);
        } catch (DMLException e) {
			System.debug(e.getMessage());
			ret = null;            
        }
        return ret;
    }
    
    /*
    @HttpGet
    global static String doFetch() {
        RestRequest req = RestContext.request;
        List<String> requestURITokens = req.requestURI.split('/');
        String objectId = requestURITokens[requestURITokens.size() - 1];
        String objectType = requestURITokens[requestURITokens.size() - 2];
        String ret = null;
        try {
            DeviceCrmProcessor processor = ObjectProcessorFactory.getProcessor(objectType, null);
            processor.setObjectIdentifier(objectId);
            List<Object> objList = processor.read();
            ret = JSON.serialize(objList);
        } catch (DMLException e) {
			System.debug(e.getMessage());
			ret = null;            
        }
        return ret;
    }
	*/
}