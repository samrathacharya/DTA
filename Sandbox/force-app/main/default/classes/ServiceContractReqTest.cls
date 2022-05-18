/* 
 * Generated by Overcast UTC 2022-01-23 12:16:25Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class ServiceContractReqTest {
    @istest
    private static void testServiceContractReq() {
        ServiceContractReq actual = new ServiceContractReq();
        system.assertNotEquals(null, actual.ServiceContractRequest);
        system.assertEquals(null, actual.WSAddressing);
    }

    @istest
    private static void testServiceContractRequestMessage() {
        ServiceContractReq.ServiceContractRequestMessage actual = new ServiceContractReq.ServiceContractRequestMessage();


        ServiceContractReq.ServiceContractRequestMessage actual0 = new ServiceContractReq.ServiceContractRequestMessage();
    }
    @istest
    private static void testBusinessDocumentMessageHeader() {
        ServiceContractReq.BusinessDocumentMessageHeader actual = new ServiceContractReq.BusinessDocumentMessageHeader(Datetime.newInstance(2000,1,1),true,true,'a','a');

        system.assertEquals(Datetime.newInstance(2000,1,1), actual.CreationDateTime);
        system.assertEquals(true, actual.TestDataIndicator);
        system.assertEquals(true, actual.ReconciliationIndicator);
        system.assertEquals('a', actual.SenderBusinessSystemID);
        system.assertEquals('a', actual.RecipientBusinessSystemID);

        ServiceContractReq.BusinessDocumentMessageHeader actual0 = new ServiceContractReq.BusinessDocumentMessageHeader();
    }
    @istest
    private static void testBusinessDocumentMessageID() {
        ServiceContractReq.BusinessDocumentMessageID actual = new ServiceContractReq.BusinessDocumentMessageID('a','a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);
        system.assertEquals('a', actual.schemeAgencySchemeAgencyID);

        ServiceContractReq.BusinessDocumentMessageID actual0 = new ServiceContractReq.BusinessDocumentMessageID();
    }
    @istest
    private static void testUUID() {
        ServiceContractReq.UUID actual = new ServiceContractReq.UUID('a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.UUID actual0 = new ServiceContractReq.UUID();
    }
    @istest
    private static void testBusinessDocumentMessageHeaderParty() {
        ServiceContractReq.BusinessDocumentMessageHeaderParty actual = new ServiceContractReq.BusinessDocumentMessageHeaderParty();


        ServiceContractReq.BusinessDocumentMessageHeaderParty actual0 = new ServiceContractReq.BusinessDocumentMessageHeaderParty();
    }
    @istest
    private static void testPartyInternalID() {
        ServiceContractReq.PartyInternalID actual = new ServiceContractReq.PartyInternalID('a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.PartyInternalID actual0 = new ServiceContractReq.PartyInternalID();
    }
    @istest
    private static void testBusinessDocumentMessageHeaderPartyContactPerson() {
        ServiceContractReq.BusinessDocumentMessageHeaderPartyContactPerson actual = new ServiceContractReq.BusinessDocumentMessageHeaderPartyContactPerson('a','a');

        system.assertEquals('a', actual.OrganisationFormattedName);
        system.assertEquals('a', actual.PersonFormattedName);

        ServiceContractReq.BusinessDocumentMessageHeaderPartyContactPerson actual0 = new ServiceContractReq.BusinessDocumentMessageHeaderPartyContactPerson();
    }
    @istest
    private static void testContactPersonInternalID() {
        ServiceContractReq.ContactPersonInternalID actual = new ServiceContractReq.ContactPersonInternalID('a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.ContactPersonInternalID actual0 = new ServiceContractReq.ContactPersonInternalID();
    }
    @istest
    private static void testPhoneNumber() {
        ServiceContractReq.PhoneNumber actual = new ServiceContractReq.PhoneNumber('a','a','a','a','a');

        system.assertEquals('a', actual.AreaID);
        system.assertEquals('a', actual.SubscriberID);
        system.assertEquals('a', actual.ExtensionID);
        system.assertEquals('a', actual.CountryCode);
        system.assertEquals('a', actual.CountryDiallingCode);

        ServiceContractReq.PhoneNumber actual0 = new ServiceContractReq.PhoneNumber();
    }
    @istest
    private static void testMEDIUM_Name() {
        ServiceContractReq.MEDIUM_Name actual = new ServiceContractReq.MEDIUM_Name('a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.languageCode);

        ServiceContractReq.MEDIUM_Name actual0 = new ServiceContractReq.MEDIUM_Name();
    }
    @istest
    private static void testEmailURI() {
        ServiceContractReq.EmailURI actual = new ServiceContractReq.EmailURI('a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);

        ServiceContractReq.EmailURI actual0 = new ServiceContractReq.EmailURI();
    }
    @istest
    private static void testPartyStandardID() {
        ServiceContractReq.PartyStandardID actual = new ServiceContractReq.PartyStandardID('a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.PartyStandardID actual0 = new ServiceContractReq.PartyStandardID();
    }
    @istest
    private static void testBusinessScope() {
        ServiceContractReq.BusinessScope actual = new ServiceContractReq.BusinessScope();


        ServiceContractReq.BusinessScope actual0 = new ServiceContractReq.BusinessScope();
    }
    @istest
    private static void testBusinessScopeTypeCode() {
        ServiceContractReq.BusinessScopeTypeCode actual = new ServiceContractReq.BusinessScopeTypeCode('a','a','a','a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.listID);
        system.assertEquals('a', actual.listVersionID);
        system.assertEquals('a', actual.listAgencyID);
        system.assertEquals('a', actual.listAgencySchemeID);
        system.assertEquals('a', actual.listAgencySchemeAgencyID);

        ServiceContractReq.BusinessScopeTypeCode actual0 = new ServiceContractReq.BusinessScopeTypeCode();
    }
    @istest
    private static void testBusinessScopeInstanceID() {
        ServiceContractReq.BusinessScopeInstanceID actual = new ServiceContractReq.BusinessScopeInstanceID('a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.BusinessScopeInstanceID actual0 = new ServiceContractReq.BusinessScopeInstanceID();
    }
    @istest
    private static void testBusinessScopeID() {
        ServiceContractReq.BusinessScopeID actual = new ServiceContractReq.BusinessScopeID('a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.BusinessScopeID actual0 = new ServiceContractReq.BusinessScopeID();
    }
    @istest
    private static void testServiceContractRequest() {
        ServiceContractReq.ServiceContractRequest actual = new ServiceContractReq.ServiceContractRequest('a','a',Datetime.newInstance(2000,1,1),'a',Date.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),'a','a','a','a');

        system.assertEquals('a', actual.ServiceContractType);
        system.assertEquals('a', actual.ServiceContractCanclnParty);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SrvcContrCancellationDateTime);
        system.assertEquals('a', actual.PurchaseOrderByCustomer);
        system.assertEquals(Date.newInstance(2000,1,1), actual.CustomerPurchaseOrderDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ServiceContractStartDateTime);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ServiceContractEndDateTime);
        system.assertEquals('a', actual.TransactionCurrency);
        system.assertEquals('a', actual.CustomerPaymentTerms);
        system.assertEquals('a', actual.VATRegistrationCountry);
        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.ServiceContractRequest actual0 = new ServiceContractReq.ServiceContractRequest();
    }
    @istest
    private static void testBusinessTransactionDocumentID() {
        ServiceContractReq.BusinessTransactionDocumentID actual = new ServiceContractReq.BusinessTransactionDocumentID('a','a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);
        system.assertEquals('a', actual.schemeAgencySchemeAgencyID);

        ServiceContractReq.BusinessTransactionDocumentID actual0 = new ServiceContractReq.BusinessTransactionDocumentID();
    }
    @istest
    private static void testSHORT_Description() {
        ServiceContractReq.SHORT_Description actual = new ServiceContractReq.SHORT_Description('a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.languageCode);

        ServiceContractReq.SHORT_Description actual0 = new ServiceContractReq.SHORT_Description();
    }
    @istest
    private static void testServiceContractStatusReq() {
        ServiceContractReq.ServiceContractStatusReq actual = new ServiceContractReq.ServiceContractStatusReq(true,true,true);

        system.assertEquals(true, actual.ServiceContractIsReleased);
        system.assertEquals(true, actual.ServiceContractIsCompleted);
        system.assertEquals(true, actual.ServiceContractIsCanceled);

        ServiceContractReq.ServiceContractStatusReq actual0 = new ServiceContractReq.ServiceContractStatusReq();
    }
    @istest
    private static void testCancellationReasonCode() {
        ServiceContractReq.CancellationReasonCode actual = new ServiceContractReq.CancellationReasonCode('a','a','a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.listVersionID);
        system.assertEquals('a', actual.listAgencyID);
        system.assertEquals('a', actual.listAgencySchemeID);
        system.assertEquals('a', actual.listAgencySchemeAgencyID);

        ServiceContractReq.CancellationReasonCode actual0 = new ServiceContractReq.CancellationReasonCode();
    }
    @istest
    private static void testServiceContractOrgUnitReq() {
        ServiceContractReq.ServiceContractOrgUnitReq actual = new ServiceContractReq.ServiceContractOrgUnitReq('a','a','a','a','a');

        system.assertEquals('a', actual.SalesOrganization);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.Division);
        system.assertEquals('a', actual.SalesOffice);
        system.assertEquals('a', actual.SalesGroup);

        ServiceContractReq.ServiceContractOrgUnitReq actual0 = new ServiceContractReq.ServiceContractOrgUnitReq();
    }
    @istest
    private static void testServiceContractOrgUnitInService() {
        ServiceContractReq.ServiceContractOrgUnitInService actual = new ServiceContractReq.ServiceContractOrgUnitInService('a','a','a','a','a','a');

        system.assertEquals('a', actual.SalesOrganizationOrgUnitID);
        system.assertEquals('a', actual.DistributionChannel);
        system.assertEquals('a', actual.Division);
        system.assertEquals('a', actual.SalesOfficeOrgUnitID);
        system.assertEquals('a', actual.SalesGroupOrgUnitID);
        system.assertEquals('a', actual.ServiceOrganization);

        ServiceContractReq.ServiceContractOrgUnitInService actual0 = new ServiceContractReq.ServiceContractOrgUnitInService();
    }
    @istest
    private static void testServiceContractPartnerReqHdr() {
        ServiceContractReq.ServiceContractPartnerReqHdr actual = new ServiceContractReq.ServiceContractPartnerReqHdr('a','a','a','a','a','a');

        system.assertEquals('a', actual.SoldToParty);
        system.assertEquals('a', actual.ShipToParty);
        system.assertEquals('a', actual.PersonResponsible);
        system.assertEquals('a', actual.BillToParty);
        system.assertEquals('a', actual.PayerParty);
        system.assertEquals('a', actual.ContactPerson);

        ServiceContractReq.ServiceContractPartnerReqHdr actual0 = new ServiceContractReq.ServiceContractPartnerReqHdr();
    }
    @istest
    private static void testTextCollectionIn() {

        ServiceContractReq.TextCollectionIn actual0 = new ServiceContractReq.TextCollectionIn();
    }
    @istest
    private static void testTextCollectionTextIn() {
        ServiceContractReq.TextCollectionTextIn actual = new ServiceContractReq.TextCollectionTextIn('a');

        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.TextCollectionTextIn actual0 = new ServiceContractReq.TextCollectionTextIn();
    }
    @istest
    private static void testTextCollectionTextTypeCode() {
        ServiceContractReq.TextCollectionTextTypeCode actual = new ServiceContractReq.TextCollectionTextTypeCode('a','a','a','a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.listID);
        system.assertEquals('a', actual.listVersionID);
        system.assertEquals('a', actual.listAgencyID);
        system.assertEquals('a', actual.listAgencySchemeID);
        system.assertEquals('a', actual.listAgencySchemeAgencyID);

        ServiceContractReq.TextCollectionTextTypeCode actual0 = new ServiceContractReq.TextCollectionTextTypeCode();
    }
    @istest
    private static void testText() {
        ServiceContractReq.Text actual = new ServiceContractReq.Text('a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.languageCode);

        ServiceContractReq.Text actual0 = new ServiceContractReq.Text();
    }
    @istest
    private static void testServiceContractRequestItem() {
        ServiceContractReq.ServiceContractRequestItem actual = new ServiceContractReq.ServiceContractRequestItem('a','a','a',true,true,true,'a',Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),'a','a','a',true,'a','a','a','a');

        system.assertEquals('a', actual.ServiceContractItem);
        system.assertEquals('a', actual.ServiceContractItemCategory);
        system.assertEquals('a', actual.Product);
        system.assertEquals(true, actual.ServiceContractItemIsReleased);
        system.assertEquals(true, actual.ServiceContractItemIsCompleted);
        system.assertEquals(true, actual.ServiceContractItemIsCanceled);
        system.assertEquals('a', actual.ServiceContractItemCanclnParty);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ServiceContractItemCanclnDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ServiceContrItemStartDateTime);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ServiceContrItemEndDateTime);
        system.assertEquals('a', actual.SettlementPeriodRule);
        system.assertEquals('a', actual.BillingPlanBillingDateRule);
        system.assertEquals('a', actual.BillingPlanPriceDateRule);
        system.assertEquals(true, actual.BillingPlanIsFinalized);
        system.assertEquals('a', actual.SrvcContrItemBillgBlockReason);
        system.assertEquals('a', actual.ReferenceServiceContractItem);
        system.assertEquals('a', actual.ReferenceServiceQtanItem);
        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.ServiceContractRequestItem actual0 = new ServiceContractReq.ServiceContractRequestItem();
    }
    @istest
    private static void testQuantity() {
        ServiceContractReq.Quantity actual = new ServiceContractReq.Quantity(0,'a');

        system.assertEquals(0, actual.value);
        system.assertEquals('a', actual.unitCode);

        ServiceContractReq.Quantity actual0 = new ServiceContractReq.Quantity();
    }
    @istest
    private static void testServiceContractPartnerReqItm() {
        ServiceContractReq.ServiceContractPartnerReqItm actual = new ServiceContractReq.ServiceContractPartnerReqItm('a','a','a','a','a');

        system.assertEquals('a', actual.ShipToParty);
        system.assertEquals('a', actual.PersonResponsible);
        system.assertEquals('a', actual.BillToParty);
        system.assertEquals('a', actual.PayerParty);
        system.assertEquals('a', actual.ContactPerson);

        ServiceContractReq.ServiceContractPartnerReqItm actual0 = new ServiceContractReq.ServiceContractPartnerReqItm();
    }
    @istest
    private static void testRenewPeriodDuration() {
        ServiceContractReq.RenewPeriodDuration actual = new ServiceContractReq.RenewPeriodDuration(0,'a');

        system.assertEquals(0, actual.value);
        system.assertEquals('a', actual.SrvcContrItemRnwlDurationUnit);

        ServiceContractReq.RenewPeriodDuration actual0 = new ServiceContractReq.RenewPeriodDuration();
    }
    @istest
    private static void testRenewExtensionDuration() {
        ServiceContractReq.RenewExtensionDuration actual = new ServiceContractReq.RenewExtensionDuration(0,'a');

        system.assertEquals(0, actual.value);
        system.assertEquals('a', actual.SrvcContrItemExtnDurationUnit);

        ServiceContractReq.RenewExtensionDuration actual0 = new ServiceContractReq.RenewExtensionDuration();
    }
    @istest
    private static void testProfitCentreID() {
        ServiceContractReq.ProfitCentreID actual = new ServiceContractReq.ProfitCentreID('a','a','a');

        system.assertEquals('a', actual.value);
        system.assertEquals('a', actual.schemeID);
        system.assertEquals('a', actual.schemeAgencyID);

        ServiceContractReq.ProfitCentreID actual0 = new ServiceContractReq.ProfitCentreID();
    }
    @istest
    private static void testVariantConfigurationSC() {

        ServiceContractReq.VariantConfigurationSC actual0 = new ServiceContractReq.VariantConfigurationSC();
    }
    @istest
    private static void testCharacteristicValuationSC() {
        ServiceContractReq.CharacteristicValuationSC actual = new ServiceContractReq.CharacteristicValuationSC('a','a');

        system.assertEquals('a', actual.Characteristic);
        system.assertEquals('a', actual.CharcValue);

        ServiceContractReq.CharacteristicValuationSC actual0 = new ServiceContractReq.CharacteristicValuationSC();
    }
    @istest
    private static void testPriceComponentReqItm() {
        ServiceContractReq.PriceComponentReqItm actual = new ServiceContractReq.PriceComponentReqItm('a',0,'a','a','a');

        system.assertEquals('a', actual.ConditionType);
        system.assertEquals(0, actual.ConditionRateValue);
        system.assertEquals('a', actual.ConditionCurrency);
        system.assertEquals('a', actual.VariantCondition);
        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.PriceComponentReqItm actual0 = new ServiceContractReq.PriceComponentReqItm();
    }
    @istest
    private static void testConditionQuantity() {
        ServiceContractReq.ConditionQuantity actual = new ServiceContractReq.ConditionQuantity(0,'a');

        system.assertEquals(0, actual.value);
        system.assertEquals('a', actual.unitCode);

        ServiceContractReq.ConditionQuantity actual0 = new ServiceContractReq.ConditionQuantity();
    }
    @istest
    private static void testBillingRequestItem_In() {
        ServiceContractReq.BillingRequestItem_In actual = new ServiceContractReq.BillingRequestItem_In(Datetime.newInstance(2000,1,1),0,Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),'a',Datetime.newInstance(2000,1,1),'a');

        system.assertEquals(Datetime.newInstance(2000,1,1), actual.BillgReqItemBillingDateTime);
        system.assertEquals(0, actual.BillgReqItemBillingValue);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SettlmtPeriodStartDate);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SettlmtPeriodEndDate);
        system.assertEquals('a', actual.BillingBlockReason);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.ServicesRenderedDateTime);
        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.BillingRequestItem_In actual0 = new ServiceContractReq.BillingRequestItem_In();
    }
    @istest
    private static void testPriceAdaptationEntry_In() {
        ServiceContractReq.PriceAdaptationEntry_In actual = new ServiceContractReq.PriceAdaptationEntry_In(Datetime.newInstance(2000,1,1),Datetime.newInstance(2000,1,1),'a',0,'a');

        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SettlementStartDateTime);
        system.assertEquals(Datetime.newInstance(2000,1,1), actual.SettlementEndDateTime);
        system.assertEquals('a', actual.ConditionType);
        system.assertEquals(0, actual.ConditionRateValue);
        system.assertEquals('a', actual.ConditionCurrency);

        ServiceContractReq.PriceAdaptationEntry_In actual0 = new ServiceContractReq.PriceAdaptationEntry_In();
    }
    @istest
    private static void testServiceContractObjectListReq() {
        ServiceContractReq.ServiceContractObjectListReq actual = new ServiceContractReq.ServiceContractObjectListReq('a','a','a','a');

        system.assertEquals('a', actual.Equipment);
        system.assertEquals('a', actual.Product);
        system.assertEquals('a', actual.ServiceRefFunctionalLocation);
        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.ServiceContractObjectListReq actual0 = new ServiceContractReq.ServiceContractObjectListReq();
    }
    @istest
    private static void testServiceContractProductListReq() {
        ServiceContractReq.ServiceContractProductListReq actual = new ServiceContractReq.ServiceContractProductListReq('a','a');

        system.assertEquals('a', actual.Product);
        system.assertEquals('a', actual.actionCode);

        ServiceContractReq.ServiceContractProductListReq actual0 = new ServiceContractReq.ServiceContractProductListReq();
    }
    @istest
    private static void testWSAddressing() {
        ServiceContractReq.WSAddressing actual = new ServiceContractReq.WSAddressing('a');

        system.assertEquals('a', actual.MessageID);

        ServiceContractReq.WSAddressing actual0 = new ServiceContractReq.WSAddressing();
    }

    @istest
    private static void testRun() {
        ServiceContractReq request = testSetup();
        ServiceContractReq response = request.run();
        system.assertEquals('a', response.ServiceContractRequest.MessageHeader.ID.value);
        string requestid = request.runAsync(null, null, new Continuation(10));
    }

    private static ServiceContractReq testSetup() {
        overcast.TestingUtilities.SetupTestEnvironment('ServiceContractReq');
        ServiceContractReq request = new ServiceContractReq();
        request.ServiceContractRequest.MessageHeader = new ServiceContractReq.BusinessDocumentMessageHeader();
        request.ServiceContractRequest.MessageHeader.ID = new ServiceContractReq.BusinessDocumentMessageID();
        request.ServiceContractRequest.MessageHeader.ID.value = 'a';

        string s = request.serialize();
        request.testResponse = '{"output":' + s + '}';
        return request;
    }


    @istest
    private static void testSerialize() {
        ServiceContractReq input = new ServiceContractReq();
        input.ServiceContractRequest.MessageHeader = new ServiceContractReq.BusinessDocumentMessageHeader();
        input.ServiceContractRequest.MessageHeader.ID = new ServiceContractReq.BusinessDocumentMessageID();
        input.ServiceContractRequest.MessageHeader.ID.value = 'a';
        ServiceContractReq actual = (ServiceContractReq)JSON.deserialize(input.serialize(), ServiceContractReq.class);
        system.assertEquals('a', actual.ServiceContractRequest.MessageHeader.ID.value);
    }

    @istest
    private static void testDeserialize() {
        ServiceContractReq output = new ServiceContractReq();
        output.ServiceContractRequest.MessageHeader = new ServiceContractReq.BusinessDocumentMessageHeader();
        output.ServiceContractRequest.MessageHeader.ID = new ServiceContractReq.BusinessDocumentMessageID();
        output.ServiceContractRequest.MessageHeader.ID.value = 'a';

        string s = output.serialize();
        ServiceContractReq actual = ServiceContractReq.deserialize('{"output":' + s + '}');
        system.assertEquals('a', actual.ServiceContractRequest.MessageHeader.ID.value);
    }

    @istest
    private static void testDeserializeError() {
        try {
            ServiceContractReq actual = ServiceContractReq.deserialize('{"error":["A test error"]}');
            system.assert(false, 'No exception thrown');
        }
        catch (ServiceContractReq.ServiceContractReqException e) {
            system.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        ServiceContractReq output = new ServiceContractReq();
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
        ServiceContractReq output = new ServiceContractReq();
        output.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        system.assertEquals(null, output.get('NOVAL'));
        map<string, object> sample1 = (map<string, object>)output.get('SAMPLE1');
        system.assertNotEquals(null, sample1);
        system.assertEquals('VALUE1', sample1.get('FIELD1'));

        overcast.Globals.IsOCF = true;
        ServiceContractReq output2 = new ServiceContractReq();
        output2.loadAsyncResponse('{"output":{"SAMPLE1":{"FIELD1":"VALUE1"}}}');
        overcast.Globals.IsOCF = false;
        system.assertEquals(null, output2.get('NOVAL'));
        map<string, object> sample2 = (map<string, object>)output2.get('SAMPLE1');
        system.assertNotEquals(null, sample2);
        system.assertEquals('VALUE1', sample2.get('FIELD1'));
    }

    @istest
    private static void testGetMetadata() {
        ServiceContractReq output = new ServiceContractReq();
        map<string, overcast.TypeInfo> metadata = output.getMetadata();
        
        set<string> keys = metadata.keySet();
        system.assert(keys.contains('ServiceContractRequest.MessageHeader'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.ID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.UUID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.ReferenceID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.ReferenceUUID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.InternalID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson.InternalID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson.PhoneNumber'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson.PhoneNumber.CountryName'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson.FaxNumber'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson.FaxNumber.CountryName'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.ContactPerson.EmailURI'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.SenderParty.StandardID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.InternalID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson.InternalID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson.PhoneNumber'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson.PhoneNumber.CountryName'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson.FaxNumber'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson.FaxNumber.CountryName'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.ContactPerson.EmailURI'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.RecipientParty.StandardID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.BusinessScope.TypeCode'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.BusinessScope.InstanceID'));
        system.assert(keys.contains('ServiceContractRequest.MessageHeader.BusinessScope.ID'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.ServiceContract'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.ServiceContractDescription'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.ServiceContractStatus'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.ServiceContrCancellationReason'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.OrgUnit'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.OrgUnitInService'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Partners'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.ReferenceServiceContract'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.ReferenceServiceQtan'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.TextCollection.Text'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.TextCollection.Text.TypeCode'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.TextCollection.Text.ContentText'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.Quantity'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.ServiceContractItemDescription'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.ServiceContractItmCanclnReason'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.TextCollection.Text'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.TextCollection.Text.TypeCode'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.TextCollection.Text.ContentText'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.Partners'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.SrvcContrItemRnwlDuration'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.SrvcContrItemExtensionDuration'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.ProfitCenter'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.VariantConfiguration.CharacteristicValuationSC'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.PriceComponent'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.PriceComponent.ConditionQuantity'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.BillingRequestItem'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.BillingRequestItem.BillgReqItemDescription'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.PriceAdaptationEntry'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.ServiceContractObjectList'));
        system.assert(keys.contains('ServiceContractRequest.ServiceContract.Item.ServiceContractProductList'));
        system.assert(keys.contains('WSAddressing'));
        
        overcast.TypeInfo first = metadata.get(output.getTopTypeName());
        system.assertNotEquals(null, first);
        system.assertEquals('BusinessDocumentMessageHeader', first.name);
        output.set('@prop1', 'a');
        output.set('@prop2.prop2-1', 'b');
        output.set('@prop2.prop2-2', 'c');
        system.assertEquals('a', output.get('@prop1'));
        system.assertEquals('b', output.get('@prop2.prop2-1'));
        system.assertEquals('c', output.get('@prop2.prop2-2'));
        system.assertEquals(null, output.get(null));
        system.assertEquals(null, output.get('@prop2.prop2-3'));
        system.assertEquals(null, output.get('@prop3'));
    }

}