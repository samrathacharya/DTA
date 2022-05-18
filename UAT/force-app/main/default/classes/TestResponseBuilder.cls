@IsTest
public class TestResponseBuilder {
	@IsTest
    static void test_buildResponse() {
        String status = 'status';
        String message = 'message';
        String ident = 'ident';
        
        String response = ResponseBuilder.buildResponse(status, message, ident);
        System.assertNotEquals(null, response);
        System.assert(response.contains(status));
        System.assert(response.contains(message));
        System.assert(response.contains(ident));
        System.assert(response.contains('DeviceResponse'));
    }
}