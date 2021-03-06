global class SalesOrderDetailHeaderMeta0 {
/* 
 * Generated by Overcast UTC 2022-02-10 10:41:52Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'VBAK' => new overcast.TypeInfo('VBAK', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.OUTPUT,
            new Map<String, overcast.FieldInfo> {
                'MANDT' => new overcast.FieldInfo('MANDT', 'Client', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.OUTPUT),
                'VBELN' => new overcast.FieldInfo('VBELN', 'Sales document', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT),
                'ERDAT' => new overcast.FieldInfo('ERDAT', 'Created on', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'ERZET' => new overcast.FieldInfo('ERZET', 'Time', overcast.Realtime.ApexType.STRINGX, 8, overcast.Realtime.Direction.OUTPUT),
                'ERNAM' => new overcast.FieldInfo('ERNAM', 'Created by', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.OUTPUT),
                'ANGDT' => new overcast.FieldInfo('ANGDT', 'Quotation from', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'BNDDT' => new overcast.FieldInfo('BNDDT', 'Valid To', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'AUDAT' => new overcast.FieldInfo('AUDAT', 'Document Date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'VBTYP' => new overcast.FieldInfo('VBTYP', 'Document cat.', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'TRVOG' => new overcast.FieldInfo('TRVOG', 'Transact.Group', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'AUART' => new overcast.FieldInfo('AUART', 'Sales Doc. Type', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'AUGRU' => new overcast.FieldInfo('AUGRU', 'Order Reason', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.OUTPUT),
                'LIFSK' => new overcast.FieldInfo('LIFSK', 'Delivery Block', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.OUTPUT),
                'FAKSK' => new overcast.FieldInfo('FAKSK', 'Billing Block', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.OUTPUT),
                'WAERK' => new overcast.FieldInfo('WAERK', 'Doc. Currency', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.OUTPUT),
                'VKORG' => new overcast.FieldInfo('VKORG', 'Sales Org.', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'VTWEG' => new overcast.FieldInfo('VTWEG', 'Distr. Channel', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.OUTPUT),
                'SPART' => new overcast.FieldInfo('SPART', 'Division', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.OUTPUT),
                'VKGRP' => new overcast.FieldInfo('VKGRP', 'Sales group', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.OUTPUT),
                'VKBUR' => new overcast.FieldInfo('VKBUR', 'Sales office', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'GUEBG' => new overcast.FieldInfo('GUEBG', 'Valid From', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'GUEEN' => new overcast.FieldInfo('GUEEN', 'Valid To', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'VSBED' => new overcast.FieldInfo('VSBED', 'Shp.Cond.', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.OUTPUT),
                'BSTNK' => new overcast.FieldInfo('BSTNK', 'Cust. Reference', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.OUTPUT),
                'BSTDK' => new overcast.FieldInfo('BSTDK', 'Cust. Ref. Date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'IHREZ' => new overcast.FieldInfo('IHREZ', 'Your Reference', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.OUTPUT),
                'KUNNR' => new overcast.FieldInfo('KUNNR', 'Customer', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT),
                'KOSTL' => new overcast.FieldInfo('KOSTL', 'Cost Center', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT),
                'AUFNR' => new overcast.FieldInfo('AUFNR', 'Order', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.OUTPUT),
                'FSSTK' => new overcast.FieldInfo('FSSTK', 'Billg Block Sts', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'GBSTK' => new overcast.FieldInfo('GBSTK', 'Overall Status', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'LFSTK' => new overcast.FieldInfo('LFSTK', 'Delivery Status', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'LSSTK' => new overcast.FieldInfo('LSSTK', 'Highest Level', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'WBSTK' => new overcast.FieldInfo('WBSTK', 'Goods Mvmnt Sts', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT)
            }
        )
    };
}