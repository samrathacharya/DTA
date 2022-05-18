public class StockQueryFlowClass {
    public class InputData {
        @InvocableVariable(label='Response Data' required=false)
        public String jsonResponse;
        @InvocableVariable(label='Wo Id' required=false)
        public String WOId;
         @InvocableVariable(label='Quantity Consumed' required=false)
        public Integer quantityConsumed;
    }
    
    public class OutputResult{
        @InvocableVariable(label='output Data' required=false)
        public String outputResponse;
    }
    
    @InvocableMethod(label='Create Product Consumed Records')
    public static List<OutputResult> createProductConsumedRec(List<InputData> response){
        List<OutputResult> outputres = new List<OutputResult>();
        for (InputData res : response) {
            String inputString = res.jsonResponse;
            String woId = res.WOId;
            Integer qc = res.quantityConsumed;
            String jsonString = inputString.stripHtmlTags();
            List<Product_Item_Batch__c> productItemBatches = new List<Product_Item_Batch__c>();
            List<productItemBatches> jsonproductbatch = new List<productItemBatches>();
            List<ResWrapper> objList = ResWrapper.parse(jsonString);

            for(ResWrapper resObj : objList){
                List<Product_Item_Batch__c> productItemBatchesTemp = new List<Product_Item_Batch__c>();
                List<Product2> Product = [Select Id, Name from Product2 where Name = :resObj.Material];
                if(Product.size()>0){
                    Id pId = Product[0].Id;
                    Id lId = [SELECT Id FROM Location WHERE ovcStorage_Location_Code__c = :resObj.StorageLocation AND Plant_Code__c = :resObj.Plant][0].Id;
                    if(lId != null){
                        List<ProductItem> ProductItems = [SELECT ID FROM ProductItem WHERE Product2Id = :pId AND LocationId = :lId];
                        List<Id> pIds= new List<Id>();
                        if(ProductItems.size()>0){
                            for(ProductItem piId : ProductItems){
                                pIds.add(piId.Id);
                            }
                        }    
                        productItemBatchesTemp = [SELECT ID, Available_Quantity__c, Batch__c FROM Product_Item_Batch__c WHERE Product_Item__c IN :pIds AND Batch__c = :resObj.Batch AND Available_Quantity__c >= :qc];                        
                    	productItemBatches.addAll(productItemBatchesTemp);
                    }
                }
            }
            system.debug('productItemBatches '+productItemBatches);
            for(Product_Item_Batch__c p : productItemBatches ){
                productItemBatches pb = new productItemBatches();
                pb.Batch = p.Batch__c;
                pb.Available_Quantity = p.Available_Quantity__c; 
                jsonproductbatch.add(pb);
            }
            
            OutputResult outputResObj = new OutputResult();
            outputResObj.outputResponse = JSON.serialize(productItemBatches);
            outputres.add(outputResObj);
            
        }
        return outputres;
    }
    
    public class productItemBatches{
        String Batch {get; set;}
        Decimal Available_Quantity {get; set;}
    }        
}