@isTest
public class OpenOrdersControllerTest {

    @isTest
    public static void testGetOpenOrders() {
        Account acct = new Account(name = 'test account');
        insert acct;
        OpenOrdersController.getOpenOrders(acct.Id);
    }
}