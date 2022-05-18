public class PriceResponse {
	public ResponseStatus responseStatus;
    public List<ProductLineItem> productList;
    public string pdfString;
    public string documentNumber;
    public Map<Integer,OpportunityLineItem> optyLineItems;
    public Map<String,OpportunityLineItem> productLineItems;
     public Map<String,String> shiptoAddressMap;
    
    public PriceResponse() {
        this.responseStatus = new ResponseStatus();
        this.productList = new List<ProductLineItem>();
        this.optyLineItems =  new Map<Integer,OpportunityLineItem>();
		this.productLineItems = new Map<String, OpportunityLineItem>();
        this.shipToAddressMap = new Map<String,String>();
    }
    
    public override String toString() {
        String ret = '#########################################################\n';
        
        ret = ret + '----------------------------------------------------\n';
        ret = ret + '[ResponseStatus.result:  {' + responseStatus.result + '}\n' +
            '[ResponseStatus.message: {' + responseStatus.message + '}\n' +
            '[ResponseStatus.errorSource: {' + responseStatus.errorSource + '}\n' +
            '[ResponseStatus.erringEntity: {' + responseStatus.erringEntity + '}\n' +
            '[ResponseStatus.errorDetail: {' + responseStatus.errorDetail + '}\n';
        
        ret = ret + '----------------------------------------------------\n';
        for (Integer i = 0; i < this.productList.size(); i++) {
        	ProductLineItem product = this.productList.get(i);
            ret = ret + '[ProductLineItem[' + i + '].productCode = ' + product.productCode + ']\n' +
                '[ProductLineItem[' + i + '].quantity = ' + product.quantity + ']\n' +
                '[ProductLineItem[' + i + '].uom = ' + product.uom + ']\n' +
                '[ProductLineItem[' + i + '].netValue = ' + product.netValue + ']\n' +
                '[ProductLineItem[' + i + '].material = ' + product.material + ']\n\n' ;
        }
        ret = ret + '----------------------------------------------------\n';
        
        ret = ret + '#########################################################\n';
        
        return ret;
    }
}