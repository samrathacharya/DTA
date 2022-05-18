public class ObjectNameFromID {
    @InvocableMethod
    public static List<string> getObjectName(List<string> recordIds) {
        String objectName;
        if (recordIds != null && !recordIds.isEmpty()) {
            objectName = Id.valueOf(recordIds[0]).getSobjectType().getDescribe().getName();
        }
        return new List<String>{ objectName };
    }
}