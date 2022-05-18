public class FetchProductItemBatches {
	public class InputData {
        @InvocableVariable(label='Response Data' required=false)
        public List<dtgBootStockTestA_MatlStkInAcctMod> stockResultsList;
        @InvocableVariable(label='Wo Id' required=false)
        public String WOId;
        @InvocableVariable(label='Quantity Consumed' required=false)
        public Integer quantityConsumed;
        @InvocableVariable(label='Product Id' required=false)
        public Id ProductId;
    }
    
    public class PIResult{
        @InvocableVariable(label='output Data' required=false)
        public String outputResponse;
    }
    
    @InvocableMethod(label='Fetch Product Item Batches')
    public static List<PIResult> FetchPIBatches(List<InputData> response){
    	List<PIResult> PIResList = new List<PIResult>();
        for (InputData res : response) {
        	String woId = res.WOId;
            Integer qc = res.quantityConsumed;
            Id pdtId = res.ProductId; 
            List<Product_Item_Batch__c> productItemBatches = new List<Product_Item_Batch__c>();
            List<dtgBootStockTestA_MatlStkInAcctMod> stockQueryResults = new List<dtgBootStockTestA_MatlStkInAcctMod>();
            stockQueryResults = res.stockResultsList;
            for(dtgBootStockTestA_MatlStkInAcctMod stockQueryObj : stockQueryResults){
                List<Product_Item_Batch__c> productItemBatchesTemp = new List<Product_Item_Batch__c>();
            	Id locId = [SELECT Id FROM Location WHERE ovcStorage_Location_Code__c = :stockQueryObj.StorageLocation AND Plant_Code__c = :stockQueryObj.Plant][0].Id;
                if(locId != null){
                   ProductItem ProductItemRec = [SELECT ID FROM ProductItem WHERE Product2Id = :pdtId AND LocationId = :locId limit 1];  
                   productItemBatchesTemp = [SELECT ID, Available_Quantity__c, Batch__c FROM Product_Item_Batch__c WHERE Product_Item__c = :ProductItemRec.Id AND Batch__c = :stockQueryObj.Batch AND Available_Quantity__c >= :qc];                        
                   productItemBatches.addAll(productItemBatchesTemp);
               }
            }
            PIResult outputResObj = new PIResult();
            outputResObj.outputResponse = JSON.serialize(productItemBatches);
            PIResList.add(outputResObj);
        }    
        return PIResList;
    }
}