global with sharing class OvcSAPInvoiceDetailsZREPlugin implements overcast.ComponentPlugin {
    private overcast.sapInvoiceDetailPlugin stdPlugin;

    global OvcSAPInvoiceDetailsZREPlugin() {
        System.debug('OvcSAPInvoiceDetailsZREPlugin');
        stdPlugin = new overcast.sapInvoiceDetailPlugin();
    }

    global void beforeScenarioCall(
        Id recordId,
        Map<String, Object> referenceFieldValues,
        Map<String, Object> importParameters,
        Map<String, Object> settings
    ) {
        stdPlugin.beforeScenarioCall(recordId, referenceFieldValues, importParameters, settings);
    }

    global void afterScenarioCall(Map<String, Object> returnedData, overcast.ComponentDefinition.Component cmp, Map<String, Object> settings) {
        stdPlugin.afterScenarioCall(returnedData, cmp, settings);
        System.debug('customInvoiceDetailPlugin afterScenarioCall');
        System.debug(JSON.serializePretty(returnedData));

        /* Here create the return structures that the Order Poster needs, e.g. ORDER_HEADERS_OUT, ORDER_BUSINESS_OUT, ORDER_ITEMS_OUT, etc.
         * In clone mode, the Order Poster will copy the values from these structures (it assumes they are coming from BAPISDORDER_GETDETAILEDLIST)
         * to the BAPI_SALESORDER_CREATEFROMDAT2 structures it uses
         */
        Map<String, Object> salesOrderData = new Map<String, Object>{
            'ORDER_HEADERS_OUT' => new List<Object>(),
            'ORDER_PARTNERS_OUT' => new List<Object>(),
            'ORDER_ITEMS_OUT' => new List<Object>(),
            'ORDER_BUSINESS_OUT' => new List<Object>(),
            'ORDER_SCHEDULES_OUT' => new List<Object>(),
            'ORDER_CONDITIONS_OUT' => new List<Object>()
        };
        handleBusinessPartners(returnedData, salesOrderData);
        handleItems(returnedData, salesOrderData);
        handleHeader(returnedData, salesOrderData);
        returnedData.clear();
        returnedData.putAll(salesOrderData);
        System.debug('final returned data');
        System.debug(JSON.serializePretty(returnedData));
    }

    private void handleBusinessPartners(Map<String, Object> invoiceData, Map<String, Object> salesOrderData) {
        List<Object> invoicePartners = (List<Object>) invoiceData.get('WEBINVOICEPARTNERS');
        if (invoicePartners == null || salesOrderData == null) {
            return;
        }
        List<Object> salesOrderPartners = new List<Object>();
        Map<String, String> partnerConversion = new Map<String, String>{ 'AG' => 'SP', 'WE' => 'SH', 'RE' => 'BP', 'RG' => 'PY' };
        for (Object invoicePartner : invoicePartners) {
            Map<String, Object> invP = (Map<String, Object>) invoicePartner;
            String partRole = (String) invP.get('PARTN_ROLE');
            Object customer = invP.get('CUSTOMER');
            if (partRole == 'WE' && !salesOrderData.containsKey('ovc_SHIPINFO')) {
                salesOrderData.put('ovc_SHIPINFO', new Map<String, Object>{ 'SHIP_TO' => customer });
            }
            String convPartRole = partnerConversion.remove(partRole);
            if (String.isNotBlank(convPartRole)) {
                salesOrderPartners.add(new Map<String, Object>{ 'PARTN_ROLE' => convPartRole, 'CUSTOMER' => customer, 'ITM_NUMBER' => '000000' });
            }
        }
        salesOrderData.put('ORDER_PARTNERS_OUT', salesOrderPartners);
    }

    private void handleItems(Map<String, Object> invoiceData, Map<String, Object> salesOrderData) {
        List<Object> invoiceItems = (List<Object>) invoiceData.get('WEBINVOICEITEMS');
        if (invoiceItems == null || salesOrderData == null) {
            return;
        }
        List<Object> salesOrderItems = new List<Object>();
        Set<Object> salesOrders = new Set<Object>();
        for (Object invoiceItem : invoiceItems) {
            Map<String, Object> item = (Map<String, Object>) invoiceItem;
            salesOrderItems.add(
                new Map<String, Object>{
                    'MATERIAL' => item.get('MATERIAL'),
                    'TARGET_QTY' => item.get('INV_QTY'),
                    'ITM_NUMBER' => item.get('ITEM_NUMBER'),
                    'PLANT' => item.get('PLANT'),
                    'DIVISION' => item.get('DIVISION'),
                    'REF_DOC' => item.get('BILLINGDOC'),
                    'REF_DOC_IT' => item.get('ITEM_NUMBER'),
                    'REF_DOC_CA' => 'M'
                }
            );
        }
        salesOrderData.put('ORDER_ITEMS_OUT', salesOrderItems);
    }

    private void handleHeader(Map<String, Object> invoiceData, Map<String, Object> salesOrderData) {
        Map<String, Object> header = (Map<String, Object>) invoiceData.get('WEBINVOICEDOCUMENT');
        if (header == null || salesOrderData == null) {
            return;
        }
        Map<String, Object> salesOrderHeader = new Map<String, Object>{ 'DOC_TYPE' => 'ZRE', 'PURCH_NO_C' => header.get('BILLINGDOC') };
        Map<String, Object> salesOrderBusiness = new Map<String, Object>{
            'PMNTTRMS' => header.get('PMNTTRMS'),
            'INCOTERMS1' => header.get('INCOTERMS1')
        };
        salesOrderData.put('ORDER_HEADERS_OUT', new List<Object>{ salesOrderHeader });
        salesOrderData.put('ORDER_BUSINESS_OUT', new List<Object>{ salesOrderBusiness });
    }
}