/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
@RestResource(urlMapping='/OvcSAPConfirmationOutReceiver/*')
global class OvcSAPConfirmationOutReceiver {
    private final static string SCENARIO_NAME = 'ServiceContractReq';
    private final static string RESPONSE_BODY = '<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsrm="http://schemas.xmlsoap.org/ws/2005/02/rm" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"><S:Header><wsa:To></wsa:To><wsa:RelatesTo></wsa:RelatesTo><wsa:Action>http://schemas.xmlsoap.org/ws/2005/02/rm/CreateSequenceResponse</wsa:Action></S:Header><S:Body><wsrm:CreateSequenceResponse><wsrm:Identifier></wsrm:Identifier></wsrm:CreateSequenceResponse></S:Body></S:Envelope>';

    global class OvcSAPConfirmationOutReceiverException extends Exception {
    }

    @HttpPost
    global static void receive() {
        overcast.Logger logger = new overcast.Logger(SCENARIO_NAME);
        logger.setEndtime(DateTime.now());
        logger.setInputsetName('ServiceContractConfirmation_Out : ' + overcast.Utilities.NewGuid());

        try {
            RestRequest req = RestContext.request;
            RestContext.response.statusCode = 200;
            logger.addLog('DEBUG', 'Request Body');
            logger.addLog('DEBUG', req.requestBody.toString());
            logger.setStatusCode(200);
        } catch (Exception ex) {
            RestContext.response.statusCode = 500;
            logger.addLog('ERROR', ex.getMessage());
            logger.setStatusCode(300);
        }
        RestContext.response.responsebody = Blob.valueOf(RESPONSE_BODY);
        RestContext.response.addHeader('Content-Type', 'text/xml');
        RestContext.response.addHeader('Accept', 'text/xml');
        logger.commitToDatabase();
    }
}