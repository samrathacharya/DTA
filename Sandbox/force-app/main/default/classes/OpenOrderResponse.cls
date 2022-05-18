public class OpenOrderResponse {
   	public ResponseStatus responseStatus;
    public List<SalesOrderItem> salesOrderList;

    public OpenOrderResponse() {
        this.responseStatus = new ResponseStatus();
        this.salesOrderList = new List<SalesOrderItem>();
    }
}