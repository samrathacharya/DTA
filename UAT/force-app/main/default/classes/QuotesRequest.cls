public class QuotesRequest {
    public ConfigParams configParams;
    public Header header;
    //TODO: Add required parameters

    public QuotesRequest() {
        this.configParams = new ConfigParams();
        this.header = new Header();
    }

}