@isTest
private class OvercastComponentActionTest {
    private class DatabaseAccess implements OvercastComponentAction.IDatabaseAccess {
        public SObject record;

        public SObject getRecord(string recordId, String objectName, String fieldForError) {
            return new WorkOrder();
        }

        public void updateRecord(SObject record) {
            this.record = record;
        }
    }

    @IsTest
    static void testRunComponent() {
        DatabaseAccess testDb = new DatabaseAccess();
        OvercastComponentAction.databaseAccess = testDb;

        OvercastComponentAction input = new OvercastComponentAction();
        input.recordId = 'a';
        input.componentName = 'b';
        input.fieldForErrorMessage = 'c';

        Test.startTest();
        OvercastComponentAction.runComponent(new List<OvercastComponentAction>{ input });
        Test.stopTest();

        System.assertEquals(null, testDb.record);
    }

    @IsTest
    static void testSaveErrorMessage() {
        DatabaseAccess testDb = new DatabaseAccess();
        OvercastComponentAction.databaseAccess = testDb;

        String recordId = '0WO1s000000TqcKGAS';
        String errorMsg = 'a'.repeat(300);

        //Test with no field
        OvercastComponentAction.saveErrorMessage(recordId, null, errorMsg);
        System.assertEquals(null, testDb.record);

        //Test with valid field
        String fieldForError = 'ovcSAP_Message__c';
        OvercastComponentAction.saveErrorMessage(recordId, fieldForError, errorMsg);
        System.assertNotEquals(null, testDb.record);
        Object msg = testDb.record.get(fieldForError);
        System.assertNotEquals(null, msg);
        System.assertEquals(255, String.valueOf(msg).length());

        //Test with invalid Id
        testDb.record = null;
        recordId = 'XYZ';
        OvercastComponentAction.saveErrorMessage(recordId, fieldForError, errorMsg);
        System.assertEquals(null, testDb.record);
    }

    @IsTest
    static void testDatabaseAccess() {
        System.assertEquals(null, OvercastComponentAction.databaseAccess.getRecord('X', 'WorkOrder', 'Description'));
    }
}