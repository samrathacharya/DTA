global class BusinessPartnerRTMeta0 {
/* 
 * Generated by Overcast UTC 2022-01-12 02:46:37Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'A_BusinessPartner' => new overcast.TypeInfo('A_BusinessPartner', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'BusinessPartner' => new overcast.FieldInfo('BusinessPartner', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Supplier' => new overcast.FieldInfo('Supplier', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'AcademicTitle' => new overcast.FieldInfo('AcademicTitle', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerCategory' => new overcast.FieldInfo('BusinessPartnerCategory', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerFullName' => new overcast.FieldInfo('BusinessPartnerFullName', '', overcast.Realtime.ApexType.STRINGX, 81, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerGrouping' => new overcast.FieldInfo('BusinessPartnerGrouping', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerName' => new overcast.FieldInfo('BusinessPartnerName', '', overcast.Realtime.ApexType.STRINGX, 81, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerUUID' => new overcast.FieldInfo('BusinessPartnerUUID', '', overcast.Realtime.ApexType.STRINGX, 0, overcast.Realtime.Direction.BOTH),
                'CorrespondenceLanguage' => new overcast.FieldInfo('CorrespondenceLanguage', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CreatedByUser' => new overcast.FieldInfo('CreatedByUser', '', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.BOTH),
                'CreationDate' => new overcast.FieldInfo('CreationDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'CreationTime' => new overcast.FieldInfo('CreationTime', '', overcast.Realtime.ApexType.TIMEX, 0, overcast.Realtime.Direction.BOTH),
                'FirstName' => new overcast.FieldInfo('FirstName', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'FormOfAddress' => new overcast.FieldInfo('FormOfAddress', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'Industry' => new overcast.FieldInfo('Industry', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber1' => new overcast.FieldInfo('InternationalLocationNumber1', '', overcast.Realtime.ApexType.STRINGX, 7, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber2' => new overcast.FieldInfo('InternationalLocationNumber2', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'IsFemale' => new overcast.FieldInfo('IsFemale', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'IsMale' => new overcast.FieldInfo('IsMale', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'IsNaturalPerson' => new overcast.FieldInfo('IsNaturalPerson', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'IsSexUnknown' => new overcast.FieldInfo('IsSexUnknown', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'GenderCodeName' => new overcast.FieldInfo('GenderCodeName', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'Language' => new overcast.FieldInfo('Language', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'LastChangeDate' => new overcast.FieldInfo('LastChangeDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'LastChangeTime' => new overcast.FieldInfo('LastChangeTime', '', overcast.Realtime.ApexType.TIMEX, 0, overcast.Realtime.Direction.BOTH),
                'LastChangedByUser' => new overcast.FieldInfo('LastChangedByUser', '', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.BOTH),
                'LastName' => new overcast.FieldInfo('LastName', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'LegalForm' => new overcast.FieldInfo('LegalForm', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'OrganizationBPName1' => new overcast.FieldInfo('OrganizationBPName1', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'OrganizationBPName2' => new overcast.FieldInfo('OrganizationBPName2', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'OrganizationBPName3' => new overcast.FieldInfo('OrganizationBPName3', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'OrganizationBPName4' => new overcast.FieldInfo('OrganizationBPName4', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'OrganizationFoundationDate' => new overcast.FieldInfo('OrganizationFoundationDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'OrganizationLiquidationDate' => new overcast.FieldInfo('OrganizationLiquidationDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'SearchTerm1' => new overcast.FieldInfo('SearchTerm1', '', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'SearchTerm2' => new overcast.FieldInfo('SearchTerm2', '', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'AdditionalLastName' => new overcast.FieldInfo('AdditionalLastName', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'BirthDate' => new overcast.FieldInfo('BirthDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerBirthDateStatus' => new overcast.FieldInfo('BusinessPartnerBirthDateStatus', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerBirthplaceName' => new overcast.FieldInfo('BusinessPartnerBirthplaceName', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerIsBlocked' => new overcast.FieldInfo('BusinessPartnerIsBlocked', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerType' => new overcast.FieldInfo('BusinessPartnerType', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ETag' => new overcast.FieldInfo('ETag', '', overcast.Realtime.ApexType.STRINGX, 26, overcast.Realtime.Direction.BOTH),
                'GroupBusinessPartnerName1' => new overcast.FieldInfo('GroupBusinessPartnerName1', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'GroupBusinessPartnerName2' => new overcast.FieldInfo('GroupBusinessPartnerName2', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'IndependentAddressID' => new overcast.FieldInfo('IndependentAddressID', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber3' => new overcast.FieldInfo('InternationalLocationNumber3', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'MiddleName' => new overcast.FieldInfo('MiddleName', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'NameCountry' => new overcast.FieldInfo('NameCountry', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'NameFormat' => new overcast.FieldInfo('NameFormat', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'PersonFullName' => new overcast.FieldInfo('PersonFullName', '', overcast.Realtime.ApexType.STRINGX, 80, overcast.Realtime.Direction.BOTH),
                'PersonNumber' => new overcast.FieldInfo('PersonNumber', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'IsMarkedForArchiving' => new overcast.FieldInfo('IsMarkedForArchiving', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerIDByExtSystem' => new overcast.FieldInfo('BusinessPartnerIDByExtSystem', '', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'TradingPartner' => new overcast.FieldInfo('TradingPartner', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'to_BusinessPartnerRole' => new overcast.FieldInfo('to_BusinessPartnerRole', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_Customer' => new overcast.FieldInfo('to_Customer', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_Supplier' => new overcast.FieldInfo('to_Supplier', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_BusinessPartnerRole' => new overcast.TypeInfo('A_BusinessPartnerRole', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'BusinessPartner' => new overcast.FieldInfo('BusinessPartner', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'BusinessPartnerRole' => new overcast.FieldInfo('BusinessPartnerRole', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'ValidFrom' => new overcast.FieldInfo('ValidFrom', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ValidTo' => new overcast.FieldInfo('ValidTo', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
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
                'DeletionIndicator' => new overcast.FieldInfo('DeletionIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'to_CustomerSalesArea' => new overcast.FieldInfo('to_CustomerSalesArea', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerSalesArea' => new overcast.TypeInfo('A_CustomerSalesArea', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrganization' => new overcast.FieldInfo('SalesOrganization', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DistributionChannel' => new overcast.FieldInfo('DistributionChannel', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Division' => new overcast.FieldInfo('Division', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'AccountByCustomer' => new overcast.FieldInfo('AccountByCustomer', '', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'BillingIsBlockedForCustomer' => new overcast.FieldInfo('BillingIsBlockedForCustomer', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CompleteDeliveryIsDefined' => new overcast.FieldInfo('CompleteDeliveryIsDefined', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'Currency_x' => new overcast.FieldInfo('Currency_x', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'CustomerABCClassification' => new overcast.FieldInfo('CustomerABCClassification', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerAccountAssignmentGroup' => new overcast.FieldInfo('CustomerAccountAssignmentGroup', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerGroup' => new overcast.FieldInfo('CustomerGroup', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerPaymentTerms' => new overcast.FieldInfo('CustomerPaymentTerms', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerPriceGroup' => new overcast.FieldInfo('CustomerPriceGroup', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerPricingProcedure' => new overcast.FieldInfo('CustomerPricingProcedure', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'DeliveryIsBlockedForCustomer' => new overcast.FieldInfo('DeliveryIsBlockedForCustomer', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'DeliveryPriority' => new overcast.FieldInfo('DeliveryPriority', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'IncotermsClassification' => new overcast.FieldInfo('IncotermsClassification', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'IncotermsLocation2' => new overcast.FieldInfo('IncotermsLocation2', '', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.BOTH),
                'IncotermsVersion' => new overcast.FieldInfo('IncotermsVersion', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'IncotermsLocation1' => new overcast.FieldInfo('IncotermsLocation1', '', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.BOTH),
                'DeletionIndicator' => new overcast.FieldInfo('DeletionIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'IncotermsTransferLocation' => new overcast.FieldInfo('IncotermsTransferLocation', '', overcast.Realtime.ApexType.STRINGX, 28, overcast.Realtime.Direction.BOTH),
                'InvoiceDate' => new overcast.FieldInfo('InvoiceDate', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'ItemOrderProbabilityInPercent' => new overcast.FieldInfo('ItemOrderProbabilityInPercent', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'OrderCombinationIsAllowed' => new overcast.FieldInfo('OrderCombinationIsAllowed', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'OrderIsBlockedForCustomer' => new overcast.FieldInfo('OrderIsBlockedForCustomer', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'PartialDeliveryIsAllowed' => new overcast.FieldInfo('PartialDeliveryIsAllowed', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'PriceListType' => new overcast.FieldInfo('PriceListType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'SalesGroup' => new overcast.FieldInfo('SalesGroup', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'SalesOffice' => new overcast.FieldInfo('SalesOffice', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ShippingCondition' => new overcast.FieldInfo('ShippingCondition', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'SupplyingPlant' => new overcast.FieldInfo('SupplyingPlant', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SalesDistrict' => new overcast.FieldInfo('SalesDistrict', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'InvoiceListSchedule' => new overcast.FieldInfo('InvoiceListSchedule', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'ExchangeRateType' => new overcast.FieldInfo('ExchangeRateType', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'AdditionalCustomerGroup1' => new overcast.FieldInfo('AdditionalCustomerGroup1', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'AdditionalCustomerGroup2' => new overcast.FieldInfo('AdditionalCustomerGroup2', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'AdditionalCustomerGroup3' => new overcast.FieldInfo('AdditionalCustomerGroup3', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'AdditionalCustomerGroup4' => new overcast.FieldInfo('AdditionalCustomerGroup4', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'AdditionalCustomerGroup5' => new overcast.FieldInfo('AdditionalCustomerGroup5', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'PaymentGuaranteeProcedure' => new overcast.FieldInfo('PaymentGuaranteeProcedure', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerAccountGroup' => new overcast.FieldInfo('CustomerAccountGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'to_SalesAreaText' => new overcast.FieldInfo('to_SalesAreaText', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerSalesAreaText' => new overcast.TypeInfo('A_CustomerSalesAreaText', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrganization' => new overcast.FieldInfo('SalesOrganization', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DistributionChannel' => new overcast.FieldInfo('DistributionChannel', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Division' => new overcast.FieldInfo('Division', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Language' => new overcast.FieldInfo('Language', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'LongTextID' => new overcast.FieldInfo('LongTextID', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'LongText' => new overcast.FieldInfo('LongText', '', overcast.Realtime.ApexType.STRINGX, 0, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_Supplier' => new overcast.TypeInfo('A_Supplier', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Supplier' => new overcast.FieldInfo('Supplier', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'AlternativePayeeAccountNumber' => new overcast.FieldInfo('AlternativePayeeAccountNumber', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CreatedByUser' => new overcast.FieldInfo('CreatedByUser', '', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.BOTH),
                'CreationDate' => new overcast.FieldInfo('CreationDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'PaymentIsBlockedForSupplier' => new overcast.FieldInfo('PaymentIsBlockedForSupplier', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'PostingIsBlocked' => new overcast.FieldInfo('PostingIsBlocked', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'PurchasingIsBlocked' => new overcast.FieldInfo('PurchasingIsBlocked', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'SupplierAccountGroup' => new overcast.FieldInfo('SupplierAccountGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SupplierFullName' => new overcast.FieldInfo('SupplierFullName', '', overcast.Realtime.ApexType.STRINGX, 220, overcast.Realtime.Direction.BOTH),
                'SupplierName' => new overcast.FieldInfo('SupplierName', '', overcast.Realtime.ApexType.STRINGX, 80, overcast.Realtime.Direction.BOTH),
                'VATRegistration' => new overcast.FieldInfo('VATRegistration', '', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'BirthDate' => new overcast.FieldInfo('BirthDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ConcatenatedInternationalLocNo' => new overcast.FieldInfo('ConcatenatedInternationalLocNo', '', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'DeletionIndicator' => new overcast.FieldInfo('DeletionIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'FiscalAddress' => new overcast.FieldInfo('FiscalAddress', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Industry' => new overcast.FieldInfo('Industry', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber1' => new overcast.FieldInfo('InternationalLocationNumber1', '', overcast.Realtime.ApexType.STRINGX, 7, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber2' => new overcast.FieldInfo('InternationalLocationNumber2', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'InternationalLocationNumber3' => new overcast.FieldInfo('InternationalLocationNumber3', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'IsNaturalPerson' => new overcast.FieldInfo('IsNaturalPerson', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ResponsibleType' => new overcast.FieldInfo('ResponsibleType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'SuplrQltyInProcmtCertfnValidTo' => new overcast.FieldInfo('SuplrQltyInProcmtCertfnValidTo', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'SuplrQualityManagementSystem' => new overcast.FieldInfo('SuplrQualityManagementSystem', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SupplierCorporateGroup' => new overcast.FieldInfo('SupplierCorporateGroup', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SupplierProcurementBlock' => new overcast.FieldInfo('SupplierProcurementBlock', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'TaxNumber1' => new overcast.FieldInfo('TaxNumber1', '', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.BOTH),
                'TaxNumber2' => new overcast.FieldInfo('TaxNumber2', '', overcast.Realtime.ApexType.STRINGX, 11, overcast.Realtime.Direction.BOTH),
                'TaxNumber3' => new overcast.FieldInfo('TaxNumber3', '', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'TaxNumber4' => new overcast.FieldInfo('TaxNumber4', '', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'TaxNumber5' => new overcast.FieldInfo('TaxNumber5', '', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.BOTH),
                'TaxNumberResponsible' => new overcast.FieldInfo('TaxNumberResponsible', '', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'TaxNumberType' => new overcast.FieldInfo('TaxNumberType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'SuplrProofOfDelivRlvtCode' => new overcast.FieldInfo('SuplrProofOfDelivRlvtCode', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'BR_TaxIsSplit' => new overcast.FieldInfo('BR_TaxIsSplit', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        )
    };
}