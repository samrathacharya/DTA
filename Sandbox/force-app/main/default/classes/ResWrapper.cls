public class ResWrapper {

	public String WBSElementInternalID;
	public String Supplier;
	public String StorageLocation;
	public String SDDocumentItem;
	public String SDDocument;
	public String Plant;
	public Double MatlWrhsStkQtyInMatlBaseUnit;
	public String MaterialBaseUnit;
	public String Material;
	public String InventoryStockType;
	public String InventorySpecialStockType;
	public String Customer;
	public String Batch;

	
	public static List<ResWrapper> parse(String json) {
		return (List<ResWrapper>) System.JSON.deserialize(json, List<ResWrapper>.class);
	}
}