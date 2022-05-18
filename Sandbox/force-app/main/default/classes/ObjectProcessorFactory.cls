public class ObjectProcessorFactory {

    static Map<String, Type> typeVsBeanMap = new Map<String, Type>();
    static {
        typeVsBeanMap.put('Account', Type.forName('AccountBean'));
        typeVsBeanMap.put('Product2', Type.forName('Product2Bean'));
    }
    
    public static DeviceCrmProcessor processor = null;
    public static DeviceCrmProcessor getProcessor(String objectType, String requestBodyStr) {
        Type resultType = typeVsBeanMap.get(objectType);
        DeviceCRMBean deviceCRMBean = null;
        if (null != requestBodyStr) {
            //XML request body: Parse
            deviceCRMBean = (DeviceCRMBean)XMLParser.parse(requestBodyStr, objectType);
        } else {
            if (resultType != null) {
            	deviceCRMBean = (DeviceCRMBean)resultType.newInstance();
            }
        }
        switch on objectType {
            when 'Account' {
                processor = deviceCRMBean == null ? AccountProcessor.initialize() : AccountProcessor.initialize(deviceCRMBean); 
            }
            when 'Product2' {
                processor = deviceCRMBean == null ? Product2Processor.initialize() : Product2Processor.initialize(deviceCRMBean);
            }
        }
        return processor;
    }
}