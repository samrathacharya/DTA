/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
private class OvcActionRunComponentTest {
    static final String RECORD_ID = '0WO1s000000UNzhGAG';
    class DatabaseAccess implements OvcActionRunComponent.IDatabaseAccess {
        public SObject record;
        public Map<String, SObject> recordsMap = new Map<String, SObject>();
        public String exceptionMsg;
        public Boolean componentWasRun = false;

        public void runComponent(String recordId, String compName, String importParams) {
            this.componentWasRun = true;
            if (String.isNotBlank(this.exceptionMsg)) {
                throw new overcast.ComponentFrameworkUtility.ComponentPluginException(this.exceptionMsg);
            }
        }

        public SObject getRecord(string recordId, String objectName, String fieldForError) {
            return new WorkOrder(Id = recordId);
        }

        public void updateRecord(SObject record) {
            this.record = record;
            this.recordsMap.put(record.Id, record);
        }
    }

    static DatabaseAccess setTestInterfaceClass(String exMsg) {
        DatabaseAccess db = new DatabaseAccess();
        db.exceptionMsg = exMsg;
        OvcActionRunComponent.databaseAccess = db;
        return db;
    }

    static List<OvcActionRunComponent> createInput(String recordId, String compName, String errorMsgField) {
        OvcActionRunComponent input = new OvcActionRunComponent();
        input.recordId = recordId;
        input.componentName = compName;
        input.fieldForErrorMessage = errorMsgField;
        return new List<OvcActionRunComponent>{ input };
    }

    @isTest
    static void assertComponentIsNotRunForNullInput() {
        DatabaseAccess db = setTestInterfaceClass(null);

        Test.startTest();
        OvcActionRunComponent.runComponent(null);
        Test.stopTest();

        System.assert(!db.componentWasRun);
    }

    @isTest
    static void assertComponentIsNotRunForInputWithNull() {
        DatabaseAccess db = setTestInterfaceClass(null);

        Test.startTest();
        OvcActionRunComponent.runComponent(new List<OvcActionRunComponent>{ null });
        Test.stopTest();

        System.assert(!db.componentWasRun);
    }

    @isTest
    static void assertComponentIsNotRunForInputWithoutRecordId() {
        DatabaseAccess db = setTestInterfaceClass(null);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput(null, 'b', 'c'));
        Test.stopTest();

        System.assert(!db.componentWasRun);
    }

    @isTest
    static void assertComponentIsNotRunForInputWithoutCompName() {
        DatabaseAccess db = setTestInterfaceClass(null);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput('a', null, 'c'));
        Test.stopTest();

        System.assert(!db.componentWasRun);
    }

    @isTest
    static void assertNoSavedMessageForRunWithoutException() {
        DatabaseAccess db = setTestInterfaceClass(null);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput('a', 'b', 'c'));
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertEquals(null, db.record);
    }

    @isTest
    static void assertSavedMessageForRunWithExceptionAndValidErrorField() {
        String exMsg = 'Error';
        String errorMsgField = 'Subject';

        DatabaseAccess db = setTestInterfaceClass(exMsg);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput(RECORD_ID, 'b', errorMsgField));
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertNotEquals(null, db.record);
        System.assertEquals(exMsg, db.record.get(errorMsgField));
    }

    @isTest
    static void assertMultipleRecordsForRunWithExceptionAndValidErrorField() {
        String exMsg = 'Error';
        String errorMsgField = 'Subject';

        DatabaseAccess db = setTestInterfaceClass(exMsg);

        Test.startTest();
        List<OvcActionRunComponent> inputList = createInput(RECORD_ID, 'b', errorMsgField);
        inputList.addAll(createInput('0WO1s000000UNS6GAO', 'c', errorMsgField));
        OvcActionRunComponent.runComponent(inputList);
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertEquals(2, db.recordsMap.size());
        for (SObject record : db.recordsMap.values()) {
            System.assertEquals(exMsg, record.get(errorMsgField));
        }
    }

    @isTest
    static void assertTruncatedSavedMessageForRunWithExceptionAndValidErrorField() {
        String exMsg = 'a'.repeat(300);
        String errorMsgField = 'Subject';

        DatabaseAccess db = setTestInterfaceClass(exMsg);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput(RECORD_ID, 'b', errorMsgField));
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertNotEquals(null, db.record);
        System.assertEquals('a'.repeat(255), db.record.get(errorMsgField));
    }

    @isTest
    static void assertNoSavedMessageForRunWithExceptionAndNoErrorField() {
        String exMsg = 'Error';

        DatabaseAccess db = setTestInterfaceClass(exMsg);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput(RECORD_ID, 'b', null));
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertEquals(null, db.record);
    }

    @isTest
    static void assertNoSavedMessageForRunWithExceptionAndInvalidErrorField() {
        String exMsg = 'Error';
        String errorMsgField = 'xyz';

        DatabaseAccess db = setTestInterfaceClass(exMsg);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput(RECORD_ID, 'b', errorMsgField));
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertEquals(null, db.record);
    }

    @isTest
    static void assertNoSavedMessageForRunWithExceptionAndInvalidRecordId() {
        String exMsg = 'Error';
        String errorMsgField = 'Subject';

        DatabaseAccess db = setTestInterfaceClass(exMsg);

        Test.startTest();
        OvcActionRunComponent.runComponent(createInput('abc', 'b', errorMsgField));
        Test.stopTest();

        System.assert(db.componentWasRun);
        System.assertEquals(null, db.record);
    }

    @IsTest
    static void testDatabaseAccess() {
        System.assertEquals(null, OvcActionRunComponent.databaseAccess.getRecord('X', 'WorkOrder', 'Description'));
    }
}