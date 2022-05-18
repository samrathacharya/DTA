public class ProductLineItem {
    //Input parameters
    public String productCode { get; set; }
    public String quantity { get; set; }
    public String uom { get; set; }
    public string shortDescription;
    public double discount;
    public double discountPercent;
    public double UnitPrice;
    public double priceOverdue;
    public string lineDescription;
    public integer itemNumber;
    public string groupItem;
    public string category;
    
    
    
    //Output parameters
    public String netValue { get; set; }
    public String material { get; set; }
}