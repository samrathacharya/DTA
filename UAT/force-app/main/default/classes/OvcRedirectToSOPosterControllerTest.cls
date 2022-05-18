/*
 * Copyright © 2020 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
public class OvcRedirectToSOPosterControllerTest {
    static Integer snum = 1;
    @isTest
    static void getSecureLinkParamTest(){
        OvcRedirectToSOPosterController postController = new OvcRedirectToSOPosterController();
        String posterJSON = '{"ORDER_HEADER_IN":{"DOC_TYPE":"ZOR"}}';
        String detailJSON = '{"ORDER_HEADER_IN":{"DOC_TYPE":"ZQT"}}';
        String encodedString = OvcRedirectToSOPosterController.getSecureLinkParam(getFakeId(Case.SObjectType),'SAPSalesOrderCreateZOR',posterJSON,'sapSalesOrderDetailsQuote',detailJSON);  
        System.assertNotEquals('', encodedString, 'Encoded String is blank!');
    }
    
    private static String getFakeId(Schema.SObjectType sot) {
	String result = String.valueOf(snum++);
	return sot.getDescribe().getKeyPrefix() +
		'0'.repeat(12 - result.length()) +
		result;
	}
}