public class StockQueryUpdateProductItem {
	public class Result {
        @InvocableVariable(label='selected rows' required=false)
        public String jsonResponse;
        @InvocableVariable(label='Wo Id' required=false)
        public String WOId;
         @InvocableVariable(label='Quantity Consumed' required=false)
        public Integer quantityConsumed;
    }
    
    @InvocableMethod(label='Update Product Item Batch and create Product consumed recs')
    public static void updateProductItemBatch(List<Result> response){
    	for (Result res : response) {
           String selectedJson = res.jsonResponse;
           String woId = res.WOId;
           Integer qc = res.quantityConsumed;
           List<Object> selectedRows = (List<Object>) JSON.deserializeUntyped(selectedJson);
           system.debug(' selectedRows '+ selectedRows[0]); 
           Map<String,Object> selectedMap = (Map<String,Object>)selectedRows[0];
           String productItemBatchId = (String)selectedMap.get('Id');
           Decimal Available_Quantity = (Decimal) selectedMap.get('Available_Quantity__c');
           system.debug(' Available_Quantity '+Available_Quantity);
            
           Product_Item_Batch__c productItemBatch = [SELECT ID, Available_Quantity__c, Product_Item__c FROM Product_Item_Batch__c WHERE  Id = :productItemBatchId];                        
		   productItemBatch.Available_Quantity__c =  productItemBatch.Available_Quantity__c - qc ;
           update(productItemBatch);

           system.debug('productItemBatch '+ productItemBatch.Product_Item__c);
           
           ProductConsumed pc = new ProductConsumed();
           pc.ProductItemId = productItemBatch.Product_Item__c;
           pc.WorkOrderId = WOId;
           pc.QuantityConsumed = qc;
           insert(pc);
           
        }    
    }    
}