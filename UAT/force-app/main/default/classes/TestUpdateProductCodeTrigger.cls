@isTest
private class TestUpdateProductCodeTrigger {
    @isTest static void TestUpdateProductCodeWithOneProduct() {
        // Test data setup
        // Create a product with a name and then verify that product code is same as the name
        Product2 product = new Product2(Name='Test Product');
        insert product;
        
        // Verify 
        List<Product2> verifyProductList = [SELECT Id, Name, Product_Code_ID__c FROM Product2 WHERE Name = 'Test Product'];
        System.assert(verifyProductList != null);
        Product2 verifyProduct = verifyProductList[0];
        System.assert(verifyProduct.Product_Code_ID__c == product.Name);
        System.debug(verifyProduct.Product_Code_ID__c);
    }
}