/* 
 * Generated by Overcast UTC 2022-01-14 06:51:19Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class zmtTestCustomerOdataTest {
    @istest
    private static void testzmtTestCustomerOdata() {
        zmtTestCustomerOdata actual = new zmtTestCustomerOdata();
        system.assertNotEquals(null, actual.A_Customer);
        system.assertNotEquals(null, actual.A_CustomerCompany);
        system.assertNotEquals(null, actual.A_CustomerCompanyText);
        system.assertNotEquals(null, actual.A_CustomerDunning);
        system.assertNotEquals(null, actual.A_CustomerWithHoldingTax);
        system.assertNotEquals(null, actual.A_CustomerSalesArea);
        system.assertNotEquals(null, actual.A_CustSalesPartnerFunc);
        system.assertNotEquals(null, actual.A_CustomerSalesAreaTax);
        system.assertNotEquals(null, actual.A_CustomerSalesAreaText);
        system.assertNotEquals(null, actual.A_CustomerTaxGrouping);
        system.assertNotEquals(null, actual.A_CustomerText);
    }

    @istest
    private static void testA_Customer() {
        zmtTestCustomerOdataA_Customer actual = new zmtTestCustomerOdataA_Customer();

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
        actual.to_CustomerCompany = 'a';
        actual.to_CustomerSalesArea = 'a';
        actual.to_CustomerTaxGrouping = 'a';
        actual.to_CustomerText = 'a';
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
        system.assertEquals('a', actual.to_CustomerCompany);
        system.assertEquals('a', actual.to_CustomerSalesArea);
        system.assertEquals('a', actual.to_CustomerTaxGrouping);
        system.assertEquals('a', actual.to_CustomerText);
    }
    @istest
    private static void testA_CustomerCompany() {
        zmtTestCustomerOdataA_CustomerCompany actual = new zmtTestCustomerOdataA_CustomerCompany();

        actual.Customer = 'a';
        actual.CompanyCode = 'a';
        actual.APARToleranceGroup = 'a';
        actual.AccountByCustomer = 'a';
        actual.AccountingClerk = 'a';
        actual.AccountingClerkFaxNumber = 'a';
        actual.AccountingClerkInternetAddress = 'a';
        actual.AccountingClerkPhoneNumber = 'a';
        actual.AlternativePayerAccount = 'a';
        actual.AuthorizationGroup = 'a';
        actual.CollectiveInvoiceVariant = 'a';
        actual.CustomerAccountNote = 'a';
        actual.CustomerHeadOffice = 'a';
        actual.CustomerSupplierClearingIsUsed = true;
        actual.HouseBank = 'a';
        actual.InterestCalculationCode = 'a';
        actual.InterestCalculationDate = Datetime.newInstance(2000,1,1);
        actual.IntrstCalcFrequencyInMonths = 'a';
        actual.IsToBeLocallyProcessed = true;
        actual.ItemIsToBePaidSeparately = true;
        actual.LayoutSortingRule = 'a';
        actual.PaymentBlockingReason = 'a';
        actual.PaymentMethodsList = 'a';
        actual.PaymentTerms = 'a';
        actual.PaytAdviceIsSentbyEDI = true;
        actual.PhysicalInventoryBlockInd = true;
        actual.ReconciliationAccount = 'a';
        actual.RecordPaymentHistoryIndicator = true;
        actual.UserAtCustomer = 'a';
        actual.DeletionIndicator = true;
        actual.CashPlanningGroup = 'a';
        actual.KnownOrNegotiatedLeave = 'a';
        actual.ValueAdjustmentKey = 'a';
        actual.CustomerAccountGroup = 'a';
        actual.to_CompanyText = 'a';
        actual.to_CustomerDunning = 'a';
        actual.to_WithHoldingTax = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.CompanyCode);
        system.assertEquals('a', actual.APARToleranceGroup);
        system.assertEquals('a', actual.AccountByCustomer);
        system.assertEquals('a', actual.AccountingClerk);
        system.assertEquals('a', actual.AccountingClerkFaxNumber);
        system.assertEquals('a', actual.AccountingClerkInternetAddress);
        system.assertEquals('a', actual.AccountingClerkPhoneNumber);
        system.assertEquals('a', actual.AlternativePayerAccount);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.CollectiveInvoiceVariant);
        system.assertEquals('a', actual.CustomerAccountNote);
        system.assertEquals('a', actual.CustomerHeadOffice);
        system.assertEquals(true, actual.CustomerSupplierClearingIsUsed);
        system.assertEquals('a', actual.HouseBank);
        system.assertEquals('a', actual.InterestCalculationCode);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.InterestCalculationDate);
        system.assertEquals('a', actual.IntrstCalcFrequencyInMonths);
        system.assertEquals(true, actual.IsToBeLocallyProcessed);
        system.assertEquals(true, actual.ItemIsToBePaidSeparately);
        system.assertEquals('a', actual.LayoutSortingRule);
        system.assertEquals('a', actual.PaymentBlockingReason);
        system.assertEquals('a', actual.PaymentMethodsList);
        system.assertEquals('a', actual.PaymentTerms);
        system.assertEquals(true, actual.PaytAdviceIsSentbyEDI);
        system.assertEquals(true, actual.PhysicalInventoryBlockInd);
        system.assertEquals('a', actual.ReconciliationAccount);
        system.assertEquals(true, actual.RecordPaymentHistoryIndicator);
        system.assertEquals('a', actual.UserAtCustomer);
        system.assertEquals(true, actual.DeletionIndicator);
        system.assertEquals('a', actual.CashPlanningGroup);
        system.assertEquals('a', actual.KnownOrNegotiatedLeave);
        system.assertEquals('a', actual.ValueAdjustmentKey);
        system.assertEquals('a', actual.CustomerAccountGroup);
        system.assertEquals('a', actual.to_CompanyText);
        system.assertEquals('a', actual.to_CustomerDunning);
        system.assertEquals('a', actual.to_WithHoldingTax);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerCompanyText() {
        zmtTestCustomerOdataACustomerCompanyText actual = new zmtTestCustomerOdataACustomerCompanyText();

        actual.Customer = 'a';
        actual.CompanyCode = 'a';
        actual.Language = 'a';
        actual.LongTextID = 'a';
        actual.LongText = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.CompanyCode);
        system.assertEquals('a', actual.Language);
        system.assertEquals('a', actual.LongTextID);
        system.assertEquals('a', actual.LongText);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerDunning() {
        zmtTestCustomerOdataA_CustomerDunning actual = new zmtTestCustomerOdataA_CustomerDunning();

        actual.Customer = 'a';
        actual.CompanyCode = 'a';
        actual.DunningArea = 'a';
        actual.DunningBlock = 'a';
        actual.DunningLevel = 'a';
        actual.DunningProcedure = 'a';
        actual.DunningRecipient = 'a';
        actual.LastDunnedOn = Datetime.newInstance(2000,1,1);
        actual.LegDunningProcedureOn = Datetime.newInstance(2000,1,1);
        actual.DunningClerk = 'a';
        actual.AuthorizationGroup = 'a';
        actual.CustomerAccountGroup = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.CompanyCode);
        system.assertEquals('a', actual.DunningArea);
        system.assertEquals('a', actual.DunningBlock);
        system.assertEquals('a', actual.DunningLevel);
        system.assertEquals('a', actual.DunningProcedure);
        system.assertEquals('a', actual.DunningRecipient);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.LastDunnedOn);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.LegDunningProcedureOn);
        system.assertEquals('a', actual.DunningClerk);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.CustomerAccountGroup);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerWithHoldingTax() {
        zmtTestCustomerOdataACustomerWithHolding actual = new zmtTestCustomerOdataACustomerWithHolding();

        actual.Customer = 'a';
        actual.CompanyCode = 'a';
        actual.WithholdingTaxType = 'a';
        actual.WithholdingTaxCode = 'a';
        actual.WithholdingTaxAgent = true;
        actual.ObligationDateBegin = Datetime.newInstance(2000,1,1);
        actual.ObligationDateEnd = Datetime.newInstance(2000,1,1);
        actual.WithholdingTaxNumber = 'a';
        actual.WithholdingTaxCertificate = 'a';
        actual.WithholdingTaxExmptPercent = 0;
        actual.ExemptionDateBegin = Datetime.newInstance(2000,1,1);
        actual.ExemptionDateEnd = Datetime.newInstance(2000,1,1);
        actual.ExemptionReason = 'a';
        actual.AuthorizationGroup = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.CompanyCode);
        system.assertEquals('a', actual.WithholdingTaxType);
        system.assertEquals('a', actual.WithholdingTaxCode);
        system.assertEquals(true, actual.WithholdingTaxAgent);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ObligationDateBegin);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ObligationDateEnd);
        system.assertEquals('a', actual.WithholdingTaxNumber);
        system.assertEquals('a', actual.WithholdingTaxCertificate);
        system.assertEquals(0, actual.WithholdingTaxExmptPercent);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ExemptionDateBegin);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ExemptionDateEnd);
        system.assertEquals('a', actual.ExemptionReason);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerSalesArea() {
        zmtTestCustomerOdataA_CustomerSalesArea actual = new zmtTestCustomerOdataA_CustomerSalesArea();

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
        actual.to_PartnerFunction = 'a';
        actual.to_SalesAreaTax = 'a';
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
        system.assertEquals('a', actual.to_PartnerFunction);
        system.assertEquals('a', actual.to_SalesAreaTax);
        system.assertEquals('a', actual.to_SalesAreaText);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustSalesPartnerFunc() {
        zmtTestCustomerOdataACustSalesPartnerFun actual = new zmtTestCustomerOdataACustSalesPartnerFun();

        actual.Customer = 'a';
        actual.SalesOrganization = 'a';
        actual.DistributionChannel = 'a';
        actual.Division = 'a';
        actual.PartnerCounter = 'a';
        actual.PartnerFunction = 'a';
        actual.BPCustomerNumber = 'a';
        actual.CustomerPartnerDescription = 'a';
        actual.DefaultPartner = true;
        actual.Supplier = 'a';
        actual.PersonnelNumber = 'a';
        actual.ContactPerson = 'a';
        actual.AuthorizationGroup = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.SalesOrganization);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.Division);
        system.assertEquals('a', actual.PartnerCounter);
        system.assertEquals('a', actual.PartnerFunction);
        system.assertEquals('a', actual.BPCustomerNumber);
        system.assertEquals('a', actual.CustomerPartnerDescription);
        system.assertEquals(true, actual.DefaultPartner);
        system.assertEquals('a', actual.Supplier);
        system.assertEquals('a', actual.PersonnelNumber);
        system.assertEquals('a', actual.ContactPerson);
        system.assertEquals('a', actual.AuthorizationGroup);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerSalesAreaTax() {
        zmtTestCustomerOdataACustomerSalesAreaTa actual = new zmtTestCustomerOdataACustomerSalesAreaTa();

        actual.Customer = 'a';
        actual.SalesOrganization = 'a';
        actual.DistributionChannel = 'a';
        actual.Division = 'a';
        actual.DepartureCountry = 'a';
        actual.CustomerTaxCategory = 'a';
        actual.CustomerTaxClassification = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.SalesOrganization);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.Division);
        system.assertEquals('a', actual.DepartureCountry);
        system.assertEquals('a', actual.CustomerTaxCategory);
        system.assertEquals('a', actual.CustomerTaxClassification);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerSalesAreaText() {
        zmtTestCustomerOdataACustomerSalesAreaTe actual = new zmtTestCustomerOdataACustomerSalesAreaTe();

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
    private static void testA_CustomerTaxGrouping() {
        zmtTestCustomerOdataACustomerTaxGrouping actual = new zmtTestCustomerOdataACustomerTaxGrouping();

        actual.Customer = 'a';
        actual.CustomerTaxGroupingCode = 'a';
        actual.CustTaxGrpExemptionCertificate = 'a';
        actual.CustTaxGroupExemptionRate = 0;
        actual.CustTaxGroupExemptionStartDate = Datetime.newInstance(2000,1,1);
        actual.CustTaxGroupExemptionEndDate = Datetime.newInstance(2000,1,1);
        actual.CustTaxGroupSubjectedStartDate = Datetime.newInstance(2000,1,1);
        actual.CustTaxGroupSubjectedEndDate = Datetime.newInstance(2000,1,1);
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.CustomerTaxGroupingCode);
        system.assertEquals('a', actual.CustTaxGrpExemptionCertificate);
        system.assertEquals(0, actual.CustTaxGroupExemptionRate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CustTaxGroupExemptionStartDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CustTaxGroupExemptionEndDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CustTaxGroupSubjectedStartDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CustTaxGroupSubjectedEndDate);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testA_CustomerText() {
        zmtTestCustomerOdataA_CustomerText actual = new zmtTestCustomerOdataA_CustomerText();

        actual.Customer = 'a';
        actual.Language = 'a';
        actual.LongTextID = 'a';
        actual.LongText = 'a';
        actual.OVC_FKEY = 'a';
        system.assertEquals('a', actual.Customer);
        system.assertEquals('a', actual.Language);
        system.assertEquals('a', actual.LongTextID);
        system.assertEquals('a', actual.LongText);
        system.assertEquals('a', actual.OVC_FKEY);
    }
    @istest
    private static void testrunQuery() {
        zmtTestCustomerOdata request = testSetup();
        overcast.Query query1 = new overcast.Query();
        query1.limit_x = 10;
        query1.offset = 10;
        
        zmtTestCustomerOdata response = request.runQuery(query1);
        system.assertEquals('a', response.A_Customer[0].Customer);
        string requestid = request.runQueryAsync(query1, null, null, new Continuation(10));
    }

    @istest
    private static void testrunInsert() {
        zmtTestCustomerOdata request = testSetup();
        zmtTestCustomerOdata response = request.runInsert();
        system.assertEquals('a', response.A_Customer[0].Customer);
        string requestid = request.runInsertAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunUpdate() {
        zmtTestCustomerOdata request = testSetup();
        zmtTestCustomerOdata response = request.runUpdate();
        system.assertEquals('a', response.A_Customer[0].Customer);
        string requestid = request.runUpdateAsync(null, null, new Continuation(10));
    }

    @istest
    private static void testrunDelete() {
        zmtTestCustomerOdata request = testSetup();
        zmtTestCustomerOdata response = request.runDelete();
        system.assertEquals('a', response.A_Customer[0].Customer);
        string requestid = request.runDeleteAsync(null, null, new Continuation(10));
    }

    private static zmtTestCustomerOdata testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('zmtTestCustomerOdata');
        zmtTestCustomerOdata request = new zmtTestCustomerOdata();
        zmtTestCustomerOdataA_Customer value1 = new zmtTestCustomerOdataA_Customer();
        value1.Customer = 'a';
        request.A_Customer.add(value1);

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        zmtTestCustomerOdata input = new zmtTestCustomerOdata();
        zmtTestCustomerOdataA_Customer value1 = new zmtTestCustomerOdataA_Customer();
        value1.Customer = 'a';
        input.A_Customer.add(value1);
        zmtTestCustomerOdata actual = (zmtTestCustomerOdata)JSON.deserialize(input.serialize(), zmtTestCustomerOdata.class);
        system.assertEquals('a', actual.A_Customer[0].Customer);
    }

    @istest
    private static void testDeserialize() {
        zmtTestCustomerOdata output = new zmtTestCustomerOdata();
        zmtTestCustomerOdataA_Customer value1 = new zmtTestCustomerOdataA_Customer();
        value1.Customer = 'a';
        output.A_Customer.add(value1);

        string s = output.serialize();
        zmtTestCustomerOdata actual = zmtTestCustomerOdata.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.A_Customer[0].Customer);
    }

    @istest
    private static void testDeserializeError() {
        try {
            zmtTestCustomerOdata actual = zmtTestCustomerOdata.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (zmtTestCustomerOdata.zmtTestCustomerOdataException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        zmtTestCustomerOdata output = new zmtTestCustomerOdata();
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
        zmtTestCustomerOdata output = new zmtTestCustomerOdata();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        zmtTestCustomerOdata output2 = new zmtTestCustomerOdata();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        zmtTestCustomerOdata output = new zmtTestCustomerOdata();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('A_Customer'));
        system.assert(keys.contains('A_CustomerCompany'));
        system.assert(keys.contains('A_CustomerCompanyText'));
        system.assert(keys.contains('A_CustomerDunning'));
        system.assert(keys.contains('A_CustomerWithHoldingTax'));
        system.assert(keys.contains('A_CustomerSalesArea'));
        system.assert(keys.contains('A_CustSalesPartnerFunc'));
        system.assert(keys.contains('A_CustomerSalesAreaTax'));
        system.assert(keys.contains('A_CustomerSalesAreaText'));
        system.assert(keys.contains('A_CustomerTaxGrouping'));
        system.assert(keys.contains('A_CustomerText'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('A_Customer', first.name);
    }

    
    @isTest
    static void testRunInvocableMethod() {
        overcast__Scenario__c scenario = overcast.TestingUtilities.setupTestEnvironment('zmtTestCustomerOdata');
        overcast__Run__c run = new overcast__Run__c(overcast__Scenario__c = scenario.Id, overcast__Mode__c = 'Run', overcast__Operation__c = 'Read', overcast__Input__c = 'X', overcast__Manual__c = true);
        insert run;
        zmtTestCustomerOdata.Parameters params = new zmtTestCustomerOdata.Parameters();
        params.flowInterviewGuid = 'X';
        params.query = new overcast.Query();
        params.requestData = new zmtTestCustomerOdata();
        params.operation = 'Query';
        params.Logger = null;
        params.doNotCommitLogs = false;
        params.testResponse = '{"output": ' + JSON.serialize(new zmtTestCustomerOdata()) + '}';
        List<zmtTestCustomerOdata.Parameters> paramList = new List<zmtTestCustomerOdata.Parameters>{ params };

        Test.startTest();
        List<zmtTestCustomerOdata.Result> results = zmtTestCustomerOdata.runInvocableMethod(paramList);
        Test.stopTest();

        System.assertEquals(1, results.size());
    }
}