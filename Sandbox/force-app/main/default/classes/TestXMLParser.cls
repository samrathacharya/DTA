@IsTest
public class TestXMLParser {
	@IsTest
    public static void testParse_Account() {
        String objectType = 'Account';
        String xml = '<Account><Name>flow</Name><CustomerNumber>0001001998</CustomerNumber><OtherName>Other</OtherName></Account>';

        DeviceCRMBean bean = XMLParser.parse(xml, objectType);
        System.assertNotEquals(null, bean);
        System.assert(bean instanceof AccountBean);
    }

	@IsTest
    public static void testParse_Product2() {
        String objectType = 'Product2';
        String xml = '<Product2><ProductHierarchy3>100031000110001454</ProductHierarchy3><Name>1A-MSA195</Name><IsActive>true</IsActive><Division>12</Division><Description>MATRELLE SALINE SIZER SHP FULL 468-195</Description><AvailableUOMs>EA</AvailableUOMs></Product2>';

        DeviceCRMBean bean = XMLParser.parse(xml, objectType);
        System.assertNotEquals(null, bean);
        System.assert(bean instanceof Product2Bean);
    }

}