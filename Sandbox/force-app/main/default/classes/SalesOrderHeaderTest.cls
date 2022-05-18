/* 
 * Generated by Overcast UTC 2022-02-08 03:06:29Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class SalesOrderHeaderTest {
    @istest
    private static void testSalesOrderHeader() {
        SalesOrderHeader actual = new SalesOrderHeader();
        system.assertNotEquals(null, actual.A_SalesOrder);
    }

    @istest
    private static void testA_SalesOrder() {
        SalesOrderHeader.A_SalesOrder actual = new SalesOrderHeader.A_SalesOrder('a','a','a','a','a','a','a','a','a',Datetime.newInstance(2000,1,1),'a',Datetime.newInstance(2000,1,1),'a','a',Datetime.newInstance(2000,1,1),'a','a','a',Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),0,'a','a',Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),'a',true,'a','a','a','a','a');

        actual.IncotermsTransferLocation = 'a';
        actual.IncotermsLocation1 = 'a';
        actual.IncotermsLocation2 = 'a';
        actual.IncotermsVersion = 'a';
        actual.CustomerPriceGroup = 'a';
        actual.PriceListType = 'a';
        actual.CustomerPaymentTerms = 'a';
        actual.PaymentMethod = 'a';
        actual.AssignmentReference = 'a';
        actual.ReferenceSDDocument = 'a';
        actual.ReferenceSDDocumentCategory = 'a';
        actual.AccountingDocExternalReference = 'a';
        actual.CustomerAccountAssignmentGroup = 'a';
        actual.AccountingExchangeRate = 0;
        actual.CustomerGroup = 'a';
        actual.AdditionalCustomerGroup1 = 'a';
        actual.AdditionalCustomerGroup2 = 'a';
        actual.AdditionalCustomerGroup3 = 'a';
        actual.AdditionalCustomerGroup4 = 'a';
        actual.AdditionalCustomerGroup5 = 'a';
        actual.SlsDocIsRlvtForProofOfDeliv = true;
        actual.CustomerTaxClassification1 = 'a';
        actual.CustomerTaxClassification2 = 'a';
        actual.CustomerTaxClassification3 = 'a';
        actual.CustomerTaxClassification4 = 'a';
        actual.CustomerTaxClassification5 = 'a';
        actual.CustomerTaxClassification6 = 'a';
        actual.CustomerTaxClassification7 = 'a';
        actual.CustomerTaxClassification8 = 'a';
        actual.CustomerTaxClassification9 = 'a';
        actual.TaxDepartureCountry = 'a';
        actual.VATRegistrationCountry = 'a';
        actual.SalesOrderApprovalReason = 'a';
        actual.SalesDocApprovalStatus = 'a';
        actual.OverallSDProcessStatus = 'a';
        actual.TotalCreditCheckStatus = 'a';
        actual.OverallTotalDeliveryStatus = 'a';
        actual.OverallSDDocumentRejectionSts = 'a';
        system.assertEquals('a', actual.SalesOrder);
        system.assertEquals('a', actual.SalesOrderType);
        system.assertEquals('a', actual.SalesOrganization);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.OrganizationDivision);
        system.assertEquals('a', actual.SalesGroup);
        system.assertEquals('a', actual.SalesOffice);
        system.assertEquals('a', actual.SalesDistrict);
        system.assertEquals('a', actual.SoldToParty);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CreationDate);
        system.assertEquals('a', actual.CreatedByUser);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.LastChangeDate);
        system.assertEquals('a', actual.SenderBusinessSystemName);
        system.assertEquals('a', actual.ExternalDocumentID);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.LastChangeDateTime);
        system.assertEquals('a', actual.PurchaseOrderByCustomer);
        system.assertEquals('a', actual.PurchaseOrderByShipToParty);
        system.assertEquals('a', actual.CustomerPurchaseOrderType);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CustomerPurchaseOrderDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SalesOrderDate);
        system.assertEquals(0, actual.TotalNetAmount);
        system.assertEquals('a', actual.TransactionCurrency);
        system.assertEquals('a', actual.SDDocumentReason);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.PricingDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.RequestedDeliveryDate);
        system.assertEquals('a', actual.ShippingCondition);
        system.assertEquals(true, actual.CompleteDeliveryIsDefined);
        system.assertEquals('a', actual.ShippingType);
        system.assertEquals('a', actual.HeaderBillingBlockReason);
        system.assertEquals('a', actual.DeliveryBlockReason);
        system.assertEquals('a', actual.DeliveryDateTypeRule);
        system.assertEquals('a', actual.IncotermsClassification);
        system.assertEquals('a', actual.IncotermsTransferLocation);
        system.assertEquals('a', actual.IncotermsLocation1);
        system.assertEquals('a', actual.IncotermsLocation2);
        system.assertEquals('a', actual.IncotermsVersion);
        system.assertEquals('a', actual.CustomerPriceGroup);
        system.assertEquals('a', actual.PriceListType);
        system.assertEquals('a', actual.CustomerPaymentTerms);
        system.assertEquals('a', actual.PaymentMethod);
        system.assertEquals('a', actual.AssignmentReference);
        system.assertEquals('a', actual.ReferenceSDDocument);
        system.assertEquals('a', actual.ReferenceSDDocumentCategory);
        system.assertEquals('a', actual.AccountingDocExternalReference);
        system.assertEquals('a', actual.CustomerAccountAssignmentGroup);
        system.assertEquals(0, actual.AccountingExchangeRate);
        system.assertEquals('a', actual.CustomerGroup);
        system.assertEquals('a', actual.AdditionalCustomerGroup1);
        system.assertEquals('a', actual.AdditionalCustomerGroup2);
        system.assertEquals('a', actual.AdditionalCustomerGroup3);
        system.assertEquals('a', actual.AdditionalCustomerGroup4);
        system.assertEquals('a', actual.AdditionalCustomerGroup5);
        system.assertEquals(true, actual.SlsDocIsRlvtForProofOfDeliv);
        system.assertEquals('a', actual.CustomerTaxClassification1);
        system.assertEquals('a', actual.CustomerTaxClassification2);
        system.assertEquals('a', actual.CustomerTaxClassification3);
        system.assertEquals('a', actual.CustomerTaxClassification4);
        system.assertEquals('a', actual.CustomerTaxClassification5);
        system.assertEquals('a', actual.CustomerTaxClassification6);
        system.assertEquals('a', actual.CustomerTaxClassification7);
        system.assertEquals('a', actual.CustomerTaxClassification8);
        system.assertEquals('a', actual.CustomerTaxClassification9);
        system.assertEquals('a', actual.TaxDepartureCountry);
        system.assertEquals('a', actual.VATRegistrationCountry);
        system.assertEquals('a', actual.SalesOrderApprovalReason);
        system.assertEquals('a', actual.SalesDocApprovalStatus);
        system.assertEquals('a', actual.OverallSDProcessStatus);
        system.assertEquals('a', actual.TotalCreditCheckStatus);
        system.assertEquals('a', actual.OverallTotalDeliveryStatus);
        system.assertEquals('a', actual.OverallSDDocumentRejectionSts);

        SalesOrderHeader.A_SalesOrder actual0 = new SalesOrderHeader.A_SalesOrder();
    }
    @istest
    private static void testrunQuery() {
        SalesOrderHeader request = testSetup();
        overcast.Query query1 = new overcast.Query();
        query1.limit_x = 10;
        query1.offset = 10;
        
        SalesOrderHeader response = request.runQuery(query1);
        system.assertEquals('a', response.A_SalesOrder[0].SalesOrder);
        string requestid = request.runQueryAsync(query1, null, null, new Continuation(10));
    }

    @istest
    private static void testrunInsert() {
        SalesOrderHeader request = testSetup();
        SalesOrderHeader response = request.runInsert();
        system.assertEquals('a', response.A_SalesOrder[0].SalesOrder);
        string requestid = request.runInsertAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunUpdate() {
        SalesOrderHeader request = testSetup();
        SalesOrderHeader response = request.runUpdate();
        system.assertEquals('a', response.A_SalesOrder[0].SalesOrder);
        string requestid = request.runUpdateAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunDelete() {
        SalesOrderHeader request = testSetup();
        SalesOrderHeader response = request.runDelete();
        system.assertEquals('a', response.A_SalesOrder[0].SalesOrder);
        string requestid = request.runDeleteAsync(null, null, new Continuation(10));
    }

    private static SalesOrderHeader testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('SalesOrderHeader');
        SalesOrderHeader request = new SalesOrderHeader();
        SalesOrderHeader.A_SalesOrder value1 = new SalesOrderHeader.A_SalesOrder();
        value1.SalesOrder = 'a';
        request.A_SalesOrder.add(value1);

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        SalesOrderHeader input = new SalesOrderHeader();
        SalesOrderHeader.A_SalesOrder value1 = new SalesOrderHeader.A_SalesOrder();
        value1.SalesOrder = 'a';
        input.A_SalesOrder.add(value1);
        SalesOrderHeader actual = (SalesOrderHeader)JSON.deserialize(input.serialize(), SalesOrderHeader.class);
        system.assertEquals('a', actual.A_SalesOrder[0].SalesOrder);
    }

    @istest
    private static void testDeserialize() {
        SalesOrderHeader output = new SalesOrderHeader();
        SalesOrderHeader.A_SalesOrder value1 = new SalesOrderHeader.A_SalesOrder();
        value1.SalesOrder = 'a';
        output.A_SalesOrder.add(value1);

        string s = output.serialize();
        SalesOrderHeader actual = SalesOrderHeader.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.A_SalesOrder[0].SalesOrder);
    }

    @istest
    private static void testDeserializeError() {
        try {
            SalesOrderHeader actual = SalesOrderHeader.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (SalesOrderHeader.SalesOrderHeaderException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        SalesOrderHeader output = new SalesOrderHeader();
        output.set('SAMPLE1', new map<string, object>{
            'FIELD1' => 'VALUE1'
        });
        
        system.assertEquals(null, output.get('NOVAL'));
        
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));		
    }
    
    @istest
    private static void testLoadAsyncResponse() {
        SalesOrderHeader output = new SalesOrderHeader();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        SalesOrderHeader output2 = new SalesOrderHeader();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        SalesOrderHeader output = new SalesOrderHeader();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('A_SalesOrder'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('A_SalesOrder', first.name);
    }

}