@IsTest
public class TestResponseBean {
	@isTest
    public static void testResponseBean() {
        ResponseBean rb = new ResponseBean();
        
        String id = 'some-unique-id';
        String status = 'SUCCESS';
        String message = 'Object created successfully';
        
        rb.ID = id;
        rb.status = status;
        rb.message = message;
        
        System.assertEquals(id, rb.ID);
        System.assertEquals(message, rb.message);
        System.assertEquals(status, rb.status);
    }
}