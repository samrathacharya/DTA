public class PriceRequest {
    public ConfigParams configParams;
    public Header header;
    public List<ProductLineItem> productList;
    public Map<Integer,ProductLineItem> productMap;
    public boolean isBomExploded;
    public string discountOverall;
    public string discountPercentage;
    public string title; 
    public string generateQuote;
    public string headerText;
   public String INT_NUMBER_ASSIGNMENT;
    public string SF_OPTY_ID;
    public string SALESREP;
    public string KUNWE;
    public PriceRequest() {
        this.configParams = new ConfigParams();
        this.header = new Header();
        this.productList = new List<ProductLineItem>();
        this.productMap = new Map<Integer,ProductLineItem>();
        this.isBomExploded = false;
    }
}