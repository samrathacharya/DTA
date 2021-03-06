global class sapInvoiceDetailMeta0 {
/* 
 * Generated by Overcast UTC 2022-03-04 01:33:14Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */

    public static Map<String, overcast.TypeInfo> metadata = new Map<String, overcast.TypeInfo> {
        'BAPI_WEBINVOICE_GETDETAIL' => new overcast.TypeInfo('BAPI_WEBINVOICE_GETDETAIL', '', overcast.Realtime.StructureType.STRUCTURE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'BILLINGDOC' => new overcast.FieldInfo('BILLINGDOC', 'Billing document', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.INPUT),
                'LANGU' => new overcast.FieldInfo('LANGU', 'Language key', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.INPUT),
                'PARTNER_NUMBER' => new overcast.FieldInfo('PARTNER_NUMBER', 'Partner number', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.INPUT),
                'PARTNER_ROLE' => new overcast.FieldInfo('PARTNER_ROLE', 'Partner function', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.INPUT)
            }
        ),
        'RETURN_x' => new overcast.TypeInfo('RETURN_x', 'Return Parameter', overcast.Realtime.StructureType.STRUCTURE, overcast.Realtime.Direction.OUTPUT,
            new Map<String, overcast.FieldInfo> {
                'TYPE_x' => new overcast.FieldInfo('TYPE_x', 'Message type', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'ID' => new overcast.FieldInfo('ID', 'Message Class', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.OUTPUT),
                'NUMBER_x' => new overcast.FieldInfo('NUMBER_x', 'Message Number', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.OUTPUT),
                'MESSAGE' => new overcast.FieldInfo('MESSAGE', 'Message Text', overcast.Realtime.ApexType.STRINGX, 220, overcast.Realtime.Direction.OUTPUT),
                'LOG_NO' => new overcast.FieldInfo('LOG_NO', 'Log number', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.OUTPUT),
                'LOG_MSG_NO' => new overcast.FieldInfo('LOG_MSG_NO', 'Message no.', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.OUTPUT),
                'MESSAGE_V1' => new overcast.FieldInfo('MESSAGE_V1', 'Message Variable', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.OUTPUT),
                'MESSAGE_V2' => new overcast.FieldInfo('MESSAGE_V2', 'Message Variable', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.OUTPUT),
                'MESSAGE_V3' => new overcast.FieldInfo('MESSAGE_V3', 'Message Variable', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.OUTPUT),
                'MESSAGE_V4' => new overcast.FieldInfo('MESSAGE_V4', 'Message Variable', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.OUTPUT),
                'PARAMETER' => new overcast.FieldInfo('PARAMETER', 'Parameter Name', overcast.Realtime.ApexType.STRINGX, 32, overcast.Realtime.Direction.OUTPUT),
                'ROW' => new overcast.FieldInfo('ROW', 'Parameter line', overcast.Realtime.ApexType.INTEGERX, 10, overcast.Realtime.Direction.OUTPUT),
                'FIELD' => new overcast.FieldInfo('FIELD', 'Field name', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.OUTPUT),
                'SYSTEM_x' => new overcast.FieldInfo('SYSTEM_x', 'Logical system', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT)
            }
        ),
        'WEBINVOICEDOCUMENT' => new overcast.TypeInfo('WEBINVOICEDOCUMENT', 'Billing document', overcast.Realtime.StructureType.STRUCTURE, overcast.Realtime.Direction.OUTPUT,
            new Map<String, overcast.FieldInfo> {
                'BILLINGDOC' => new overcast.FieldInfo('BILLINGDOC', 'Billing Doc.', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT),
                'BILL_TYPE' => new overcast.FieldInfo('BILL_TYPE', 'Billing Type', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'BILL_TYPE_TEXT' => new overcast.FieldInfo('BILL_TYPE_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.OUTPUT),
                'BILLCATEG' => new overcast.FieldInfo('BILLCATEG', 'BillingCategory', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'BILLCATEG_TEXT' => new overcast.FieldInfo('BILLCATEG_TEXT', 'Short text', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.OUTPUT),
                'SD_DOC_CAT' => new overcast.FieldInfo('SD_DOC_CAT', 'Document cat.', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'SD_DOC_CAT_TEXT' => new overcast.FieldInfo('SD_DOC_CAT_TEXT', 'Short text', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.OUTPUT),
                'CURRENCY_x' => new overcast.FieldInfo('CURRENCY_x', 'Doc. Currency', overcast.Realtime.ApexType.STRINGX, 5, overcast.Realtime.Direction.OUTPUT),
                'CURRENCY_ISO' => new overcast.FieldInfo('CURRENCY_ISO', 'ISO Code', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.OUTPUT),
                'NET_VALUE' => new overcast.FieldInfo('NET_VALUE', 'Net Value', overcast.Realtime.ApexType.DECIMALX, 15,2, overcast.Realtime.Direction.OUTPUT),
                'SOLD_TO' => new overcast.FieldInfo('SOLD_TO', 'Sold-To Party', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT),
                'PAYER' => new overcast.FieldInfo('PAYER', 'Payer', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.OUTPUT),
                'TAX_AMOUNT' => new overcast.FieldInfo('TAX_AMOUNT', 'Tax Amount', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.OUTPUT),
                'CANCELLED' => new overcast.FieldInfo('CANCELLED', 'Canceled', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.OUTPUT),
                'BILL_DATE' => new overcast.FieldInfo('BILL_DATE', 'Billing Date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMS1' => new overcast.FieldInfo('INCOTERMS1', 'Incoterms', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMS1_TEXT' => new overcast.FieldInfo('INCOTERMS1_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMS2' => new overcast.FieldInfo('INCOTERMS2', 'Incoterms 2', overcast.Realtime.ApexType.STRINGX, 28, overcast.Realtime.Direction.OUTPUT),
                'PMNTTRMS' => new overcast.FieldInfo('PMNTTRMS', 'Payt terms', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'PMNTTRMS_TEXT' => new overcast.FieldInfo('PMNTTRMS_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.OUTPUT),
                'COMP_CODE' => new overcast.FieldInfo('COMP_CODE', 'Company Code', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'COMP_NAME' => new overcast.FieldInfo('COMP_NAME', 'Company Name', overcast.Realtime.ApexType.STRINGX, 25, overcast.Realtime.Direction.OUTPUT),
                'REFERENCE' => new overcast.FieldInfo('REFERENCE', 'Reference no.', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.OUTPUT),
                'BLINE_DATE' => new overcast.FieldInfo('BLINE_DATE', 'Baseline Date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'DSCT_DATE1' => new overcast.FieldInfo('DSCT_DATE1', 'Cash discount 1', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'DSCT_DATE2' => new overcast.FieldInfo('DSCT_DATE2', 'Cash discount 2', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'NET_DATE' => new overcast.FieldInfo('NET_DATE', 'Net date', overcast.Realtime.ApexType.DATEX, 8, overcast.Realtime.Direction.OUTPUT),
                'DSCT_PCT1' => new overcast.FieldInfo('DSCT_PCT1', 'Disc.percent 1', overcast.Realtime.ApexType.DECIMALX, 5,3, overcast.Realtime.Direction.OUTPUT),
                'DSCT_PCT2' => new overcast.FieldInfo('DSCT_PCT2', 'Disc.percent 2', overcast.Realtime.ApexType.DECIMALX, 5,3, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMSV' => new overcast.FieldInfo('INCOTERMSV', 'Inco. Version', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMS2L' => new overcast.FieldInfo('INCOTERMS2L', 'Inco. Location1', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMS3L' => new overcast.FieldInfo('INCOTERMS3L', 'Inco. Location2', overcast.Realtime.ApexType.STRINGX, 70, overcast.Realtime.Direction.OUTPUT),
                'SD_DOC_CAT_LONG' => new overcast.FieldInfo('SD_DOC_CAT_LONG', 'Document Cat.', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.OUTPUT),
                'INCOTERMSV_TEXT' => new overcast.FieldInfo('INCOTERMSV_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.OUTPUT)
            }
        ),
        'WEBINVOICEITEMS' => new overcast.TypeInfo('WEBINVOICEITEMS', 'Items for Billing Document', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'BILLINGDOC' => new overcast.FieldInfo('BILLINGDOC', 'Billing Doc.', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'ITEM_NUMBER' => new overcast.FieldInfo('ITEM_NUMBER', 'Item', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'HG_LV_ITEM' => new overcast.FieldInfo('HG_LV_ITEM', 'Higher-Lev.Item', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'INV_QTY' => new overcast.FieldInfo('INV_QTY', 'Billed qty', overcast.Realtime.ApexType.DECIMALX, 13,3, overcast.Realtime.Direction.BOTH),
                'SALES_UNIT' => new overcast.FieldInfo('SALES_UNIT', 'Sales unit', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'SALES_UNIT_ISO' => new overcast.FieldInfo('SALES_UNIT_ISO', 'Sales unit ISO', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'NETVAL_INV' => new overcast.FieldInfo('NETVAL_INV', 'Net Value', overcast.Realtime.ApexType.DECIMALX, 15,2, overcast.Realtime.Direction.BOTH),
                'REF_DOC_NUMBER' => new overcast.FieldInfo('REF_DOC_NUMBER', 'Reference Doc.', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'REF_DOC_ITEM' => new overcast.FieldInfo('REF_DOC_ITEM', 'Reference Item', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'REF_DOC_CAT' => new overcast.FieldInfo('REF_DOC_CAT', 'Prec.Doc.Categ.', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'REF_DOC_CAT_TEXT' => new overcast.FieldInfo('REF_DOC_CAT_TEXT', 'Short text', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.BOTH),
                'SD_DOC_NUMBER' => new overcast.FieldInfo('SD_DOC_NUMBER', 'Sales Document', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'SD_DOC_ITEM' => new overcast.FieldInfo('SD_DOC_ITEM', 'Item', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'SD_DOC_REF' => new overcast.FieldInfo('SD_DOC_REF', 'SalesDocumentRefer', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'SD_DOC_CAT' => new overcast.FieldInfo('SD_DOC_CAT', 'Document cat.', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'SD_DOC_CAT_TEXT' => new overcast.FieldInfo('SD_DOC_CAT_TEXT', 'Short text', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.BOTH),
                'MATERIAL' => new overcast.FieldInfo('MATERIAL', 'Material', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'SHORT_TEXT' => new overcast.FieldInfo('SHORT_TEXT', 'Item Descr.', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH),
                'ITEM_TYPE' => new overcast.FieldInfo('ITEM_TYPE', 'Item Type', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'ITEM_TYPE_TEXT' => new overcast.FieldInfo('ITEM_TYPE_TEXT', 'Short text', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.BOTH),
                'ITEM_CATEG' => new overcast.FieldInfo('ITEM_CATEG', 'Item category', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'ITEM_CATEG_TEXT' => new overcast.FieldInfo('ITEM_CATEG_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'DIVISION' => new overcast.FieldInfo('DIVISION', 'Division', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'DIVISION_TEXT' => new overcast.FieldInfo('DIVISION_TEXT', 'Name', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'PLANT' => new overcast.FieldInfo('PLANT', 'Plant', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'PLANT_NAME' => new overcast.FieldInfo('PLANT_NAME', 'Name 1', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.BOTH),
                'CASH_DISC' => new overcast.FieldInfo('CASH_DISC', 'Cash Discount', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'CSHDISCBAS' => new overcast.FieldInfo('CSHDISCBAS', 'Csh.Disc.Bas', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'RETURNS' => new overcast.FieldInfo('RETURNS', 'Returns', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'EAN_UPC' => new overcast.FieldInfo('EAN_UPC', 'EAN/UPC', overcast.Realtime.ApexType.STRINGX, 18, overcast.Realtime.Direction.BOTH),
                'TAXJURCODE' => new overcast.FieldInfo('TAXJURCODE', 'Tax Jur.', overcast.Realtime.ApexType.STRINGX, 15, overcast.Realtime.Direction.BOTH),
                'TAX_AMOUNT' => new overcast.FieldInfo('TAX_AMOUNT', 'Tax Amount', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'ITEM_TEXT' => new overcast.FieldInfo('ITEM_TEXT', 'Text', overcast.Realtime.ApexType.STRINGX, 50, overcast.Realtime.Direction.BOTH),
                'BRVAL_INV' => new overcast.FieldInfo('BRVAL_INV', 'Gross Value', overcast.Realtime.ApexType.DECIMALX, 15,2, overcast.Realtime.Direction.BOTH),
                'STVAL_INV' => new overcast.FieldInfo('STVAL_INV', 'Cost', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'COND_SUBTOTAL1' => new overcast.FieldInfo('COND_SUBTOTAL1', 'Subtotal 1', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'COND_SUBTOTAL2' => new overcast.FieldInfo('COND_SUBTOTAL2', 'Subtotal 2', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'COND_SUBTOTAL3' => new overcast.FieldInfo('COND_SUBTOTAL3', 'Subtotal 3', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'COND_SUBTOTAL4' => new overcast.FieldInfo('COND_SUBTOTAL4', 'Subtotal 4', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'COND_SUBTOTAL5' => new overcast.FieldInfo('COND_SUBTOTAL5', 'Subtotal 5', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'COND_SUBTOTAL6' => new overcast.FieldInfo('COND_SUBTOTAL6', 'Subtotal 6', overcast.Realtime.ApexType.DECIMALX, 13,2, overcast.Realtime.Direction.BOTH),
                'REF_DOC_CAT_LONG' => new overcast.FieldInfo('REF_DOC_CAT_LONG', 'Prec.Doc.Categ.', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'SD_DOC_CAT_LONG' => new overcast.FieldInfo('SD_DOC_CAT_LONG', 'Document Cat.', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'MATERIAL_LONG' => new overcast.FieldInfo('MATERIAL_LONG', 'Material', overcast.Realtime.ApexType.STRINGX, 40, overcast.Realtime.Direction.BOTH)
            }
        ),
        'WEBINVOICEPARTNERS' => new overcast.TypeInfo('WEBINVOICEPARTNERS', 'Partner Data and Addresses for Billing Document', overcast.Realtime.StructureType.TABLE, overcast.Realtime.Direction.BOTH,
            new Map<String, overcast.FieldInfo> {
                'PARTN_ROLE' => new overcast.FieldInfo('PARTN_ROLE', 'Partner Functn', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'PARTN_ROLE_TEXT' => new overcast.FieldInfo('PARTN_ROLE_TEXT', 'Name', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'CUSTOMER' => new overcast.FieldInfo('CUSTOMER', 'Customer', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'FORMOFADDR' => new overcast.FieldInfo('FORMOFADDR', 'Form of address', overcast.Realtime.ApexType.STRINGX, 15, overcast.Realtime.Direction.BOTH),
                'NAME' => new overcast.FieldInfo('NAME', 'Name', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'NAME_2' => new overcast.FieldInfo('NAME_2', 'Name 2', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'NAME_3' => new overcast.FieldInfo('NAME_3', 'Name 3', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'NAME_4' => new overcast.FieldInfo('NAME_4', 'Name 4', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'STREET' => new overcast.FieldInfo('STREET', 'Street', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'COUNTRY' => new overcast.FieldInfo('COUNTRY', 'Country', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'COUNTRY_ISO' => new overcast.FieldInfo('COUNTRY_ISO', 'Country ISO', overcast.Realtime.ApexType.STRINGX, 2, overcast.Realtime.Direction.BOTH),
                'POSTL_CODE' => new overcast.FieldInfo('POSTL_CODE', 'Postal Code', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'POBX_PCD' => new overcast.FieldInfo('POBX_PCD', 'PO Box PCode', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'POBX_CTY' => new overcast.FieldInfo('POBX_CTY', 'P.O.Box city', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'CITY' => new overcast.FieldInfo('CITY', 'City', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'DISTRICT' => new overcast.FieldInfo('DISTRICT', 'District', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH),
                'REGION' => new overcast.FieldInfo('REGION', 'Region', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'REGION_TEXT' => new overcast.FieldInfo('REGION_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'CITY_CODE' => new overcast.FieldInfo('CITY_CODE', 'City code', overcast.Realtime.ApexType.STRINGX, 4, overcast.Realtime.Direction.BOTH),
                'CITY_CODE_TEXT' => new overcast.FieldInfo('CITY_CODE_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'COUNTRY_CDE' => new overcast.FieldInfo('COUNTRY_CDE', 'County Code', overcast.Realtime.ApexType.STRINGX, 3, overcast.Realtime.Direction.BOTH),
                'COUNTRY_CDE_TEXT' => new overcast.FieldInfo('COUNTRY_CDE_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'PO_BOX' => new overcast.FieldInfo('PO_BOX', 'PO Box', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'TELEPHONE' => new overcast.FieldInfo('TELEPHONE', 'Telephone 1', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.BOTH),
                'TELEPHONE2' => new overcast.FieldInfo('TELEPHONE2', 'Telephone 2', overcast.Realtime.ApexType.STRINGX, 16, overcast.Realtime.Direction.BOTH),
                'TELEBOX' => new overcast.FieldInfo('TELEBOX', 'Telebox', overcast.Realtime.ApexType.STRINGX, 15, overcast.Realtime.Direction.BOTH),
                'FAX_NUMBER' => new overcast.FieldInfo('FAX_NUMBER', 'Fax Number', overcast.Realtime.ApexType.STRINGX, 31, overcast.Realtime.Direction.BOTH),
                'TELETEX' => new overcast.FieldInfo('TELETEX', 'Teletex', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.BOTH),
                'TELEX' => new overcast.FieldInfo('TELEX', 'Telex', overcast.Realtime.ApexType.STRINGX, 30, overcast.Realtime.Direction.BOTH),
                'TRANSPZONE' => new overcast.FieldInfo('TRANSPZONE', 'Transport Zone', overcast.Realtime.ApexType.STRINGX, 10, overcast.Realtime.Direction.BOTH),
                'TRANSPZONE_TEXT' => new overcast.FieldInfo('TRANSPZONE_TEXT', 'Description', overcast.Realtime.ApexType.STRINGX, 20, overcast.Realtime.Direction.BOTH),
                'HOUSE_NO' => new overcast.FieldInfo('HOUSE_NO', 'House number', overcast.Realtime.ApexType.STRINGX, 6, overcast.Realtime.Direction.BOTH),
                'GENDER' => new overcast.FieldInfo('GENDER', 'Gender', overcast.Realtime.ApexType.STRINGX, 1, overcast.Realtime.Direction.BOTH),
                'GENDER_TEXT' => new overcast.FieldInfo('GENDER_TEXT', 'Short text', overcast.Realtime.ApexType.STRINGX, 60, overcast.Realtime.Direction.BOTH),
                'NAME_LIST' => new overcast.FieldInfo('NAME_LIST', 'Name', overcast.Realtime.ApexType.STRINGX, 35, overcast.Realtime.Direction.BOTH)
            }
        )
    };
}