//Generated by wsdl2apex

public class OvcServiceContractNotificationOut {
    public class ServiceContractConfirmationMessage {
        public OvcServiceContractNotification.BusinessDocumentMessageHeader MessageHeader;
        public OvcServiceContractNotificationOut.ServiceContractConfirmation ServiceContract;
        public OvcServiceContractNotification.Log Log;
        private String[] MessageHeader_type_info = new String[]{'MessageHeader','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContract_type_info = new String[]{'ServiceContract','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] Log_type_info = new String[]{'Log','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'MessageHeader','ServiceContract','Log'};
    }
    public class PersonResponsible_element {
        public String PersonResponsible;
        private String[] PersonResponsible_type_info = new String[]{'PersonResponsible','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'PersonResponsible'};
    }
    public class RenewPeriodDuration {
        public String SrvcContrItemRnwlDurationUnit;
        private String[] SrvcContrItemRnwlDurationUnit_att_info = new String[]{'SrvcContrItemRnwlDurationUnit'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ServiceContractProductList {
        public String Product;
        private String[] Product_type_info = new String[]{'Product','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'Product'};
    }
    public class Quantity {
        public String unitCode;
        private String[] unitCode_att_info = new String[]{'unitCode'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ReferenceDocumentID {
        public String schemeID;
        public String schemeAgencyID;
        public String schemeAgencySchemeAgencyID;
        private String[] schemeID_att_info = new String[]{'schemeID'};
        private String[] schemeAgencyID_att_info = new String[]{'schemeAgencyID'};
        private String[] schemeAgencySchemeAgencyID_att_info = new String[]{'schemeAgencySchemeAgencyID'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ConditionQuantity {
        public String unitCode;
        private String[] unitCode_att_info = new String[]{'unitCode'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ServiceContractConfirmation {
        public OvcServiceContractNotificationOut.BusinessTransactionDocumentID_Out ServiceContract;
        public String ServiceContractType;
        public OvcServiceContractNotification.SHORT_Description ServiceContractDescription;
        public OvcServiceContractNotificationOut.ServiceContractStatus ServiceContractStatus;
        public String ServiceContractCanclnParty;
        public OvcServiceContractNotificationOut.CancellationReasonCode_Out ServiceContrCancellationReason;
        public String SrvcContrCancellationDateTime;
        public String PurchaseOrderByCustomer;
        public String CustomerPurchaseOrderDate;
        public OvcServiceContractNotificationOut.ServiceContractOrgUnit OrgUnit;
        public OvcServiceContractNotificationOut.ServiceContractOrgUnitInService OrgUnitInService;
        public OvcServiceContractNotificationOut.ServiceContractPartnerConfHdr Partners;
        public String ServiceContractStartDateTime;
        public String ServiceContractEndDateTime;
        public OvcServiceContractNotificationOut.ReferenceDocumentID ReferenceServiceContract;
        public OvcServiceContractNotificationOut.ReferenceDocumentID ReferenceServiceQtan;
        public String TransactionCurrency;
        public String PricingDate;
        public OvcServiceContractNotificationOut.TextCollectionOut TextCollection;
        public String CustomerPaymentTerms;
        public OvcServiceContractNotificationOut.ServiceContractConfirmationItem[] Item;
        private String[] ServiceContract_type_info = new String[]{'ServiceContract','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractType_type_info = new String[]{'ServiceContractType','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractDescription_type_info = new String[]{'ServiceContractDescription','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractStatus_type_info = new String[]{'ServiceContractStatus','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractCanclnParty_type_info = new String[]{'ServiceContractCanclnParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContrCancellationReason_type_info = new String[]{'ServiceContrCancellationReason','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] SrvcContrCancellationDateTime_type_info = new String[]{'SrvcContrCancellationDateTime','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PurchaseOrderByCustomer_type_info = new String[]{'PurchaseOrderByCustomer','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] CustomerPurchaseOrderDate_type_info = new String[]{'CustomerPurchaseOrderDate','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] OrgUnit_type_info = new String[]{'OrgUnit','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] OrgUnitInService_type_info = new String[]{'OrgUnitInService','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] Partners_type_info = new String[]{'Partners','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractStartDateTime_type_info = new String[]{'ServiceContractStartDateTime','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractEndDateTime_type_info = new String[]{'ServiceContractEndDateTime','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ReferenceServiceContract_type_info = new String[]{'ReferenceServiceContract','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ReferenceServiceQtan_type_info = new String[]{'ReferenceServiceQtan','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] TransactionCurrency_type_info = new String[]{'TransactionCurrency','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PricingDate_type_info = new String[]{'PricingDate','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] TextCollection_type_info = new String[]{'TextCollection','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] CustomerPaymentTerms_type_info = new String[]{'CustomerPaymentTerms','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] Item_type_info = new String[]{'Item','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'ServiceContract','ServiceContractType','ServiceContractDescription','ServiceContractStatus','ServiceContractCanclnParty','ServiceContrCancellationReason','SrvcContrCancellationDateTime','PurchaseOrderByCustomer','CustomerPurchaseOrderDate','OrgUnit','OrgUnitInService','Partners','ServiceContractStartDateTime','ServiceContractEndDateTime','ReferenceServiceContract','ReferenceServiceQtan','TransactionCurrency','PricingDate','TextCollection','CustomerPaymentTerms','Item'};
    }
    public class TextCollectionOut {
        public OvcServiceContractNotificationOut.TextCollectionTextOut[] Text;
        private String[] Text_type_info = new String[]{'Text','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'Text'};
    }
    public class Amount_Out {
        public String currencyCode;
        private String[] currencyCode_att_info = new String[]{'currencyCode'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ServiceContractConfirmationItem {
        public String ServiceContractItem;
        public String ServiceContractItemCategory;
        public String Product;
        public OvcServiceContractNotificationOut.Quantity Quantity;
        public OvcServiceContractNotification.SHORT_Description ServiceContractItemDescription;
        public String ServiceContractItemIsReleased;
        public String ServiceContractItemIsCompleted;
        public String ServiceContractItemIsCanceled;
        public String ServiceContractItemCanclnParty;
        public OvcServiceContractNotificationOut.CancellationReasonCode_Out ServiceContractItmCanclnReason;
        public String ServiceContractItemCanclnDate;
        public OvcServiceContractNotificationOut.PriceComponentConfItm[] PriceComponent;
        public OvcServiceContractNotificationOut.TextCollectionOut TextCollection;
        public String ServiceContrItemStartDateTime;
        public String ServiceContrItemEndDateTime;
        public String SettlementPeriodRule;
        public String BillingPlanBillingDateRule;
        public String BillingPlanPriceDateRule;
        public String SrvcContrItemBillgBlockReason;
        public String PricingDate;
        public OvcServiceContractNotificationOut.ServiceContractObjectList[] ServiceContractObjectList;
        public OvcServiceContractNotificationOut.ServiceContractProductList[] ServiceContractProductList;
        public String ReferenceServiceContractItem;
        public String ReferenceServiceQtanItem;
        public OvcServiceContractNotificationOut.ServiceContractPartnerConfItm Partners;
        public OvcServiceContractNotificationOut.RenewPeriodDuration SrvcContrItemRnwlDuration;
        public OvcServiceContractNotificationOut.RenewExtensionDuration SrvcContrItemExtensionDuration;
        public OvcServiceContractNotification.ProfitCentreID ProfitCenter;
        private String[] ServiceContractItem_type_info = new String[]{'ServiceContractItem','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemCategory_type_info = new String[]{'ServiceContractItemCategory','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] Product_type_info = new String[]{'Product','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] Quantity_type_info = new String[]{'Quantity','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemDescription_type_info = new String[]{'ServiceContractItemDescription','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemIsReleased_type_info = new String[]{'ServiceContractItemIsReleased','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemIsCompleted_type_info = new String[]{'ServiceContractItemIsCompleted','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemIsCanceled_type_info = new String[]{'ServiceContractItemIsCanceled','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemCanclnParty_type_info = new String[]{'ServiceContractItemCanclnParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItmCanclnReason_type_info = new String[]{'ServiceContractItmCanclnReason','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractItemCanclnDate_type_info = new String[]{'ServiceContractItemCanclnDate','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PriceComponent_type_info = new String[]{'PriceComponent','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] TextCollection_type_info = new String[]{'TextCollection','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContrItemStartDateTime_type_info = new String[]{'ServiceContrItemStartDateTime','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContrItemEndDateTime_type_info = new String[]{'ServiceContrItemEndDateTime','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] SettlementPeriodRule_type_info = new String[]{'SettlementPeriodRule','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] BillingPlanBillingDateRule_type_info = new String[]{'BillingPlanBillingDateRule','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] BillingPlanPriceDateRule_type_info = new String[]{'BillingPlanPriceDateRule','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] SrvcContrItemBillgBlockReason_type_info = new String[]{'SrvcContrItemBillgBlockReason','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PricingDate_type_info = new String[]{'PricingDate','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractObjectList_type_info = new String[]{'ServiceContractObjectList','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] ServiceContractProductList_type_info = new String[]{'ServiceContractProductList','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] ReferenceServiceContractItem_type_info = new String[]{'ReferenceServiceContractItem','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ReferenceServiceQtanItem_type_info = new String[]{'ReferenceServiceQtanItem','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] Partners_type_info = new String[]{'Partners','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] SrvcContrItemRnwlDuration_type_info = new String[]{'SrvcContrItemRnwlDuration','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] SrvcContrItemExtensionDuration_type_info = new String[]{'SrvcContrItemExtensionDuration','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ProfitCenter_type_info = new String[]{'ProfitCenter','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'ServiceContractItem','ServiceContractItemCategory','Product','Quantity','ServiceContractItemDescription','ServiceContractItemIsReleased','ServiceContractItemIsCompleted','ServiceContractItemIsCanceled','ServiceContractItemCanclnParty','ServiceContractItmCanclnReason','ServiceContractItemCanclnDate','PriceComponent','TextCollection','ServiceContrItemStartDateTime','ServiceContrItemEndDateTime','SettlementPeriodRule','BillingPlanBillingDateRule','BillingPlanPriceDateRule','SrvcContrItemBillgBlockReason','PricingDate','ServiceContractObjectList','ServiceContractProductList','ReferenceServiceContractItem','ReferenceServiceQtanItem','Partners','SrvcContrItemRnwlDuration','SrvcContrItemExtensionDuration','ProfitCenter'};
    }
    public class PriceComponentConfItm {
        public String ConditionType;
        public String ConditionTypeName;
        public String ConditionRateValue;
        public String ConditionCurrency;
        public OvcServiceContractNotificationOut.Amount_Out ConditionAmount;
        public OvcServiceContractNotificationOut.ConditionQuantity ConditionQuantity;
        private String[] ConditionType_type_info = new String[]{'ConditionType','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ConditionTypeName_type_info = new String[]{'ConditionTypeName','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ConditionRateValue_type_info = new String[]{'ConditionRateValue','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ConditionCurrency_type_info = new String[]{'ConditionCurrency','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ConditionAmount_type_info = new String[]{'ConditionAmount','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ConditionQuantity_type_info = new String[]{'ConditionQuantity','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'ConditionType','ConditionTypeName','ConditionRateValue','ConditionCurrency','ConditionAmount','ConditionQuantity'};
    }
    public class ServiceContractPartnerConfItm {
        public String ShipToParty;
        public OvcServiceContractNotificationOut.PersonResponsible_element[] PersonResponsible;
        public String BillToParty;
        public String PayerParty;
        public String ContactPerson;
        private String[] ShipToParty_type_info = new String[]{'ShipToParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PersonResponsible_type_info = new String[]{'PersonResponsible','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] BillToParty_type_info = new String[]{'BillToParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PayerParty_type_info = new String[]{'PayerParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ContactPerson_type_info = new String[]{'ContactPerson','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'ShipToParty','PersonResponsible','BillToParty','PayerParty','ContactPerson'};
    }
    public class TextCollectionTextOut {
        public OvcServiceContractNotificationOut.TextCollectionTextTypeCode_Out TypeCode;
        public OvcServiceContractNotification.Text ContentText;
        public String CreationDateTime;
        private String[] TypeCode_type_info = new String[]{'TypeCode','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ContentText_type_info = new String[]{'ContentText','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] CreationDateTime_type_info = new String[]{'CreationDateTime','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'TypeCode','ContentText','CreationDateTime'};
    }
    public class BusinessTransactionDocumentID_Out {
        public String schemeID;
        public String schemeAgencyID;
        public String schemeAgencySchemeAgencyID;
        private String[] schemeID_att_info = new String[]{'schemeID'};
        private String[] schemeAgencyID_att_info = new String[]{'schemeAgencyID'};
        private String[] schemeAgencySchemeAgencyID_att_info = new String[]{'schemeAgencySchemeAgencyID'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ServiceContractObjectList {
        public String Equipment;
        public String Product;
        public String ServiceRefFunctionalLocation;
        private String[] Equipment_type_info = new String[]{'Equipment','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] Product_type_info = new String[]{'Product','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceRefFunctionalLocation_type_info = new String[]{'ServiceRefFunctionalLocation','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'Equipment','Product','ServiceRefFunctionalLocation'};
    }
    public class ServiceContractOrgUnit {
        public String SalesOrganization;
        public String DistributionChannel;
        public String Division;
        public String SalesOffice;
        public String SalesGroup;
        private String[] SalesOrganization_type_info = new String[]{'SalesOrganization','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] DistributionChannel_type_info = new String[]{'DistributionChannel','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] Division_type_info = new String[]{'Division','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] SalesOffice_type_info = new String[]{'SalesOffice','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] SalesGroup_type_info = new String[]{'SalesGroup','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'SalesOrganization','DistributionChannel','Division','SalesOffice','SalesGroup'};
    }
    public class ServiceContractPartnerConfHdr {
        public String SoldToParty;
        public String ShipToParty;
        public OvcServiceContractNotificationOut.PersonResponsible_element[] PersonResponsible;
        public String BillToParty;
        public String PayerParty;
        public String ContactPerson;
        private String[] SoldToParty_type_info = new String[]{'SoldToParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ShipToParty_type_info = new String[]{'ShipToParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PersonResponsible_type_info = new String[]{'PersonResponsible','http://sap.com/xi/S4CRM/',null,'1','-1','false'};
        private String[] BillToParty_type_info = new String[]{'BillToParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] PayerParty_type_info = new String[]{'PayerParty','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ContactPerson_type_info = new String[]{'ContactPerson','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'SoldToParty','ShipToParty','PersonResponsible','BillToParty','PayerParty','ContactPerson'};
    }
    public class RenewExtensionDuration {
        public String SrvcContrItemExtnDurationUnit;
        private String[] SrvcContrItemExtnDurationUnit_att_info = new String[]{'SrvcContrItemExtnDurationUnit'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class TextCollectionTextTypeCode_Out {
        public String listID;
        public String listVersionID;
        public String listAgencyID;
        public String listAgencySchemeID;
        public String listAgencySchemeAgencyID;
        private String[] listID_att_info = new String[]{'listID'};
        private String[] listVersionID_att_info = new String[]{'listVersionID'};
        private String[] listAgencyID_att_info = new String[]{'listAgencyID'};
        private String[] listAgencySchemeID_att_info = new String[]{'listAgencySchemeID'};
        private String[] listAgencySchemeAgencyID_att_info = new String[]{'listAgencySchemeAgencyID'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ServiceContractStatus {
        public String ServiceContractIsReleased;
        public String ServiceContractIsCompleted;
        public String ServiceContractIsCanceled;
        private String[] ServiceContractIsReleased_type_info = new String[]{'ServiceContractIsReleased','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractIsCompleted_type_info = new String[]{'ServiceContractIsCompleted','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] ServiceContractIsCanceled_type_info = new String[]{'ServiceContractIsCanceled','http://sap.com/xi/S4CRM/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'ServiceContractIsReleased','ServiceContractIsCompleted','ServiceContractIsCanceled'};
    }
    public class CancellationReasonCode_Out {
        public String listVersionID;
        public String listAgencyID;
        public String listAgencySchemeID;
        public String listAgencySchemeAgencyID;
        private String[] listVersionID_att_info = new String[]{'listVersionID'};
        private String[] listAgencyID_att_info = new String[]{'listAgencyID'};
        private String[] listAgencySchemeID_att_info = new String[]{'listAgencySchemeID'};
        private String[] listAgencySchemeAgencyID_att_info = new String[]{'listAgencySchemeAgencyID'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class ServiceContractOrgUnitInService {
        public String SalesOrganizationOrgUnitID;
        public String DistributionChannel;
        public String Division;
        public String SalesOfficeOrgUnitID;
        public String SalesGroupOrgUnitID;
        public String ServiceOrganization;
        private String[] SalesOrganizationOrgUnitID_type_info = new String[]{'SalesOrganizationOrgUnitID','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] DistributionChannel_type_info = new String[]{'DistributionChannel','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] Division_type_info = new String[]{'Division','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] SalesOfficeOrgUnitID_type_info = new String[]{'SalesOfficeOrgUnitID','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] SalesGroupOrgUnitID_type_info = new String[]{'SalesGroupOrgUnitID','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] ServiceOrganization_type_info = new String[]{'ServiceOrganization','http://sap.com/xi/S4CRM/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sap.com/xi/S4CRM/','false','false'};
        private String[] field_order_type_info = new String[]{'SalesOrganizationOrgUnitID','DistributionChannel','Division','SalesOfficeOrgUnitID','SalesGroupOrgUnitID','ServiceOrganization'};
    }
    public class CO_CRMS4_SC_CONF_OUT_port_soap11 {
        public String endpoint_x = 'https://host:port/';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://sap.com/xi/S4CRM/Global2', 'OvcServiceContractNotification', 'http://sap.com/xi/S4CRM/', 'OvcServiceContractNotificationOut'};
        public OvcServiceContractNotificationOut.ServiceContractConfirmationMessage ServiceContractConfirmation(OvcServiceContractNotification.BusinessDocumentMessageHeader MessageHeader,OvcServiceContractNotificationOut.ServiceContractConfirmation ServiceContract,OvcServiceContractNotification.Log Log) {
            OvcServiceContractNotificationOut.ServiceContractConfirmationMessage request_x = new OvcServiceContractNotificationOut.ServiceContractConfirmationMessage();
            request_x.MessageHeader = MessageHeader;
            request_x.ServiceContract = ServiceContract;
            request_x.Log = Log;
            OvcServiceContractNotificationOut.ServiceContractConfirmationMessage response_x;
            Map<String, OvcServiceContractNotificationOut.ServiceContractConfirmationMessage> response_map_x = new Map<String, OvcServiceContractNotificationOut.ServiceContractConfirmationMessage>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://sap.com/xi/S4CRM/',
              'ServiceContractConfirmation',
              'http://sap.com/xi/S4CRM/',
              'ServiceContractConfirmation',
              'OvcServiceContractNotificationOut.ServiceContractConfirmationMessage'}
            );
            response_x = response_map_x.get('response_x');
            return response_x;
        }
    }
}