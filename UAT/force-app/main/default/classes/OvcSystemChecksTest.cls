@isTest
private class OvcSystemChecksTest implements Database.Batchable<sObject>, Database.Stateful {
    private List<String> recordIdInput;
    private static List<List<String>> output;

    public OvcSystemChecksTest(List<String> recordIds) {
        this.recordIdInput = recordIds;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id FROM Account WHERE Id = null');
    }

    public void execute(Database.BatchableContext BC, List<SObject> records) {
    }

    public void finish(Database.BatchableContext BC) {
        output = OvcSystemChecks.checkContext(this.recordIdInput);
    }

    private static void runInBatchContext(List<String> recordIdInput) {
        OvcSystemChecksTest bc = new OvcSystemChecksTest(recordIdInput);
        Database.executeBatch(bc);
    }

    @future
    private static void runInFutureContext(List<String> recordIdInput) {
        output = OvcSystemChecks.checkContext(recordIdInput);
    }

    private class QueueableExecution implements Queueable {
        private List<String> recordIdInput;
        public QueueableExecution(List<String> recordIds) {
            this.recordIdInput = recordIds;
        }
        public void execute(QueueableContext context) {
            output = OvcSystemChecks.checkContext(this.recordIdInput);
        }
    }

    @isTest
    static void assertBlankReturnValueWhenNoConditionMet() {
        List<List<String>> output = OvcSystemChecks.checkContext(null);
        System.assertEquals(1, output.size());
        System.assertEquals(new List<String>{ '' }, output[0]);
    }

    @isTest
    static void assertSingleReturnValueForNullInputAndMetCondition() {
        Test.startTest();
        runInBatchContext(null);
        Test.stopTest();
        System.assertEquals(1, output.size());
        System.assertEquals(new List<String>{ 'isBatch' }, output[0]);
    }

    @isTest
    static void assertSingleReturnValueForSingleInputAndMetCondition() {
        Test.startTest();
        runInFutureContext(new List<String>{ 'a' });
        Test.stopTest();
        System.assertEquals(1, output.size());
        System.assertEquals(new List<String>{ 'isFuture' }, output[0]);
    }

    @IsTest
    static void assertMultipleReturnValuesForMultipleInputsAndMetCondition() {
        Test.startTest();
        System.enqueueJob(new QueueableExecution(new List<String>{ 'a', 'b' }));
        Test.stopTest();
        System.assertEquals(2, output.size());
        for (List<String> item : output) {
            System.assertEquals(new List<String>{ 'isQueueable' }, item);
        }
    }
}