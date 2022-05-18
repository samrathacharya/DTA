@IsTest
public class TestOppTerrAssignDefaultLogicFilter {
	@IsTest
    static void test_getOpportunityTerritory2Assignments() {
        Integer numRecords = 2;
        
        OppTerrAssignDefaultLogicFilter filter = new OppTerrAssignDefaultLogicFilter();
        List<Opportunity> oppList = [SELECT Id FROM Opportunity LIMIT :numRecords];
        List<Id> oppIds = new List<Id>();
        
        for (Opportunity opp: oppList) {
            oppIds.add(opp.Id);
        }
        Map<Id, Id> oppTerrMap = filter.getOpportunityTerritory2Assignments(oppIds);
        
        System.assertNotEquals(null, oppTerrMap);
        //System.assertEquals(numRecords, oppTerrMap.size());
    }
}