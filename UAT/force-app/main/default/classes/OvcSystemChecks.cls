/*
 * Copyright © 2021 Vigience Co., Ltd. All Rights Reserved
 */
/*
 * OvcSystemChecks is used to run checks based on the System class
 */
public class OvcSystemChecks {
    @InvocableMethod(label='Check context in which currently executing code is invoked')
    public static List<List<String>> checkContext(List<String> recordIdInput) {
        List<List<String>> contexts = new List<List<String>>();
        String context = '';
        if (System.isBatch()) {
            context = 'isBatch';
        } else if (System.isFuture()) {
            context = 'isFuture';
        } else if (System.isQueueable()) {
            context = 'isQueueable';
        }
        contexts.add(new List<String>{ context });
        while (recordIdInput != null && contexts.size() < recordIdInput.size()) {
            contexts.add(new List<String>{ context });
        }
        return contexts;
    }
}