global class zjcSageTestMeta0 {
/* 
 * Generated by Overcast UTC 2021-11-22 06:40:36Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'ZCRM_GET_EMPLOYEE_ABSENCE' => new overcast.TypeInfo('ZCRM_GET_EMPLOYEE_ABSENCE', '', overcast.Realtime.StructureType.STRUCTURE, overcast.Realtime.Direction.OUTPUT,
            new Map<String, overcast.FieldInfo> {
                'E_LOG_EMAIL' => new overcast.FieldInfo('E_LOG_EMAIL', 'E_LOG_EMAIL', overcast.Realtime.ApexType.STRINGX, 0, overcast.Realtime.Direction.OUTPUT)
            }
        ),
        'E_TAB_LEAVE' => new overcast.TypeInfo('E_TAB_LEAVE', 'Table of Employee Leave', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.OUTPUT,
            new Map<String, overcast.FieldInfo> {
                'ESS_NUMBER' => new overcast.FieldInfo('ESS_NUMBER', 'Character Field of Length 12', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.OUTPUT),
                'LEAVE_START' => new overcast.FieldInfo('LEAVE_START', 'Date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'LEAVE_END' => new overcast.FieldInfo('LEAVE_END', 'Date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'LEAVE_TYPE' => new overcast.FieldInfo('LEAVE_TYPE', 'c', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.OUTPUT)
            }
        )
    };
}