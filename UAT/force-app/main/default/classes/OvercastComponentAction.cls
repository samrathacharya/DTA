public class OvercastComponentAction {
    @InvocableVariable(description='ID of record on which Overcast component is run' required=true)
    public String recordId;
    @InvocableVariable(description='Component definition name of Overcast component to run' required=true)
    public String componentName;
    @InvocableVariable(description='Additional parameters (JSON string) to pass to Overcast component')
    public String importParameters;
    @InvocableVariable(description='API name of field in which error message will be stored')
    public String fieldForErrorMessage;

    @InvocableMethod
    public static void runComponent(List<OvercastComponentAction> inputs) {
        if (inputs != null && !inputs.isEmpty() && String.isNotBlank(inputs[0].recordId) && String.isNotBlank(inputs[0].componentName)) {
            callScenarioFromApex(inputs[0].recordId, inputs[0].componentName, inputs[0].importParameters, inputs[0].fieldForErrorMessage);
        }
    }

    @future(callout=true)
    private static void callScenarioFromApex(String recordId, String componentName, String importParameters, String fieldForError) {
        if (!Test.isRunningTest()) {
            try {
                overcast.ComponentFrameworkController.callScenarioFromApex(recordId, componentName, importParameters);
            } catch (Exception ex) {
                System.debug('ex.getMessage() : ' + ex.getMessage());
                saveErrorMessage(recordId, fieldForError, ex.getMessage());
            }
        }
    }

    @TestVisible
    private static void saveErrorMessage(String recordId, String fieldForError, String errorMessage) {
        if (String.isBlank(fieldForError)) {
            return;
        }
        try {
            DescribeSObjectResult describe = Id.valueOf(recordId).getSObjectType().getDescribe();
            if (describe.fields.getMap().containsKey(fieldForError)) {
                SObject record = databaseAccess.getRecord(recordId, describe.getName(), fieldForError);
                if (record != null) {
                    record.put(fieldForError, errorMessage.left(255));
                    databaseAccess.updateRecord(record);
                }
            }
        } catch (Exception ex) {
            System.debug('ex.getMessage() : ' + ex.getMessage());
            System.debug(ex.getMessage());
        }
    }

    @TestVisible
    private static IDatabaseAccess databaseAccess {
        get {
            return databaseAccess == null ? (databaseAccess = new DatabaseAccess()) : databaseAccess;
        }
        set {
            databaseAccess = value;
        }
    }

    @TestVisible
    private interface IDatabaseAccess {
        SObject getRecord(string recordId, String objectName, String fieldForError);
        void updateRecord(SObject record);
    }

    private class DatabaseAccess implements IDatabaseAccess {
        public SObject getRecord(string recordId, String objectName, String fieldForError) {
            // prettier-ignore
            List<SObject> sObjList = Database.query('SELECT Id, ' + fieldForError + ' FROM ' + objectName + ' WHERE Id =: recordId WITH SECURITY_ENFORCED');
            return sObjList.isEmpty() ? null : sObjList[0];
        }
        public void updateRecord(SObject record) {
            update record;
        }
    }
}