/* 
 * Generated by Overcast UTC 2022-01-12 02:46:37Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class BusinessPartnerRTTest {
    @istest
    private static void testBusinessPartnerRT() {
        BusinessPartnerRT actual = new BusinessPartnerRT();
        system.assertNotEquals(null, actual.A_BusinessPartner);
        system.assertNotEquals(null, actual.A_BusinessPartnerRole);
        system.assertNotEquals(null, actual.A_Customer);
        system.assertNotEquals(null, actual.A_CustomerSalesArea);
        system.assertNotEquals(null, actual.A_CustomerSalesAreaText);
        system.assertNotEquals(null, actual.A_Supplier);
    }

    @istest
    private static void testA_BusinessPartner() {
        BusinessPartnerRTA_BusinessPartner actual = new BusinessPartnerRTA_BusinessPartner();

        actual.BusinessPartner = 'a';
        actual.Customer = 'a';
        actual.Supplier = 'a';
        actual.AcademicTitle = 'a';
        actual.AuthorizationGroup = 'a';
        actual.BusinessPartnerCategory = 'a';
        actual.BusinessPartnerFullName = 'a';
        actual.BusinessPartnerGrouping = 'a';
        actual.BusinessPartnerName = 'a';
        actual.BusinessPartnerUUID = 'a';
        actual.CorrespondenceLanguage = 'a';
        actual.CreatedByUser = 'a';
        actual.CreationDate = Datetime.newInstance(2000,1,1);
        actual.CreationTime = Time.newInstance(1,0,0,0);
        actual.FirstName = 'a';
        actual.FormOfAddress = 'a';
        actual.Industry = 'a';
        actual.InternationalLocationNumber1 = 'a';
        actual.InternationalLocationNumber2 = 'a';
        actual.IsFemale = true;
        actual.IsMale = true;
        actual.IsNaturalPerson = 'a';
        actual.IsSexUnknown = true;
        actual.GenderCodeName = 'a';
        actual.Language = 'a';
        actual.LastChangeDate = Datetime.newInstance(2000,1,1);
        actual.LastChangeTime = Time.newInstance(1,0,0,0);
        actual.LastChangedByUser = 'a';
        actual.LastName = 'a';
        actual.LegalForm = 'a';
        actual.OrganizationBPName1 = 'a';
        actual.OrganizationBPName2 = 'a';
        actual.OrganizationBPName3 = 'a';
        actual.OrganizationBPName4 = 'a';
        actual.OrganizationFoundationDate = Datetime.newInstance(2000,1,1);
        actual.OrganizationLiquidationDate = Datetime.newInstance(2000,1,1);
        actual.SearchTerm1 = 'a';
        actual.SearchTerm2 = 'a';
        actual.AdditionalLastName = 'a';
        actual.BirthDate = Datetime.newInstance(2000,1,1);
        actual.BusinessPartnerBirthDateStatus = 'a';
        actual.BusinessPartnerBirthplaceName = 'a';
        actual.BusinessPartnerIsBlocked = true;
        actual.BusinessPartnerType = 'a';
        actual.ETag = 'a';
        actual.GroupBusinessPartnerName1 = 'a';
        actual.GroupBusinessPartnerName2 = 'a';
        actual.IndependentAddressID = 'a';
        actual.InternationalLocationNumber3 = 'a';
        actual.MiddleName = 'a';
        actual.NameCountry = 'a';
        actual.NameFormat = 'a';
        actual.PersonFullName = 'a';
        actual.PersonNumber = 'a';
        actual.IsMarkedForArchiving = true;
        actual.BusinessPartnerIDByExtSystem = 'a';
        actual.TradingPartner = 'a';
        actual.to_BusinessPartnerRole = 'a';
        actual.to_Customer = 'a';
        actual.to_Supplier = 'a';
        system.assertEquals('a', actual.BusinessPartner);
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.Supplier);
        system.assertEquals('a', actual.AcademicTitle);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.BusinessPartnerCategory);
        system.assertEquals('a', actual.BusinessPartnerFullName);
        system.assertEquals('a', actual.BusinessPartnerGrouping);
        system.assertEquals('a', actual.BusinessPartnerName);
        system.assertEquals('a', actual.BusinessPartnerUUID);
        system.assertEquals('a', actual.CorrespondenceLanguage);
        system.assertEquals('a', actual.CreatedByUser);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CreationDate);
        system.assertEquals(Time.newInstance(1,0,0,0), actual.CreationTime);
        system.assertEquals('a', actual.FirstName);
        system.assertEquals('a', actual.FormOfAddress);
        system.assertEquals('a', actual.Industry);
        system.assertEquals('a', actual.InternationalLocationNumber1);
        system.assertEquals('a', actual.InternationalLocationNumber2);
        system.assertEquals(true, actual.IsFemale);
        system.assertEquals(true, actual.IsMale);
        system.assertEquals('a', actual.IsNaturalPerson);
        system.assertEquals(true, actual.IsSexUnknown);
        system.assertEquals('a', actual.GenderCodeName);
        system.assertEquals('a', actual.Language);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.LastChangeDate);
        system.assertEquals(Time.newInstance(1,0,0,0), actual.LastChangeTime);
        system.assertEquals('a', actual.LastChangedByUser);
        system.assertEquals('a', actual.LastName);
        system.assertEquals('a', actual.LegalForm);
        system.assertEquals('a', actual.OrganizationBPName1);
        system.assertEquals('a', actual.OrganizationBPName2);
        system.assertEquals('a', actual.OrganizationBPName3);
        system.assertEquals('a', actual.OrganizationBPName4);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.OrganizationFoundationDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.OrganizationLiquidationDate);
        system.assertEquals('a', actual.SearchTerm1);
        system.assertEquals('a', actual.SearchTerm2);
        system.assertEquals('a', actual.AdditionalLastName);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.BirthDate);
        system.assertEquals('a', actual.BusinessPartnerBirthDateStatus);
        system.assertEquals('a', actual.BusinessPartnerBirthplaceName);
        system.assertEquals(true, actual.BusinessPartnerIsBlocked);
        system.assertEquals('a', actual.BusinessPartnerType);
        system.assertEquals('a', actual.ETag);
        system.assertEquals('a', actual.GroupBusinessPartnerName1);
        system.assertEquals('a', actual.GroupBusinessPartnerName2);
        system.assertEquals('a', actual.IndependentAddressID);
        system.assertEquals('a', actual.InternationalLocationNumber3);
        system.assertEquals('a', actual.MiddleName);
        system.assertEquals('a', actual.NameCountry);
        system.assertEquals('a', actual.NameFormat);
        system.assertEquals('a', actual.PersonFullName);
        system.assertEquals('a', actual.PersonNumber);
        system.assertEquals(true, actual.IsMarkedForArchiving);
        system.assertEquals('a', actual.BusinessPartnerIDByExtSystem);
        system.assertEquals('a', actual.TradingPartner);
        system.assertEquals('a', actual.to_BusinessPartnerRole);
        system.assertEquals('a', actual.to_Customer);
        system.assertEquals('a', actual.to_Supplier);
    }
    @istest
    private static void testA_BusinessPartnerRole() {
        BusinessPartnerRTA_BusinessPartnerRole actual = new BusinessPartnerRTA_BusinessPartnerRole();

        actual.BusinessPartner = 'a';
        actual.BusinessPartnerRole = 'a';
        actual.ValidFrom = Datetime.newInstance(2000,1,1);
        actual.ValidTo = Datetime.newInstance(2000,1,1);
        actual.AuthorizationGroup = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.BusinessPartner);
        system.assertEquals('a', actual.BusinessPartnerRole);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ValidFrom);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ValidTo);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_Customer() {
        BusinessPartnerRTA_Customer actual = new BusinessPartnerRTA_Customer();

        actual.Customer = 'a';
        actual.AuthorizationGroup = 'a';
        actual.BillingIsBlockedForCustomer = 'a';
        actual.CreatedByUser = 'a';
        actual.CreationDate = Datetime.newInstance(2000,1,1);
        actual.CustomerAccountGroup = 'a';
        actual.CustomerClassification = 'a';
        actual.CustomerFullName = 'a';
        actual.CustomerName = 'a';
        actual.DeliveryIsBlocked = 'a';
        actual.NFPartnerIsNaturalPerson = 'a';
        actual.OrderIsBlockedForCustomer = 'a';
        actual.PostingIsBlocked = true;
        actual.Supplier = 'a';
        actual.CustomerCorporateGroup = 'a';
        actual.FiscalAddress = 'a';
        actual.Industry = 'a';
        actual.IndustryCode1 = 'a';
        actual.IndustryCode2 = 'a';
        actual.IndustryCode3 = 'a';
        actual.IndustryCode4 = 'a';
        actual.IndustryCode5 = 'a';
        actual.InternationalLocationNumber1 = 'a';
        actual.NielsenRegion = 'a';
        actual.ResponsibleType = 'a';
        actual.TaxNumber1 = 'a';
        actual.TaxNumber2 = 'a';
        actual.TaxNumber3 = 'a';
        actual.TaxNumber4 = 'a';
        actual.TaxNumber5 = 'a';
        actual.TaxNumberType = 'a';
        actual.VATRegistration = 'a';
        actual.DeletionIndicator = true;
        actual.to_CustomerSalesArea = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.BillingIsBlockedForCustomer);
        system.assertEquals('a', actual.CreatedByUser);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CreationDate);
        system.assertEquals('a', actual.CustomerAccountGroup);
        system.assertEquals('a', actual.CustomerClassification);
        system.assertEquals('a', actual.CustomerFullName);
        system.assertEquals('a', actual.CustomerName);
        system.assertEquals('a', actual.DeliveryIsBlocked);
        system.assertEquals('a', actual.NFPartnerIsNaturalPerson);
        system.assertEquals('a', actual.OrderIsBlockedForCustomer);
        system.assertEquals(true, actual.PostingIsBlocked);
        system.assertEquals('a', actual.Supplier);
        system.assertEquals('a', actual.CustomerCorporateGroup);
        system.assertEquals('a', actual.FiscalAddress);
        system.assertEquals('a', actual.Industry);
        system.assertEquals('a', actual.IndustryCode1);
        system.assertEquals('a', actual.IndustryCode2);
        system.assertEquals('a', actual.IndustryCode3);
        system.assertEquals('a', actual.IndustryCode4);
        system.assertEquals('a', actual.IndustryCode5);
        system.assertEquals('a', actual.InternationalLocationNumber1);
        system.assertEquals('a', actual.NielsenRegion);
        system.assertEquals('a', actual.ResponsibleType);
        system.assertEquals('a', actual.TaxNumber1);
        system.assertEquals('a', actual.TaxNumber2);
        system.assertEquals('a', actual.TaxNumber3);
        system.assertEquals('a', actual.TaxNumber4);
        system.assertEquals('a', actual.TaxNumber5);
        system.assertEquals('a', actual.TaxNumberType);
        system.assertEquals('a', actual.VATRegistration);
        system.assertEquals(true, actual.DeletionIndicator);
        system.assertEquals('a', actual.to_CustomerSalesArea);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerSalesArea() {
        BusinessPartnerRTA_CustomerSalesArea actual = new BusinessPartnerRTA_CustomerSalesArea();

        actual.Customer = 'a';
        actual.SalesOrganization = 'a';
        actual.DistributionChannel = 'a';
        actual.Division = 'a';
        actual.AccountByCustomer = 'a';
        actual.AuthorizationGroup = 'a';
        actual.BillingIsBlockedForCustomer = 'a';
        actual.CompleteDeliveryIsDefined = true;
        actual.Currency_x = 'a';
        actual.CustomerABCClassification = 'a';
        actual.CustomerAccountAssignmentGroup = 'a';
        actual.CustomerGroup = 'a';
        actual.CustomerPaymentTerms = 'a';
        actual.CustomerPriceGroup = 'a';
        actual.CustomerPricingProcedure = 'a';
        actual.DeliveryIsBlockedForCustomer = 'a';
        actual.DeliveryPriority = 'a';
        actual.IncotermsClassification = 'a';
        actual.IncotermsLocation2 = 'a';
        actual.IncotermsVersion = 'a';
        actual.IncotermsLocation1 = 'a';
        actual.DeletionIndicator = true;
        actual.IncotermsTransferLocation = 'a';
        actual.InvoiceDate = 'a';
        actual.ItemOrderProbabilityInPercent = 'a';
        actual.OrderCombinationIsAllowed = true;
        actual.OrderIsBlockedForCustomer = 'a';
        actual.PartialDeliveryIsAllowed = 'a';
        actual.PriceListType = 'a';
        actual.SalesGroup = 'a';
        actual.SalesOffice = 'a';
        actual.ShippingCondition = 'a';
        actual.SupplyingPlant = 'a';
        actual.SalesDistrict = 'a';
        actual.InvoiceListSchedule = 'a';
        actual.ExchangeRateType = 'a';
        actual.AdditionalCustomerGroup1 = 'a';
        actual.AdditionalCustomerGroup2 = 'a';
        actual.AdditionalCustomerGroup3 = 'a';
        actual.AdditionalCustomerGroup4 = 'a';
        actual.AdditionalCustomerGroup5 = 'a';
        actual.PaymentGuaranteeProcedure = 'a';
        actual.CustomerAccountGroup = 'a';
        actual.to_SalesAreaText = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.SalesOrganization);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.Division);
        system.assertEquals('a', actual.AccountByCustomer);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.BillingIsBlockedForCustomer);
        system.assertEquals(true, actual.CompleteDeliveryIsDefined);
        system.assertEquals('a', actual.Currency_x);
        system.assertEquals('a', actual.CustomerABCClassification);
        system.assertEquals('a', actual.CustomerAccountAssignmentGroup);
        system.assertEquals('a', actual.CustomerGroup);
        system.assertEquals('a', actual.CustomerPaymentTerms);
        system.assertEquals('a', actual.CustomerPriceGroup);
        system.assertEquals('a', actual.CustomerPricingProcedure);
        system.assertEquals('a', actual.DeliveryIsBlockedForCustomer);
        system.assertEquals('a', actual.DeliveryPriority);
        system.assertEquals('a', actual.IncotermsClassification);
        system.assertEquals('a', actual.IncotermsLocation2);
        system.assertEquals('a', actual.IncotermsVersion);
        system.assertEquals('a', actual.IncotermsLocation1);
        system.assertEquals(true, actual.DeletionIndicator);
        system.assertEquals('a', actual.IncotermsTransferLocation);
        system.assertEquals('a', actual.InvoiceDate);
        system.assertEquals('a', actual.ItemOrderProbabilityInPercent);
        system.assertEquals(true, actual.OrderCombinationIsAllowed);
        system.assertEquals('a', actual.OrderIsBlockedForCustomer);
        system.assertEquals('a', actual.PartialDeliveryIsAllowed);
        system.assertEquals('a', actual.PriceListType);
        system.assertEquals('a', actual.SalesGroup);
        system.assertEquals('a', actual.SalesOffice);
        system.assertEquals('a', actual.ShippingCondition);
        system.assertEquals('a', actual.SupplyingPlant);
        system.assertEquals('a', actual.SalesDistrict);
        system.assertEquals('a', actual.InvoiceListSchedule);
        system.assertEquals('a', actual.ExchangeRateType);
        system.assertEquals('a', actual.AdditionalCustomerGroup1);
        system.assertEquals('a', actual.AdditionalCustomerGroup2);
        system.assertEquals('a', actual.AdditionalCustomerGroup3);
        system.assertEquals('a', actual.AdditionalCustomerGroup4);
        system.assertEquals('a', actual.AdditionalCustomerGroup5);
        system.assertEquals('a', actual.PaymentGuaranteeProcedure);
        system.assertEquals('a', actual.CustomerAccountGroup);
        system.assertEquals('a', actual.to_SalesAreaText);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerSalesAreaText() {
        BusinessPartnerRTA_CustomerSalesAreaText actual = new BusinessPartnerRTA_CustomerSalesAreaText();

        actual.Customer = 'a';
        actual.SalesOrganization = 'a';
        actual.DistributionChannel = 'a';
        actual.Division = 'a';
        actual.Language = 'a';
        actual.LongTextID = 'a';
        actual.LongText = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.SalesOrganization);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.Division);
        system.assertEquals('a', actual.Language);
        system.assertEquals('a', actual.LongTextID);
        system.assertEquals('a', actual.LongText);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_Supplier() {
        BusinessPartnerRTA_Supplier actual = new BusinessPartnerRTA_Supplier();

        actual.Supplier = 'a';
        actual.AlternativePayeeAccountNumber = 'a';
        actual.AuthorizationGroup = 'a';
        actual.CreatedByUser = 'a';
        actual.CreationDate = Datetime.newInstance(2000,1,1);
        actual.Customer = 'a';
        actual.PaymentIsBlockedForSupplier = true;
        actual.PostingIsBlocked = true;
        actual.PurchasingIsBlocked = true;
        actual.SupplierAccountGroup = 'a';
        actual.SupplierFullName = 'a';
        actual.SupplierName = 'a';
        actual.VATRegistration = 'a';
        actual.BirthDate = Datetime.newInstance(2000,1,1);
        actual.ConcatenatedInternationalLocNo = 'a';
        actual.DeletionIndicator = true;
        actual.FiscalAddress = 'a';
        actual.Industry = 'a';
        actual.InternationalLocationNumber1 = 'a';
        actual.InternationalLocationNumber2 = 'a';
        actual.InternationalLocationNumber3 = 'a';
        actual.IsNaturalPerson = 'a';
        actual.ResponsibleType = 'a';
        actual.SuplrQltyInProcmtCertfnValidTo = Datetime.newInstance(2000,1,1);
        actual.SuplrQualityManagementSystem = 'a';
        actual.SupplierCorporateGroup = 'a';
        actual.SupplierProcurementBlock = 'a';
        actual.TaxNumber1 = 'a';
        actual.TaxNumber2 = 'a';
        actual.TaxNumber3 = 'a';
        actual.TaxNumber4 = 'a';
        actual.TaxNumber5 = 'a';
        actual.TaxNumberResponsible = 'a';
        actual.TaxNumberType = 'a';
        actual.SuplrProofOfDelivRlvtCode = 'a';
        actual.BR_TaxIsSplit = true;
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Supplier);
        system.assertEquals('a', actual.AlternativePayeeAccountNumber);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.CreatedByUser);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CreationDate);
        system.assertEquals('a', actual.Customer);
        system.assertEquals(true, actual.PaymentIsBlockedForSupplier);
        system.assertEquals(true, actual.PostingIsBlocked);
        system.assertEquals(true, actual.PurchasingIsBlocked);
        system.assertEquals('a', actual.SupplierAccountGroup);
        system.assertEquals('a', actual.SupplierFullName);
        system.assertEquals('a', actual.SupplierName);
        system.assertEquals('a', actual.VATRegistration);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.BirthDate);
        system.assertEquals('a', actual.ConcatenatedInternationalLocNo);
        system.assertEquals(true, actual.DeletionIndicator);
        system.assertEquals('a', actual.FiscalAddress);
        system.assertEquals('a', actual.Industry);
        system.assertEquals('a', actual.InternationalLocationNumber1);
        system.assertEquals('a', actual.InternationalLocationNumber2);
        system.assertEquals('a', actual.InternationalLocationNumber3);
        system.assertEquals('a', actual.IsNaturalPerson);
        system.assertEquals('a', actual.ResponsibleType);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SuplrQltyInProcmtCertfnValidTo);
        system.assertEquals('a', actual.SuplrQualityManagementSystem);
        system.assertEquals('a', actual.SupplierCorporateGroup);
        system.assertEquals('a', actual.SupplierProcurementBlock);
        system.assertEquals('a', actual.TaxNumber1);
        system.assertEquals('a', actual.TaxNumber2);
        system.assertEquals('a', actual.TaxNumber3);
        system.assertEquals('a', actual.TaxNumber4);
        system.assertEquals('a', actual.TaxNumber5);
        system.assertEquals('a', actual.TaxNumberResponsible);
        system.assertEquals('a', actual.TaxNumberType);
        system.assertEquals('a', actual.SuplrProofOfDelivRlvtCode);
        system.assertEquals(true, actual.BR_TaxIsSplit);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testrunQuery() {
        BusinessPartnerRT request = testSetup();
        overcast.Query query1 = new overcast.Query();
        query1.limit_x = 10;
        query1.offset = 10;
        
        BusinessPartnerRT response = request.runQuery(query1);
        system.assertEquals('a', response.A_BusinessPartner[0].BusinessPartner);
        string requestid = request.runQueryAsync(query1, null, null, new Continuation(10));
    }

    @istest
    private static void testrunInsert() {
        BusinessPartnerRT request = testSetup();
        BusinessPartnerRT response = request.runInsert();
        system.assertEquals('a', response.A_BusinessPartner[0].BusinessPartner);
        string requestid = request.runInsertAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunUpdate() {
        BusinessPartnerRT request = testSetup();
        BusinessPartnerRT response = request.runUpdate();
        system.assertEquals('a', response.A_BusinessPartner[0].BusinessPartner);
        string requestid = request.runUpdateAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunDelete() {
        BusinessPartnerRT request = testSetup();
        BusinessPartnerRT response = request.runDelete();
        system.assertEquals('a', response.A_BusinessPartner[0].BusinessPartner);
        string requestid = request.runDeleteAsync(null, null, new Continuation(10));
    }

    private static BusinessPartnerRT testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('BusinessPartnerRT');
        BusinessPartnerRT request = new BusinessPartnerRT();
        BusinessPartnerRTA_BusinessPartner value1 = new BusinessPartnerRTA_BusinessPartner();
        value1.BusinessPartner = 'a';
        request.A_BusinessPartner.add(value1);

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        BusinessPartnerRT input = new BusinessPartnerRT();
        BusinessPartnerRTA_BusinessPartner value1 = new BusinessPartnerRTA_BusinessPartner();
        value1.BusinessPartner = 'a';
        input.A_BusinessPartner.add(value1);
        BusinessPartnerRT actual = (BusinessPartnerRT)JSON.deserialize(input.serialize(), BusinessPartnerRT.class);
        system.assertEquals('a', actual.A_BusinessPartner[0].BusinessPartner);
    }

    @istest
    private static void testDeserialize() {
        BusinessPartnerRT output = new BusinessPartnerRT();
        BusinessPartnerRTA_BusinessPartner value1 = new BusinessPartnerRTA_BusinessPartner();
        value1.BusinessPartner = 'a';
        output.A_BusinessPartner.add(value1);

        string s = output.serialize();
        BusinessPartnerRT actual = BusinessPartnerRT.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.A_BusinessPartner[0].BusinessPartner);
    }

    @istest
    private static void testDeserializeError() {
        try {
            BusinessPartnerRT actual = BusinessPartnerRT.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (BusinessPartnerRT.BusinessPartnerRTException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        BusinessPartnerRT output = new BusinessPartnerRT();
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
        BusinessPartnerRT output = new BusinessPartnerRT();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        BusinessPartnerRT output2 = new BusinessPartnerRT();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        BusinessPartnerRT output = new BusinessPartnerRT();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('A_BusinessPartner'));
        system.assert(keys.contains('A_BusinessPartnerRole'));
        system.assert(keys.contains('A_Customer'));
        system.assert(keys.contains('A_CustomerSalesArea'));
        system.assert(keys.contains('A_CustomerSalesAreaText'));
        system.assert(keys.contains('A_Supplier'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('A_BusinessPartner', first.name);
    }

    
    @isTest
    static void testRunInvocableMethod() {
        overcast__Scenario__c scenario = overcast.TestingUtilities.setupTestEnvironment('BusinessPartnerRT');
        overcast__Run__c run = new overcast__Run__c(overcast__Scenario__c = scenario.Id, overcast__Mode__c = 'Run', overcast__Operation__c = 'Read', overcast__Input__c = 'X', overcast__Manual__c = true);
        insert run;
        BusinessPartnerRT.Parameters params = new BusinessPartnerRT.Parameters();
        params.flowInterviewGuid = 'X';
        params.query = new overcast.Query();
        params.requestData = new BusinessPartnerRT();
        params.operation = 'Query';
        params.Logger = null;
        params.doNotCommitLogs = false;
        params.testResponse = '{"output": ' + JSON.serialize(new BusinessPartnerRT()) + '}';
        List<BusinessPartnerRT.Parameters> paramList = new List<BusinessPartnerRT.Parameters>{ params };

        Test.startTest();
        List<BusinessPartnerRT.Result> results = BusinessPartnerRT.runInvocableMethod(paramList);
        Test.stopTest();

        System.assertEquals(1, results.size());
    }
}