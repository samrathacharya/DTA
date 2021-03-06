public class zmtTestCustomerOdataACustomerTaxGrouping {
/* 
 * Generated by Overcast UTC 2022-01-14 06:51:19Z.
 * This class belongs to the zmtTestCustomerOdata Real-time Integration Scenario and models the type A_CustomerTaxGrouping.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    @AuraEnabled public String Customer { get; set; }
    @AuraEnabled public String CustomerTaxGroupingCode { get; set; }
    @AuraEnabled public String CustTaxGrpExemptionCertificate { get; set; }
    @AuraEnabled public Decimal CustTaxGroupExemptionRate { get; set; }
    @AuraEnabled public Datetime CustTaxGroupExemptionStartDate { get; set; }
    @AuraEnabled public Datetime CustTaxGroupExemptionEndDate { get; set; }
    @AuraEnabled public Datetime CustTaxGroupSubjectedStartDate { get; set; }
    @AuraEnabled public Datetime CustTaxGroupSubjectedEndDate { get; set; }
        /**
        * Association property to the principal end's (parent's) navigation property.
        * It can be used for the case that primary key fields are not generated yet at runInsert().
        */
        @AuraEnabled public String OVC_FKEY { get; set; }
}