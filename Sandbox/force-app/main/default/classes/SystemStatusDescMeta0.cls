global class SystemStatusDescMeta0 {
/* 
 * Generated by Overcast UTC 2022-03-16 08:17:42Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'TJ02T' => new overcast.TypeInfo('TJ02T', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.OUTPUT,
            new Map<String, overcast.FieldInfo> {
                'ISTAT' => new overcast.FieldInfo('ISTAT', 'System status', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.OUTPUT),
                'SPRAS' => new overcast.FieldInfo('SPRAS', 'Language', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'TXT04' => new overcast.FieldInfo('TXT04', 'Individual status of an object (short form)', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'TXT30' => new overcast.FieldInfo('TXT30', 'Object status', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.OUTPUT)
            }
        )
    };
}