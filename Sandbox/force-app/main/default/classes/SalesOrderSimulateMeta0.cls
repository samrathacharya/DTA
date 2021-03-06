global class SalesOrderSimulateMeta0 {
/* 
 * Generated by Overcast UTC 2022-03-04 02:40:37Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'A_SalesOrderSimulation' => new overcast.TypeInfo('A_SalesOrderSimulation', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrderType' => new overcast.FieldInfo('SalesOrderType', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SalesOrganization' => new overcast.FieldInfo('SalesOrganization', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DistributionChannel' => new overcast.FieldInfo('DistributionChannel', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'OrganizationDivision' => new overcast.FieldInfo('OrganizationDivision', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'SalesGroup' => new overcast.FieldInfo('SalesGroup', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'SalesOffice' => new overcast.FieldInfo('SalesOffice', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SalesDistrict' => new overcast.FieldInfo('SalesDistrict', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'SoldToParty' => new overcast.FieldInfo('SoldToParty', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'PurchaseOrderByCustomer' => new overcast.FieldInfo('PurchaseOrderByCustomer', '', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'CustomerPurchaseOrderType' => new overcast.FieldInfo('CustomerPurchaseOrderType', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerPurchaseOrderDate' => new overcast.FieldInfo('CustomerPurchaseOrderDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'SalesOrderDate' => new overcast.FieldInfo('SalesOrderDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'TransactionCurrency' => new overcast.FieldInfo('TransactionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'AccountingDocExternalReference' => new overcast.FieldInfo('AccountingDocExternalReference', '', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification1' => new overcast.FieldInfo('CustomerTaxClassification1', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification2' => new overcast.FieldInfo('CustomerTaxClassification2', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification3' => new overcast.FieldInfo('CustomerTaxClassification3', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification4' => new overcast.FieldInfo('CustomerTaxClassification4', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification5' => new overcast.FieldInfo('CustomerTaxClassification5', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification6' => new overcast.FieldInfo('CustomerTaxClassification6', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification7' => new overcast.FieldInfo('CustomerTaxClassification7', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification8' => new overcast.FieldInfo('CustomerTaxClassification8', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerTaxClassification9' => new overcast.FieldInfo('CustomerTaxClassification9', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'PriceListType' => new overcast.FieldInfo('PriceListType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CustomerPriceGroup' => new overcast.FieldInfo('CustomerPriceGroup', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'SDDocumentReason' => new overcast.FieldInfo('SDDocumentReason', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'PricingDate' => new overcast.FieldInfo('PricingDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'RequestedDeliveryDate' => new overcast.FieldInfo('RequestedDeliveryDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ShippingCondition' => new overcast.FieldInfo('ShippingCondition', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'CompleteDeliveryIsDefined' => new overcast.FieldInfo('CompleteDeliveryIsDefined', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'ShippingType' => new overcast.FieldInfo('ShippingType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'IncotermsClassification' => new overcast.FieldInfo('IncotermsClassification', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'IncotermsTransferLocation' => new overcast.FieldInfo('IncotermsTransferLocation', '', overcast.Realtime.ApexType.STRINGX, 28, overcast.Realtime.Direction.BOTH),
                'IncotermsLocation1' => new overcast.FieldInfo('IncotermsLocation1', '', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.BOTH),
                'IncotermsLocation2' => new overcast.FieldInfo('IncotermsLocation2', '', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.BOTH),
                'IncotermsVersion' => new overcast.FieldInfo('IncotermsVersion', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CustomerPaymentTerms' => new overcast.FieldInfo('CustomerPaymentTerms', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'PaymentMethod' => new overcast.FieldInfo('PaymentMethod', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'to_Credit' => new overcast.FieldInfo('to_Credit', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_Item' => new overcast.FieldInfo('to_Item', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_Partner' => new overcast.FieldInfo('to_Partner', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_Pricing' => new overcast.FieldInfo('to_Pricing', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_PricingElement' => new overcast.FieldInfo('to_PricingElement', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderCreditSimulation' => new overcast.TypeInfo('A_SalesOrderCreditSimulation', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'TotalCreditCheckStatus' => new overcast.FieldInfo('TotalCreditCheckStatus', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderItemSimulation' => new overcast.TypeInfo('A_SalesOrderItemSimulation', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrderItem' => new overcast.FieldInfo('SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'HigherLevelItem' => new overcast.FieldInfo('HigherLevelItem', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'SalesOrderItemCategory' => new overcast.FieldInfo('SalesOrderItemCategory', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SalesOrderItemText' => new overcast.FieldInfo('SalesOrderItemText', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'PurchaseOrderByCustomer' => new overcast.FieldInfo('PurchaseOrderByCustomer', '', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'Material' => new overcast.FieldInfo('Material', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'MaterialByCustomer' => new overcast.FieldInfo('MaterialByCustomer', '', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'PricingDate' => new overcast.FieldInfo('PricingDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'PricingReferenceMaterial' => new overcast.FieldInfo('PricingReferenceMaterial', '', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'RequestedQuantity' => new overcast.FieldInfo('RequestedQuantity', '', overcast.Realtime.ApexType.DECIMALX, 18,3, overcast.Realtime.Direction.BOTH),
                'RequestedQuantityUnit' => new overcast.FieldInfo('RequestedQuantityUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'RequestedQuantitySAPUnit' => new overcast.FieldInfo('RequestedQuantitySAPUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'RequestedQuantityISOUnit' => new overcast.FieldInfo('RequestedQuantityISOUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'TransactionCurrency' => new overcast.FieldInfo('TransactionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'NetAmount' => new overcast.FieldInfo('NetAmount', '', overcast.Realtime.ApexType.DECIMALX, 19,3, overcast.Realtime.Direction.BOTH),
                'TaxAmount' => new overcast.FieldInfo('TaxAmount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'CostAmount' => new overcast.FieldInfo('CostAmount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'Subtotal1Amount' => new overcast.FieldInfo('Subtotal1Amount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'Subtotal2Amount' => new overcast.FieldInfo('Subtotal2Amount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'Subtotal3Amount' => new overcast.FieldInfo('Subtotal3Amount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'Subtotal4Amount' => new overcast.FieldInfo('Subtotal4Amount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'Subtotal5Amount' => new overcast.FieldInfo('Subtotal5Amount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'Subtotal6Amount' => new overcast.FieldInfo('Subtotal6Amount', '', overcast.Realtime.ApexType.DECIMALX, 17,3, overcast.Realtime.Direction.BOTH),
                'MaterialGroup' => new overcast.FieldInfo('MaterialGroup', '', overcast.Realtime.ApexType.STRINGX, 9, overcast.Realtime.Direction.BOTH),
                'MaterialPricingGroup' => new overcast.FieldInfo('MaterialPricingGroup', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Batch' => new overcast.FieldInfo('Batch', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Plant' => new overcast.FieldInfo('Plant', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'StorageLocation' => new overcast.FieldInfo('StorageLocation', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'DeliveryGroup' => new overcast.FieldInfo('DeliveryGroup', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ShippingPoint' => new overcast.FieldInfo('ShippingPoint', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ShippingType' => new overcast.FieldInfo('ShippingType', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'DeliveryPriority' => new overcast.FieldInfo('DeliveryPriority', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'IncotermsClassification' => new overcast.FieldInfo('IncotermsClassification', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'IncotermsTransferLocation' => new overcast.FieldInfo('IncotermsTransferLocation', '', overcast.Realtime.ApexType.STRINGX, 28, overcast.Realtime.Direction.BOTH),
                'IncotermsLocation1' => new overcast.FieldInfo('IncotermsLocation1', '', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.BOTH),
                'IncotermsLocation2' => new overcast.FieldInfo('IncotermsLocation2', '', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification1' => new overcast.FieldInfo('ProductTaxClassification1', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification2' => new overcast.FieldInfo('ProductTaxClassification2', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification3' => new overcast.FieldInfo('ProductTaxClassification3', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification4' => new overcast.FieldInfo('ProductTaxClassification4', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification5' => new overcast.FieldInfo('ProductTaxClassification5', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification6' => new overcast.FieldInfo('ProductTaxClassification6', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification7' => new overcast.FieldInfo('ProductTaxClassification7', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification8' => new overcast.FieldInfo('ProductTaxClassification8', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ProductTaxClassification9' => new overcast.FieldInfo('ProductTaxClassification9', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CustomerPaymentTerms' => new overcast.FieldInfo('CustomerPaymentTerms', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SalesDocumentRjcnReason' => new overcast.FieldInfo('SalesDocumentRjcnReason', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'to_Partner' => new overcast.FieldInfo('to_Partner', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_PricingElement' => new overcast.FieldInfo('to_PricingElement', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_ScheduleLine' => new overcast.FieldInfo('to_ScheduleLine', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderItemPartnerSimln' => new overcast.TypeInfo('A_SalesOrderItemPartnerSimln', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrderItem' => new overcast.FieldInfo('SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'PartnerFunction' => new overcast.FieldInfo('PartnerFunction', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Supplier' => new overcast.FieldInfo('Supplier', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Personnel' => new overcast.FieldInfo('Personnel', '', overcast.Realtime.ApexType.STRINGX, 8, overcast.Realtime.Direction.BOTH),
                'ContactPerson' => new overcast.FieldInfo('ContactPerson', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_SalesOrderItem' => new overcast.FieldInfo('to_SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderItmPrcgElmntSimln' => new overcast.TypeInfo('A_SalesOrderItmPrcgElmntSimln', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrderItem' => new overcast.FieldInfo('SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'PricingProcedureStep' => new overcast.FieldInfo('PricingProcedureStep', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'PricingProcedureCounter' => new overcast.FieldInfo('PricingProcedureCounter', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionType' => new overcast.FieldInfo('ConditionType', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ConditionCalculationType' => new overcast.FieldInfo('ConditionCalculationType', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionRateValue' => new overcast.FieldInfo('ConditionRateValue', '', overcast.Realtime.ApexType.DECIMALX, 33,9, overcast.Realtime.Direction.BOTH),
                'ConditionCurrency' => new overcast.FieldInfo('ConditionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'ConditionQuantity' => new overcast.FieldInfo('ConditionQuantity', '', overcast.Realtime.ApexType.DECIMALX, 5,0, overcast.Realtime.Direction.BOTH),
                'ConditionQuantityUnit' => new overcast.FieldInfo('ConditionQuantityUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionQuantitySAPUnit' => new overcast.FieldInfo('ConditionQuantitySAPUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionQuantityISOUnit' => new overcast.FieldInfo('ConditionQuantityISOUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionIsForStatistics' => new overcast.FieldInfo('ConditionIsForStatistics', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'ConditionAmount' => new overcast.FieldInfo('ConditionAmount', '', overcast.Realtime.ApexType.DECIMALX, 19,3, overcast.Realtime.Direction.BOTH),
                'TransactionCurrency' => new overcast.FieldInfo('TransactionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'ConditionInactiveReason' => new overcast.FieldInfo('ConditionInactiveReason', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ConditionIsManuallyChanged' => new overcast.FieldInfo('ConditionIsManuallyChanged', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_SalesOrderItem' => new overcast.FieldInfo('to_SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderScheduleLineSimln' => new overcast.TypeInfo('A_SalesOrderScheduleLineSimln', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SalesOrderItem' => new overcast.FieldInfo('SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'ScheduleLine' => new overcast.FieldInfo('ScheduleLine', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'RequestedDeliveryDate' => new overcast.FieldInfo('RequestedDeliveryDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'ConfirmedDeliveryDate' => new overcast.FieldInfo('ConfirmedDeliveryDate', '', overcast.Realtime.ApexType.DATETIMEX, 0, overcast.Realtime.Direction.BOTH),
                'OrderQuantityUnit' => new overcast.FieldInfo('OrderQuantityUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'OrderQuantitySAPUnit' => new overcast.FieldInfo('OrderQuantitySAPUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'OrderQuantityISOUnit' => new overcast.FieldInfo('OrderQuantityISOUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ScheduleLineOrderQuantity' => new overcast.FieldInfo('ScheduleLineOrderQuantity', '', overcast.Realtime.ApexType.DECIMALX, 16,3, overcast.Realtime.Direction.BOTH),
                'ConfdOrderQtyByMatlAvailCheck' => new overcast.FieldInfo('ConfdOrderQtyByMatlAvailCheck', '', overcast.Realtime.ApexType.DECIMALX, 16,3, overcast.Realtime.Direction.BOTH),
                'OpenConfdDelivQtyInOrdQtyUnit' => new overcast.FieldInfo('OpenConfdDelivQtyInOrdQtyUnit', '', overcast.Realtime.ApexType.DECIMALX, 16,3, overcast.Realtime.Direction.BOTH),
                'CorrectedQtyInOrderQtyUnit' => new overcast.FieldInfo('CorrectedQtyInOrderQtyUnit', '', overcast.Realtime.ApexType.DECIMALX, 16,3, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'to_SalesOrderItem' => new overcast.FieldInfo('to_SalesOrderItem', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderPartnerSimulation' => new overcast.TypeInfo('A_SalesOrderPartnerSimulation', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'PartnerFunction' => new overcast.FieldInfo('PartnerFunction', '', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'Customer' => new overcast.FieldInfo('Customer', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Supplier' => new overcast.FieldInfo('Supplier', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'Personnel' => new overcast.FieldInfo('Personnel', '', overcast.Realtime.ApexType.STRINGX, 8, overcast.Realtime.Direction.BOTH),
                'ContactPerson' => new overcast.FieldInfo('ContactPerson', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderPricingSimulation' => new overcast.TypeInfo('A_SalesOrderPricingSimulation', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'TotalNetAmount' => new overcast.FieldInfo('TotalNetAmount', '', overcast.Realtime.ApexType.DECIMALX, 19,3, overcast.Realtime.Direction.BOTH),
                'TransactionCurrency' => new overcast.FieldInfo('TransactionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        ),
        'A_SalesOrderPrcgElmntSimln' => new overcast.TypeInfo('A_SalesOrderPrcgElmntSimln', '', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'SalesOrder' => new overcast.FieldInfo('SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'PricingProcedureStep' => new overcast.FieldInfo('PricingProcedureStep', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'PricingProcedureCounter' => new overcast.FieldInfo('PricingProcedureCounter', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionType' => new overcast.FieldInfo('ConditionType', '', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ConditionCalculationType' => new overcast.FieldInfo('ConditionCalculationType', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionRateValue' => new overcast.FieldInfo('ConditionRateValue', '', overcast.Realtime.ApexType.DECIMALX, 33,9, overcast.Realtime.Direction.BOTH),
                'ConditionCurrency' => new overcast.FieldInfo('ConditionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'ConditionQuantity' => new overcast.FieldInfo('ConditionQuantity', '', overcast.Realtime.ApexType.DECIMALX, 5,0, overcast.Realtime.Direction.BOTH),
                'ConditionQuantityUnit' => new overcast.FieldInfo('ConditionQuantityUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionQuantitySAPUnit' => new overcast.FieldInfo('ConditionQuantitySAPUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionQuantityISOUnit' => new overcast.FieldInfo('ConditionQuantityISOUnit', '', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'ConditionIsForStatistics' => new overcast.FieldInfo('ConditionIsForStatistics', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'ConditionAmount' => new overcast.FieldInfo('ConditionAmount', '', overcast.Realtime.ApexType.DECIMALX, 19,3, overcast.Realtime.Direction.BOTH),
                'TransactionCurrency' => new overcast.FieldInfo('TransactionCurrency', '', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.BOTH),
                'ConditionInactiveReason' => new overcast.FieldInfo('ConditionInactiveReason', '', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ConditionIsManuallyChanged' => new overcast.FieldInfo('ConditionIsManuallyChanged', '', overcast.Realtime.ApexType.BOOLEANX, 0, overcast.Realtime.Direction.BOTH),
                'to_SalesOrder' => new overcast.FieldInfo('to_SalesOrder', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'OVC_FKEY' => new overcast.FieldInfo('OVC_FKEY', '', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH)
            }
        )
    };
}