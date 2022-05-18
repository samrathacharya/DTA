@IsTest
public class TestProduct2Processor {

    @isTest
    public static void testProduct2Processor() {
        String product2Name = '1A-MSA195';
        String product2Family = 'family';
        Boolean product2IsActive = false;

        Product2Processor pp = (Product2Processor)ObjectProcessorFactory.getProcessor('Product2', null);
        pp.setObjectIdentifier(product2Name);
        System.assertNotEquals(null, pp);
        
        List<Product2Bean> p2bList = (List<Product2Bean>)pp.read();
        System.assertNotEquals(null, p2bList);
        System.assertEquals(null, pp.getObjectIdentifier());
        
        Product2Processor pp2 = Product2Processor.initialize();
        System.assertNotEquals(null, pp2);
        
        Product2Bean pb = new Product2Bean();
        pb.Name = product2Name;
        pb.Family = product2Family;
        pb.IsActive = product2IsActive;
        Product2Processor pp3 = Product2Processor.initialize(pb);
        System.assertNotEquals(null, pp3);
        
        String ret = pp3.write();
        System.assertNotEquals(null, ret);
    }
}