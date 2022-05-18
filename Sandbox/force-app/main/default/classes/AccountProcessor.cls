public class AccountProcessor extends DeviceCRMProcessor {
        
    private Account account;
    private AccountBean accountBean;
    
    private List<Account> accountList;
    private List<AccountBean> accountBeanList;
    
    private AccountProcessor() {
        this.accountBean = new AccountBean();
    }
    
    private AccountProcessor(AccountBean accountBean){
        this.accountBean = accountBean;
    }

    private void loadAccountFromDB() {
        if(!String.isEmpty(accountBean.CustomerNumber)) {
            List<Account> accounts = [SELECT Id, Name, Customer_Number__c, 
                                             Description, BillingStreet, BillingCity,
                                      		 BillingState, BillingCountry, Name_Other__c
                                      FROM Account 
                                      WHERE Customer_Number__c = :accountBean.CustomerNumber
                                      LIMIT 1];

            if(accounts.size() == 0) {
                //create new account
                account = new Account();
            } else {
                //assign for eventual updation
                account = accounts[0];
            }
        }        
    }
    
    private void loadAccountListFromDB() {
        accountList = [SELECT Id, Name, Customer_Number__c, 
                              Description, BillingStreet, BillingCity,
                              BillingState, BillingCountry, Name_Other__c
                       FROM Account];
    }
    
    private void loadIntoAccountBean() {
        loadAccountFromDB();
        accountBean.Name = account.Name;
        accountBean.CustomerNumber = account.Customer_Number__c;
        accountBean.Description = account.Description;
        accountBean.BillingStreet = account.BillingStreet;
        accountBean.BillingCity = account.BillingCity;
        accountBean.BillingState = account.BillingState;
        accountBean.BillingCountry = account.BillingCountry;
        accountBean.OtherName = account.Name_Other__c;
    }

    protected override void load(){
		loadAccountFromDB();
        account.Name = accountBean.Name;
        account.Customer_Number__c = accountBean.CustomerNumber;
        account.Description = accountBean.Description;
        account.BillingStreet = accountBean.BillingStreet;
        account.BillingCity = accountBean.BillingCity;
        account.BillingState = accountBean.BillingState;
        account.BillingCountry = accountBean.BillingCountry;
        account.Name_Other__c = accountBean.OtherName;
    }

    /*
    private void loadIntoAccountBeanList() {
    	loadAccountListFromDB();
        accountBeanList = new List<AccountBean>();
        for (Account account: accountList) {
            accountBean = new AccountBean();
            
            accountBean.Name = account.Name;
            accountBean.CustomerNumber = account.Customer_Number__c;
            accountBean.Description = account.Description;
            accountBean.BillingStreet = account.BillingStreet;
            accountBean.BillingCity = account.BillingCity;
            accountBean.BillingState = account.BillingState;
            accountBean.BillingCountry = account.BillingCountry;
            accountBean.OtherName = account.Name_Other__c;
            
            accountBeanList.add(accountBean);
        }
    }
	*/

    protected override void persist() {
        upsert account;
    }
    
    public override String getObjectIdentifier() {
        return account.Customer_Number__c;
    }
    
    public override List<Object> read() {
        /*
        if (accountBean.CustomerNumber.equals('00000000-0000-0000-0000-000000000000')) { // all
            loadIntoAccountBeanList();
        } else { // specific
		*/
        loadIntoAccountBean();
        accountBeanList = new List<AccountBean>();
        accountBeanList.add(accountBean);
        /*
    	}
		*/
        return accountBeanList;
    }
    
    public override void setObjectIdentifier(String objectIdentifier) {
    	accountBean.CustomerNumber = objectIdentifier;    
    }
    
	//Factory Method for initialization with a bean
    public static AccountProcessor initialize(DeviceCRMBean deviceCRMBean){
        return new AccountProcessor((AccountBean)deviceCRMBean);
    }

    public static AccountProcessor initialize() {
        return new AccountProcessor();
    }    
    
}