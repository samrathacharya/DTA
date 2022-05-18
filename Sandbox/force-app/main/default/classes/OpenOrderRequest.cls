public class OpenOrderRequest {
    public ConfigParams configParams;
    public Header header;
    public String customerNumber;
    public String salesOrganisation;
    public String documentDate;
    public String documentDateTo;

    public OpenOrderRequest() {
        this.configParams = new ConfigParams();
        this.header = new Header();
    }
}