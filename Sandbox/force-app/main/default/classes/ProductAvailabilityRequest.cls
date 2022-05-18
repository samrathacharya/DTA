public with sharing class ProductAvailabilityRequest {
    public ConfigParams configParams;
    public Header header;
    Public string plantCode {get; set;}
    Public string productName{get; set;}
    Public string uom {get;set;}
    
    public ProductAvailabilityRequest() {
        this.configParams = new ConfigParams();
        this.header = new Header();
       
        }


}