@IsTest
public class TestAccountProcessor {

    @isTest
    public static void testAccountProcessor() {
        String accountCustomerNumber = '0001002235';
        String accountName = 'flow';

        AccountProcessor ap = (AccountProcessor)ObjectProcessorFactory.getProcessor('Account', null);
        ap.setObjectIdentifier(accountCustomerNumber);
        System.assertNotEquals(null, ap);
        
        List<AccountBean> abList = (List<AccountBean>)ap.read();
        System.assertNotEquals(null, abList);
        System.assertEquals(null, ap.getObjectIdentifier());
        
        AccountProcessor ap2 = AccountProcessor.initialize();
        System.assertNotEquals(null, ap2);
        
        AccountBean ab = new AccountBean();
        ab.CustomerNumber = accountCustomerNumber;
        ab.Name = accountName;
        AccountProcessor ap3 = AccountProcessor.initialize(ab);
        System.assertNotEquals(null, ap3);
        
        String ret = ap3.write();
        System.assertNotEquals(null, ret);
    }
}