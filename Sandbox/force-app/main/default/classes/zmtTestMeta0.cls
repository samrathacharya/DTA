global class zmtTestMeta0 {
/* 
 * Generated by Overcast UTC 2021-12-02 10:21:20Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'A_Customer' => new overcast.TypeInfo('A_Customer', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'BillingIsBlockedForCustomer' => new overcast.FieldInfo('BillingIsBlockedForCustomer', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CreatedByUser' => new overcast.FieldInfo('CreatedByUser', '', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.BOTH),
                'CreationDate' => new overcast.FieldInfo('CreationDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'CustomerAccountGroup' => new overcast.FieldInfo('CustomerAccountGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerClassification' => new overcast.FieldInfo('CustomerClassification', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerFullName' => new overcast.FieldInfo('CustomerFullName', '', overcast.Realtime.ApexType.STRINGX, 220, overcast.Realtime.Direction.BOTH),
                'CustomerName' => new overcast.FieldInfo('CustomerName', '', overcast.Realtime.ApexType.STRINGX, 80, overcast.Realtime.Direction.BOTH),
                'DeliveryIsBlocked' => new overcast.FieldInfo('DeliveryIsBlocked', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'NFPartnerIsNaturalPerson' => new overcast.FieldInfo('NFPartnerIsNaturalPerson', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'OrderIsBlockedForCustomer' => new overcast.FieldInfo('OrderIsBlockedForCustomer', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'PostingIsBlocked' => new overcast.FieldInfo('PostingIsBlocked', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'Supplier' => new overcast.FieldInfo('Supplier', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CustomerCorporateGroup' => new overcast.FieldInfo('CustomerCorporateGroup', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'FiscalAddress' => new overcast.FieldInfo('FiscalAddress', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Industry' => new overcast.FieldInfo('Industry', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'IndustryCode1' => new overcast.FieldInfo('IndustryCode1', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'IndustryCode2' => new overcast.FieldInfo('IndustryCode2', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'IndustryCode3' => new overcast.FieldInfo('IndustryCode3', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'IndustryCode4' => new overcast.FieldInfo('IndustryCode4', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'IndustryCode5' => new overcast.FieldInfo('IndustryCode5', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber1' => new overcast.FieldInfo('InternationalLocationNumber1', '', overcast.Realtime.ApexType.STRINGX, 7, overcast.Realtime.Direction.BOTH),
                'NielsenRegion' => new overcast.FieldInfo('NielsenRegion', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'ResponsibleType' => new overcast.FieldInfo('ResponsibleType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'TaxNumber1' => new overcast.FieldInfo('TaxNumber1', '', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.BOTH),
                'TaxNumber2' => new overcast.FieldInfo('TaxNumber2', '', overcast.Realtime.ApexType.STRINGX, 11, overcast.Realtime.Direction.BOTH),
                'TaxNumber3' => new overcast.FieldInfo('TaxNumber3', '', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'TaxNumber4' => new overcast.FieldInfo('TaxNumber4', '', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'TaxNumber5' => new overcast.FieldInfo('TaxNumber5', '', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.BOTH),
                'TaxNumberType' => new overcast.FieldInfo('TaxNumberType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'VATRegistration' => new overcast.FieldInfo('VATRegistration', '', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'DeletionIndicator' => new overcast.FieldInfo('DeletionIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH)
            }
        )
    };
}