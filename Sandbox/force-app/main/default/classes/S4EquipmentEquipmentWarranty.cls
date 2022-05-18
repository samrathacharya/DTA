public class S4EquipmentEquipmentWarranty {
/* 
 * Generated by Overcast UTC 2022-03-17 03:56:43Z.
 * This class belongs to the S4Equipment Real-time Integration Scenario and models the type EquipmentWarranty.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    @AuraEnabled public String Equipment { get; set; }
    @AuraEnabled public String WarrantyType { get; set; }
    @AuraEnabled public String MasterWarranty { get; set; }
    @AuraEnabled public Datetime WarrantyStartDate { get; set; }
    @AuraEnabled public Datetime WarrantyEndDate { get; set; }
    @AuraEnabled public String WrntyIsInhtdFromSuperiorObject { get; set; }
    @AuraEnabled public String WrntyIsPassedOnToChildObject { get; set; }
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