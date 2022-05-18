@IsTest
private class TestDeviceCRMProcessor {
	
    @isTest
    private static void testDeviceCRMProcessor() {
        DeviceCRMProcessor proc = new MockProcessor();
        System.assert(proc.write() == 'mockid', 'Fail');
        System.assertEquals(proc.read().size(), 1);
        System.assertEquals(proc.read().get(0), 'random');
        proc.setObjectIdentifier('Mock1');
        System.assert(proc.getObjectIdentifier() == 'Mock1', 'Fail');

        proc = new MockProcessor2();
        System.assert(proc.write() == 'mockid2', 'Fail');
        System.assert(proc.read() == null, 'Fail');
        proc.setObjectIdentifier('Mock2');
        System.assert(proc.getObjectIdentifier() == 'Mock2', 'Fail');

    }
    
    private class MockProcessor extends DeviceCRMProcessor{
        String ident = 'mockid';
        protected override void load(){ }
        protected override void persist(){}
        public override String getObjectIdentifier() { return ident; }
        public override void setObjectIdentifier(String id) { ident = id; }
        public override List<Object> read() {
            List<String> ret = new List<String>();
            ret.add('random');
            return ret;
        }
    }
    
    private class MockProcessor2 extends DeviceCRMProcessor{
        String ident = 'mockid2';
        protected override void load(){ }
        protected override void persist(){}
        public override String getObjectIdentifier() { return ident; }
        public override void setObjectIdentifier(String id) { ident = id; }
    }
    
}