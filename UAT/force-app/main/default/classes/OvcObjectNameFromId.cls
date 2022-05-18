/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcObjectNameFromId is used to find an object name from a record Id
 */
public class OvcObjectNameFromId {
    @InvocableMethod
    public static List<string> getObjectName(List<string> recordIds) {
        List<String> objNameList = new List<String>();
        if (recordIds != null) {
            for (String recordId : recordIds) {
                objNameList.add(Id.valueOf(recordId).getSobjectType().getDescribe().getName());
            }
        }
        return objNameList;
    }
}