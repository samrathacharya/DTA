/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
@isTest
private class OvcObjectNameFromIdTest {
    @isTest
    static void testGetObjectName() {
        //Test with single valid ID
        List<String> objNameList = OvcObjectNameFromId.getObjectName(new List<String>{ '001xa000003DIlo' });
        System.assertEquals(new List<String>{ 'Account' }, objNameList);

        //Test with multiple valid IDs
        objNameList = OvcObjectNameFromId.getObjectName(new List<String>{ '001xa000003DIlo', '0066D0000049RFvQAM' });
        System.assertEquals(new List<String>{ 'Account', 'Opportunity' }, objNameList);

        //Test with single invalid ID
        try {
            objNameList = OvcObjectNameFromId.getObjectName(new List<String>{ 'X' });
            System.assert(false, 'getObjectName did not throw an exception when called with an invalid Id');
        } catch (Exception ex) {
            System.assert(true);
        }

        //Test with multiple IDs that include an invalid ID
        try {
            objNameList = OvcObjectNameFromId.getObjectName(new List<String>{ '001xa000003DIlo', 'X' });
            System.assert(false, 'getObjectName did not throw an exception when called with an invalid Id');
        } catch (Exception ex) {
            System.assert(true);
        }
    }
}