public class Product2Processor extends DeviceCRMProcessor {
        
    private Product2 product2;
    private Product2Bean product2Bean;
    
    private List<Product2> product2List;
    private List<Product2Bean> product2BeanList;
    
    private Product2Processor() {
        this.product2Bean = new Product2Bean();
    }
    
    private Product2Processor(Product2Bean product2Bean){
        this.product2Bean = product2Bean;
    }

    private void loadProduct2FromDB() {
        if(!String.isEmpty(product2Bean.Name)) {
            List<Product2> product2s = [SELECT Id, Name, Family, 
                                               Description, AvailableUOMs__c,
                                      	  	   Product_Hierarchy_3__c, Division__c, IsActive
                                        FROM Product2 
                                        WHERE Name = :product2Bean.Name
                                        LIMIT 1];

            if(product2s.size() == 0) {
                //create new product2
                product2 = new Product2();
            } else {
                //assign for eventual updation
                product2 = product2s[0];
            }
        }        
    }
    
    private void loadProduct2ListFromDB() {
        product2List = [SELECT Id, Name, Family, 
                               Description, AvailableUOMs__c,
                               Product_Hierarchy_3__c, Division__c, IsActive
                        FROM Product2];
    }
    
    private void loadIntoProduct2Bean() {
        loadProduct2FromDB();
        product2Bean.Name = product2.Name;
        product2Bean.Family = product2.Family;
        product2Bean.Description = product2.Description;
        product2Bean.AvailableUOMs = product2.AvailableUOMs__c;
        product2Bean.ProductHierarchy3 = product2.Product_Hierarchy_3__c;
        product2Bean.Division = product2.Division__c;
        product2Bean.IsActive = product2.IsActive;
    }

    protected override void load(){
		loadProduct2FromDB();
        product2.Name = product2Bean.Name;
        product2.Family = product2Bean.Family;
        product2.Description = product2Bean.Description;
        product2.AvailableUOMs__c = product2Bean.AvailableUOMs;
        product2.Product_Hierarchy_3__c = product2Bean.ProductHierarchy3;
        product2.Division__c = product2Bean.Division;
        product2.IsActive = product2Bean.IsActive;
    }

    /*
    private void loadIntoProduct2BeanList() {
    	loadProduct2ListFromDB();
        product2BeanList = new List<Product2Bean>();
        for (Product2 product2: product2List) {
            product2Bean = new Product2Bean();
            
            product2Bean.Name = product2.Name;
            product2Bean.Family = product2.Family;
            product2Bean.Description = product2.Description;
            product2Bean.AvailableUOMs = product2.AvailableUOMs__c;
            product2Bean.ProductHierarchy3 = product2.Product_Hierarchy_3__c;
            product2Bean.Division = product2.Division__c;
            product2Bean.IsActive = product2.IsActive;
            
            product2BeanList.add(product2Bean);
        }
    }
	*/

    protected override void persist() {
        upsert product2;
    }
    
    public override String getObjectIdentifier() {
        return product2.Name;
    }
    
    public override List<Object> read() {
        /*
        if (product2Bean.Name.equals('00000000-0000-0000-0000-000000000000')) { // all
            loadIntoProduct2BeanList();
        } else { // specific
		*/
        loadIntoProduct2Bean();
        product2BeanList = new List<Product2Bean>();
        product2BeanList.add(product2Bean);
        /*
    	}
		*/
        return product2BeanList;
    }
    
    public override void setObjectIdentifier(String objectIdentifier) {
    	product2Bean.Name = objectIdentifier;    
    }
    
	//Factory Method for initialization with a bean
    public static Product2Processor initialize(DeviceCRMBean deviceCRMBean){
        return new Product2Processor((Product2Bean)deviceCRMBean);
    }

    public static Product2Processor initialize() {
        return new Product2Processor();
    }    
    
}