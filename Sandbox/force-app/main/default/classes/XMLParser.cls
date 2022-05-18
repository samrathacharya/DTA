public class XMLParser {
 
    public static DeviceCRMBean parse(String xml, String objectType){
        DeviceCRMBean ret = null;
        
        Dom.Document doc = new Dom.Document();
        doc.load(xml);
        
        //Retrieve the root element for this document.
        Dom.XMLNode node = doc.getRootElement();
        
        switch on objectType {
            when 'Account' {
                AccountBean ab = new AccountBean();
                
                ab.Name = (null != node.getChildElement('Name', null)) ? node.getChildElement('Name', null).getText() : '';
                ab.CustomerNumber = (null != node.getChildElement('CustomerNumber', null)) ? node.getChildElement('CustomerNumber', null).getText() : '';
                ab.Description = (null != node.getChildElement('Description', null)) ? node.getChildElement('Description', null).getText() : '';
                ab.BillingStreet = (null != node.getChildElement('BillingStreet', null)) ? node.getChildElement('BillingStreet', null).getText() : '';
                ab.BillingCity = (null != node.getChildElement('BillingCity', null)) ? node.getChildElement('BillingCity', null).getText() : '';
                ab.BillingState = (null != node.getChildElement('BillingState', null)) ? node.getChildElement('BillingState', null).getText() : '';
                ab.BillingCountry = (null != node.getChildElement('BillingCountry', null)) ? node.getChildElement('BillingCountry', null).getText() : '';
                ab.OtherName = (null != node.getChildElement('OtherName', null)) ? node.getChildElement('OtherName', null).getText() : '';

                ret = ab;
            }
            when 'Product2' {
                Product2Bean pb = new Product2Bean();
                
                pb.Name = (null != node.getChildElement('Name', null)) ? node.getChildElement('Name', null).getText() : '';
                pb.Family = (null != node.getChildElement('Family', null)) ? node.getChildElement('Family', null).getText() : '';
                pb.Description = (null != node.getChildElement('Description', null)) ? node.getChildElement('Description', null).getText() : '';
                pb.AvailableUOMs = (null != node.getChildElement('AvailableUOMs', null)) ? node.getChildElement('AvailableUOMs', null).getText() : '';
                pb.ProductHierarchy3 = (null != node.getChildElement('ProductHierarchy3', null)) ? node.getChildElement('ProductHierarchy3', null).getText() : '';
                pb.Division = (null != node.getChildElement('Division', null)) ? node.getChildElement('Division', null).getText() : '';
                pb.IsActive = (null != node.getChildElement('IsActive', null)) ? Boolean.valueOf(node.getChildElement('IsActive', null).getText()) : false;
                
                ret = pb;
            }
        }
        
        return ret;
    }
}