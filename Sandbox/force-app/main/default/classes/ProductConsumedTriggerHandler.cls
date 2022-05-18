public class ProductConsumedTriggerHandler {

    public static void beforeUpdateProductConsumedConfirmed(List<ProductConsumed> newList) {
        for(ProductConsumed pc : newList){
            if(pc.Confirmed__c){
                pc.Record_Lock__c = true;
            }
        }    
  	}
    public static void beforeDeleteProductConsumedConfirmed(List<ProductConsumed> oldList) {
    	for(ProductConsumed pc : oldList){
            if(pc.Confirmed__c){
                pc.addError('You are not allowed to delete Product Consumed Confirmed records');
            }
        }
  	}
}