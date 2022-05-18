public class ResponseBuilder {

    public static String buildResponse(String status, String message, String ident) {
        String responseStr = null;
        ResponseBean responseBean = new ResponseBean();
        
        responseBean.status = (status == null || status == '') ? '' : status;
        responseBean.message = (message == null || message == '') ? '' : message;
        responseBean.ID = (ident == null || ident == '') ? '' : ident;
        
        //responseStr = JSON.serialize(responseBean);
        responseStr  = '<DeviceResponse>';
        responseStr += '<status>' + responseBean.status + '</status>';
        responseStr += '<message>' + responseBean.message + '</message>';
        responseStr += '<ID>' + responseBean.ID + '</ID>';
        responseStr += '</DeviceResponse>';
        
        return responseStr;
    }
}