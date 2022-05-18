/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcActionRunComponent is used to run an Overcast component from an autolaunched flow
 */
public class OvcActionRunComponent {
    @InvocableVariable(description='ID of record from which to run Overcast component' required=true)
    public String recordId;
    @InvocableVariable(description='Component definition name of Overcast component to run' required=true)
    public String componentName;
    @InvocableVariable(description='Additional parameters (JSON string) to pass to Overcast component')
    public String importParameters;
    @InvocableVariable(description='API name of record field for saving error messages')
    public String fieldForErrorMessage;

    @InvocableMethod
    public static void runComponent(List<OvcActionRunComponent> inputs) {
        if (inputs == null) {
            return;
        }
        for (OvcActionRunComponent input : inputs) {
            if (input != null && String.isNotBlank(input.recordId) && String.isNotBlank(input.componentName)) {
                callScenarioFromApex(input.recordId, input.componentName, input.importParameters, input.fieldForErrorMessage);
            }
        }
    }

    @future(callout=true)
    private static void callScenarioFromApex(String recordId, String componentName, String importParameters, String fieldForError) {
        try {
            databaseAccess.runComponent(recordId, componentName, importParameters);
        } catch (Exception ex) {
            saveErrorMessage(recordId, fieldForError, ex.getMessage());
        }
    }

    @TestVisible
    private static void saveErrorMessage(String recordId, String fieldForError, String errorMessage) {
        if (String.isBlank(fieldForError)) {
            return;
        }
        try {
            DescribeSObjectResult describe = Id.valueOf(recordId).getSObjectType().getDescribe();
            Schema.SObjectField sObjField = describe.fields.getMap().get(fieldForError);
            if (sObjField != null) {
                SObject record = databaseAccess.getRecord(recordId, describe.getName(), fieldForError);
                if (record != null) {
                    record.put(fieldForError, errorMessage.left(sObjField.getDescribe().getLength()));
                    databaseAccess.updateRecord(record);
                }
            }
        } catch (Exception ex) {
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
        void runComponent(String recordId, String compName, String importParams);
        SObject getRecord(string recordId, String objectName, String fieldForError);
        void updateRecord(SObject record);
    }

    private class DatabaseAccess implements IDatabaseAccess {
        public void runComponent(String recordId, String compName, String importParams) {
            overcast.ComponentFrameworkController.callScenarioFromApex(recordId, compName, importParams);
        }
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