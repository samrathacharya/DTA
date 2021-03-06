global class zmtTestCustomerOdataMeta0 {
/* 
 * Generated by Overcast UTC 2022-01-14 06:51:19Z.
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
                'DeletionIndicator' => new overcast.FieldInfo('DeletionIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'to_CustomerCompany' => new overcast.FieldInfo('to_CustomerCompany', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_CustomerSalesArea' => new overcast.FieldInfo('to_CustomerSalesArea', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_CustomerTaxGrouping' => new overcast.FieldInfo('to_CustomerTaxGrouping', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_CustomerText' => new overcast.FieldInfo('to_CustomerText', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerCompany' => new overcast.TypeInfo('A_CustomerCompany', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CompanyCode' => new overcast.FieldInfo('CompanyCode', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'APARToleranceGroup' => new overcast.FieldInfo('APARToleranceGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'AccountByCustomer' => new overcast.FieldInfo('AccountByCustomer', '', overcast.Realtime.ApexType.STRINGX, 12, overcast.Realtime.Direction.BOTH),
                'AccountingClerk' => new overcast.FieldInfo('AccountingClerk', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'AccountingClerkFaxNumber' => new overcast.FieldInfo('AccountingClerkFaxNumber', '', overcast.Realtime.ApexType.STRINGX, 31, overcast.Realtime.Direction.BOTH),
                'AccountingClerkInternetAddress' => new overcast.FieldInfo('AccountingClerkInternetAddress', '', overcast.Realtime.ApexType.STRINGX, 130, overcast.Realtime.Direction.BOTH),
                'AccountingClerkPhoneNumber' => new overcast.FieldInfo('AccountingClerkPhoneNumber', '', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.BOTH),
                'AlternativePayerAccount' => new overcast.FieldInfo('AlternativePayerAccount', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CollectiveInvoiceVariant' => new overcast.FieldInfo('CollectiveInvoiceVariant', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerAccountNote' => new overcast.FieldInfo('CustomerAccountNote', '', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.BOTH),
                'CustomerHeadOffice' => new overcast.FieldInfo('CustomerHeadOffice', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CustomerSupplierClearingIsUsed' => new overcast.FieldInfo('CustomerSupplierClearingIsUsed', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'HouseBank' => new overcast.FieldInfo('HouseBank', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'InterestCalculationCode' => new overcast.FieldInfo('InterestCalculationCode', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'InterestCalculationDate' => new overcast.FieldInfo('InterestCalculationDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'IntrstCalcFrequencyInMonths' => new overcast.FieldInfo('IntrstCalcFrequencyInMonths', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'IsToBeLocallyProcessed' => new overcast.FieldInfo('IsToBeLocallyProcessed', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'ItemIsToBePaidSeparately' => new overcast.FieldInfo('ItemIsToBePaidSeparately', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'LayoutSortingRule' => new overcast.FieldInfo('LayoutSortingRule', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'PaymentBlockingReason' => new overcast.FieldInfo('PaymentBlockingReason', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'PaymentMethodsList' => new overcast.FieldInfo('PaymentMethodsList', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'PaymentTerms' => new overcast.FieldInfo('PaymentTerms', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'PaytAdviceIsSentbyEDI' => new overcast.FieldInfo('PaytAdviceIsSentbyEDI', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'PhysicalInventoryBlockInd' => new overcast.FieldInfo('PhysicalInventoryBlockInd', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'ReconciliationAccount' => new overcast.FieldInfo('ReconciliationAccount', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'RecordPaymentHistoryIndicator' => new overcast.FieldInfo('RecordPaymentHistoryIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'UserAtCustomer' => new overcast.FieldInfo('UserAtCustomer', '', overcast.Realtime.ApexType.STRINGX, 15, overcast.Realtime.Direction.BOTH),
                'DeletionIndicator' => new overcast.FieldInfo('DeletionIndicator', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'CashPlanningGroup' => new overcast.FieldInfo('CashPlanningGroup', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'KnownOrNegotiatedLeave' => new overcast.FieldInfo('KnownOrNegotiatedLeave', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ValueAdjustmentKey' => new overcast.FieldInfo('ValueAdjustmentKey', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerAccountGroup' => new overcast.FieldInfo('CustomerAccountGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'to_CompanyText' => new overcast.FieldInfo('to_CompanyText', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_CustomerDunning' => new overcast.FieldInfo('to_CustomerDunning', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_WithHoldingTax' => new overcast.FieldInfo('to_WithHoldingTax', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerCompanyText' => new overcast.TypeInfo('A_CustomerCompanyText', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CompanyCode' => new overcast.FieldInfo('CompanyCode', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'Language' => new overcast.FieldInfo('Language', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'LongTextID' => new overcast.FieldInfo('LongTextID', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'LongText' => new overcast.FieldInfo('LongText', '', overcast.Realtime.ApexType.STRINGX, 0, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerDunning' => new overcast.TypeInfo('A_CustomerDunning', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CompanyCode' => new overcast.FieldInfo('CompanyCode', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DunningArea' => new overcast.FieldInfo('DunningArea', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'DunningBlock' => new overcast.FieldInfo('DunningBlock', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'DunningLevel' => new overcast.FieldInfo('DunningLevel', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'DunningProcedure' => new overcast.FieldInfo('DunningProcedure', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DunningRecipient' => new overcast.FieldInfo('DunningRecipient', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'LastDunnedOn' => new overcast.FieldInfo('LastDunnedOn', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'LegDunningProcedureOn' => new overcast.FieldInfo('LegDunningProcedureOn', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'DunningClerk' => new overcast.FieldInfo('DunningClerk', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerAccountGroup' => new overcast.FieldInfo('CustomerAccountGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerWithHoldingTax' => new overcast.TypeInfo('A_CustomerWithHoldingTax', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CompanyCode' => new overcast.FieldInfo('CompanyCode', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'WithholdingTaxType' => new overcast.FieldInfo('WithholdingTaxType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'WithholdingTaxCode' => new overcast.FieldInfo('WithholdingTaxCode', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'WithholdingTaxAgent' => new overcast.FieldInfo('WithholdingTaxAgent', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'ObligationDateBegin' => new overcast.FieldInfo('ObligationDateBegin', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ObligationDateEnd' => new overcast.FieldInfo('ObligationDateEnd', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'WithholdingTaxNumber' => new overcast.FieldInfo('WithholdingTaxNumber', '', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.BOTH),
                'WithholdingTaxCertificate' => new overcast.FieldInfo('WithholdingTaxCertificate', '', overcast.Realtime.ApexType.STRINGX, 25, overcast.Realtime.Direction.BOTH),
                'WithholdingTaxExmptPercent' => new overcast.FieldInfo('WithholdingTaxExmptPercent', '', overcast.Realtime.ApexType.DECIMALX, 7,2, overcast.Realtime.Direction.BOTH),
                'ExemptionDateBegin' => new overcast.FieldInfo('ExemptionDateBegin', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ExemptionDateEnd' => new overcast.FieldInfo('ExemptionDateEnd', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ExemptionReason' => new overcast.FieldInfo('ExemptionReason', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
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
                'to_PartnerFunction' => new overcast.FieldInfo('to_PartnerFunction', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_SalesAreaTax' => new overcast.FieldInfo('to_SalesAreaTax', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_SalesAreaText' => new overcast.FieldInfo('to_SalesAreaText', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustSalesPartnerFunc' => new overcast.TypeInfo('A_CustSalesPartnerFunc', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrganization' => new overcast.FieldInfo('SalesOrganization', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DistributionChannel' => new overcast.FieldInfo('DistributionChannel', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Division' => new overcast.FieldInfo('Division', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'PartnerCounter' => new overcast.FieldInfo('PartnerCounter', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'PartnerFunction' => new overcast.FieldInfo('PartnerFunction', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'BPCustomerNumber' => new overcast.FieldInfo('BPCustomerNumber', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CustomerPartnerDescription' => new overcast.FieldInfo('CustomerPartnerDescription', '', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.BOTH),
                'DefaultPartner' => new overcast.FieldInfo('DefaultPartner', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'Supplier' => new overcast.FieldInfo('Supplier', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'PersonnelNumber' => new overcast.FieldInfo('PersonnelNumber', '', overcast.Realtime.ApexType.STRINGX, 8, overcast.Realtime.Direction.BOTH),
                'ContactPerson' => new overcast.FieldInfo('ContactPerson', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'AuthorizationGroup' => new overcast.FieldInfo('AuthorizationGroup', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerSalesAreaTax' => new overcast.TypeInfo('A_CustomerSalesAreaTax', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrganization' => new overcast.FieldInfo('SalesOrganization', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DistributionChannel' => new overcast.FieldInfo('DistributionChannel', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Division' => new overcast.FieldInfo('Division', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'DepartureCountry' => new overcast.FieldInfo('DepartureCountry', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'CustomerTaxCategory' => new overcast.FieldInfo('CustomerTaxCategory', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification' => new overcast.FieldInfo('CustomerTaxClassification', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
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
        'A_CustomerTaxGrouping' => new overcast.TypeInfo('A_CustomerTaxGrouping', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'CustomerTaxGroupingCode' => new overcast.FieldInfo('CustomerTaxGroupingCode', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'CustTaxGrpExemptionCertificate' => new overcast.FieldInfo('CustTaxGrpExemptionCertificate', '', overcast.Realtime.ApexType.STRINGX, 15, overcast.Realtime.Direction.BOTH),
                'CustTaxGroupExemptionRate' => new overcast.FieldInfo('CustTaxGroupExemptionRate', '', overcast.Realtime.ApexType.DECIMALX, 7,2, overcast.Realtime.Direction.BOTH),
                'CustTaxGroupExemptionStartDate' => new overcast.FieldInfo('CustTaxGroupExemptionStartDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'CustTaxGroupExemptionEndDate' => new overcast.FieldInfo('CustTaxGroupExemptionEndDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'CustTaxGroupSubjectedStartDate' => new overcast.FieldInfo('CustTaxGroupSubjectedStartDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'CustTaxGroupSubjectedEndDate' => new overcast.FieldInfo('CustTaxGroupSubjectedEndDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_CustomerText' => new overcast.TypeInfo('A_CustomerText', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Language' => new overcast.FieldInfo('Language', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'LongTextID' => new overcast.FieldInfo('LongTextID', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'LongText' => new overcast.FieldInfo('LongText', '', overcast.Realtime.ApexType.STRINGX, 0, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        )
    };
}