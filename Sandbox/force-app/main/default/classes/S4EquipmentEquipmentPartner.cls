public class S4EquipmentEquipmentPartner {
/* 
 * Generated by Overcast UTC 2022-03-17 03:56:43Z.
 * This class belongs to the S4Equipment Real-time Integration Scenario and models the type EquipmentPartner.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    @AuraEnabled public String Equipment { get; set; }
    @AuraEnabled public String PartnerFunction { get; set; }
    @AuraEnabled public String EquipmentPartnerObjectNmbr { get; set; }
    @AuraEnabled public String Partner { get; set; }
    @AuraEnabled public String CreatedByUser { get; set; }
    @AuraEnabled public Datetime CreationDate { get; set; }
        /**
        * Navigation property to Equipment.OVC_FKEY.
        * It can be used for the case that primary key fields are not generated yet at runInsert().
        */
        @AuraEnabled public String to_Equipment { get; set; }
        /**
        * Association property to the principal end's (parent's) navigation property.
        * It can be used for the case that primary key fields are not generated yet at runInsert().
        */
        @AuraEnabled public String OVC_FKEY { get; set; }
}