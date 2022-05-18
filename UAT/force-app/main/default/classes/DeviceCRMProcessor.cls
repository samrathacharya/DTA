/**
 * Abstract definition for processing inbound save and fetch (write/read)
 * requests from Device external apps
 */
public abstract class DeviceCRMProcessor {
	
    /**
     * Load the database object from initialization data
     */
    protected abstract void load();
    
    /**
     * Save the object to database (update / insert)
     */
    protected abstract void persist();
    
    /**
     * return the object identifier (id/number/uniqueKey) 
     * known to Unbnd external apps
     */
	public abstract String getObjectIdentifier();
    
    /*
     * set the object identifier
     * child classes MUST implement
     */ 
    public abstract void setObjectIdentifier(String objectIdentifier);

    /**
     * process an update/insert
     * return the identifier
     */ 
    public String write() {
    	load();
        persist();
        return getObjectIdentifier();
    }
    
    /**
     * process a fetch
     * return the object(s) fetched
     * 
     * This is dummy implemented here to avoid 
     * force implementations in child class if not required 
     */ 
    public virtual List<Object> read() {
        return null;
    }
    
}