public class sapSalesOrderDetailORDER_ITEMS_OUT {
/* 
 * Generated by Overcast UTC 2022-03-24 04:08:35Z.
 * This class belongs to the sapSalesOrderDetail Real-time Integration Scenario and models the type ORDER_ITEMS_OUT.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
    @AuraEnabled public String OPERATION { get; set; }
    @AuraEnabled public String DOC_NUMBER { get; set; }
    @AuraEnabled public String ITM_NUMBER { get; set; }
    @AuraEnabled public String MATERIAL { get; set; }
    @AuraEnabled public String MAT_ENTRD { get; set; }
    @AuraEnabled public String PR_REF_MAT { get; set; }
    @AuraEnabled public String BATCH { get; set; }
    @AuraEnabled public String MATL_GROUP { get; set; }
    @AuraEnabled public String SHORT_TEXT { get; set; }
    @AuraEnabled public String ITEM_CATEG { get; set; }
    @AuraEnabled public String ITEM_TYPE { get; set; }
    @AuraEnabled public String REL_FOR_DE { get; set; }
    @AuraEnabled public String REL_FOR_BI { get; set; }
    @AuraEnabled public String HG_LV_ITEM { get; set; }
    @AuraEnabled public String ALTERN_ITM { get; set; }
    @AuraEnabled public String REA_FOR_RE { get; set; }
    @AuraEnabled public String PROD_HIER { get; set; }
    @AuraEnabled public Decimal OUT_AGR_TA { get; set; }
    @AuraEnabled public Decimal TARGET_QTY { get; set; }
    @AuraEnabled public String TARGET_QU { get; set; }
    @AuraEnabled public String T_UNIT_ISO { get; set; }
    @AuraEnabled public Decimal TARG_QTY_N { get; set; }
    @AuraEnabled public Decimal TARG_QTY_D { get; set; }
    @AuraEnabled public String BASE_UOM { get; set; }
    @AuraEnabled public String T_BAS_UNIT { get; set; }
    @AuraEnabled public Decimal SCALE_QUAN { get; set; }
    @AuraEnabled public Decimal ROUND_DLV { get; set; }
    @AuraEnabled public Date RECON_DATE { get; set; }
    @AuraEnabled public Decimal MAX_DEVIAT { get; set; }
    @AuraEnabled public String PO_ITM_NO { get; set; }
    @AuraEnabled public String CUST_MAT22 { get; set; }
    @AuraEnabled public Decimal MAX_DEV_PE { get; set; }
    @AuraEnabled public Decimal MAX_DEV_DA { get; set; }
    @AuraEnabled public String REPAIR_PRO { get; set; }
    @AuraEnabled public String DLVSCHEDUS { get; set; }
    @AuraEnabled public String DLV_GROUP { get; set; }
    @AuraEnabled public String FIXED_QUAN { get; set; }
    @AuraEnabled public String DELI_UNLIM { get; set; }
    @AuraEnabled public Decimal OVER_DLV_T { get; set; }
    @AuraEnabled public Decimal UNDER_DLV { get; set; }
    @AuraEnabled public String BILL_BLOCK { get; set; }
    @AuraEnabled public String REPLACE_PT { get; set; }
    @AuraEnabled public String METH_BILL { get; set; }
    @AuraEnabled public String DIVISION { get; set; }
    @AuraEnabled public String BUS_AREA { get; set; }
    @AuraEnabled public Decimal NET_VALUE { get; set; }
    @AuraEnabled public String CURRENCY_x { get; set; }
    @AuraEnabled public String CURREN_ISO { get; set; }
    @AuraEnabled public Decimal MAX_PL_DLV { get; set; }
    @AuraEnabled public String PART_DLV { get; set; }
    @AuraEnabled public String BTCH_SPLIT { get; set; }
    @AuraEnabled public Decimal REQ_QTY { get; set; }
    @AuraEnabled public Decimal CUM_REQ_DE { get; set; }
    @AuraEnabled public Decimal CUM_CF_QTY { get; set; }
    @AuraEnabled public Decimal CUM_CON_QU { get; set; }
    @AuraEnabled public String SALES_UNIT { get; set; }
    @AuraEnabled public String ISOCODUNIT { get; set; }
    @AuraEnabled public Decimal SALES_QTY1 { get; set; }
    @AuraEnabled public Decimal SALES_QTY2 { get; set; }
    @AuraEnabled public Decimal GROSS_WEIG { get; set; }
    @AuraEnabled public Decimal NET_WEIGHT { get; set; }
    @AuraEnabled public String UNIT_OF_WT { get; set; }
    @AuraEnabled public String UNIT_WTISO { get; set; }
    @AuraEnabled public Decimal VOLUME { get; set; }
    @AuraEnabled public String VOLUMEUNIT { get; set; }
    @AuraEnabled public String VOLUNITISO { get; set; }
    @AuraEnabled public String CAU_VBELN { get; set; }
    @AuraEnabled public String CAU_POSNR { get; set; }
    @AuraEnabled public String REF_DOC { get; set; }
    @AuraEnabled public String POSNR_VOR { get; set; }
    @AuraEnabled public String OBJ_COPY { get; set; }
    @AuraEnabled public String UPDAT_FLAG { get; set; }
    @AuraEnabled public String END_RULE { get; set; }
    @AuraEnabled public String DLV_PRIO { get; set; }
    @AuraEnabled public String PLANT { get; set; }
    @AuraEnabled public String STGE_LOC { get; set; }
    @AuraEnabled public String SHIP_POINT { get; set; }
    @AuraEnabled public String ROUTE { get; set; }
    @AuraEnabled public String KEY_ST { get; set; }
    @AuraEnabled public Date DATE_ST { get; set; }
    @AuraEnabled public String NBR_ST { get; set; }
    @AuraEnabled public Decimal STPOS_VBAP { get; set; }
    @AuraEnabled public String ORDER_PROB { get; set; }
    @AuraEnabled public Date CREAT_DATE { get; set; }
    @AuraEnabled public String CREATED_BY { get; set; }
    @AuraEnabled public String REC_TIME { get; set; }
    @AuraEnabled public String TAX_CLASS1 { get; set; }
    @AuraEnabled public String TAX_CLASS2 { get; set; }
    @AuraEnabled public String TAX_CLASS3 { get; set; }
    @AuraEnabled public String TAX_CLASS4 { get; set; }
    @AuraEnabled public String TAX_CLASS5 { get; set; }
    @AuraEnabled public String TAX_CLASS6 { get; set; }
    @AuraEnabled public String TAX_CLASS7 { get; set; }
    @AuraEnabled public String TAX_CLASS8 { get; set; }
    @AuraEnabled public String TAX_CLASS9 { get; set; }
    @AuraEnabled public Decimal FIX_SP_DAY { get; set; }
    @AuraEnabled public Decimal VAR_SP_DAY { get; set; }
    @AuraEnabled public String PREC_DOC { get; set; }
    @AuraEnabled public Decimal NET_PRICE { get; set; }
    @AuraEnabled public Decimal COND_P_UNT { get; set; }
    @AuraEnabled public String COND_UNIT { get; set; }
    @AuraEnabled public String CONISOUNIT { get; set; }
    @AuraEnabled public String RETOURE { get; set; }
    @AuraEnabled public String CASH_DISC { get; set; }
    @AuraEnabled public String AVAILCHECK { get; set; }
    @AuraEnabled public String SUM_REQUIR { get; set; }
    @AuraEnabled public String MAT_PR_GRP { get; set; }
    @AuraEnabled public String ACCT_ASSGT { get; set; }
    @AuraEnabled public String REBATE_GRP { get; set; }
    @AuraEnabled public String COMM_GROUP { get; set; }
    @AuraEnabled public String EUR_ART_NR { get; set; }
    @AuraEnabled public String PRICE_OK { get; set; }
    @AuraEnabled public String VAL_TYPE { get; set; }
    @AuraEnabled public String SEP_VALUAT { get; set; }
    @AuraEnabled public String BATCH_MGMT { get; set; }
    @AuraEnabled public String IND_BTCH { get; set; }
    @AuraEnabled public Decimal MIN_DELY { get; set; }
    @AuraEnabled public String UPDATE_GRP { get; set; }
    @AuraEnabled public Decimal COST_DOC_C { get; set; }
    @AuraEnabled public Decimal SUBTOT_PP1 { get; set; }
    @AuraEnabled public Decimal SUBTOT_PP2 { get; set; }
    @AuraEnabled public Decimal SUBTOT_PP3 { get; set; }
    @AuraEnabled public Decimal SUBTOT_PP4 { get; set; }
    @AuraEnabled public Decimal SUBTOT_PP5 { get; set; }
    @AuraEnabled public Decimal SUBTOT_PP6 { get; set; }
    @AuraEnabled public Decimal EXCH_RATE { get; set; }
    @AuraEnabled public Date CH_ON { get; set; }
    @AuraEnabled public String EAN_UPC { get; set; }
    @AuraEnabled public String FIX_DATE { get; set; }
    @AuraEnabled public String PROFIT_CTR { get; set; }
    @AuraEnabled public String PRC_GROUP1 { get; set; }
    @AuraEnabled public String PRC_GROUP2 { get; set; }
    @AuraEnabled public String PRC_GROUP3 { get; set; }
    @AuraEnabled public String PRC_GROUP4 { get; set; }
    @AuraEnabled public String PRC_GROUP5 { get; set; }
    @AuraEnabled public Decimal COMPON_QTY { get; set; }
    @AuraEnabled public String SUBSTREASO { get; set; }
    @AuraEnabled public String SPEC_STOCK { get; set; }
    @AuraEnabled public String ALLOC_INDI { get; set; }
    @AuraEnabled public String PROFIT_SEG { get; set; }
    @AuraEnabled public String WBS_ELEM { get; set; }
    @AuraEnabled public String ORDERID { get; set; }
    @AuraEnabled public String PLNG_MATL { get; set; }
    @AuraEnabled public String PLNG_PLANT { get; set; }
    @AuraEnabled public String BASE_UNIT { get; set; }
    @AuraEnabled public String ISOBASUNIT { get; set; }
    @AuraEnabled public Double CONV_FACT { get; set; }
    @AuraEnabled public String ACCTASSCAT { get; set; }
    @AuraEnabled public String CONSUMPT { get; set; }
    @AuraEnabled public String BOMEXPLNO { get; set; }
    @AuraEnabled public String OBJ_NR_IT { get; set; }
    @AuraEnabled public String RES_ANAL { get; set; }
    @AuraEnabled public String REQMTSTYP { get; set; }
    @AuraEnabled public Decimal CREDPRICIT { get; set; }
    @AuraEnabled public String PARTRELID { get; set; }
    @AuraEnabled public String ACTCREDID { get; set; }
    @AuraEnabled public Decimal CR_EXCHRAT { get; set; }
    @AuraEnabled public String CONFIG { get; set; }
    @AuraEnabled public String CHCLASS_IN { get; set; }
    @AuraEnabled public String STAT_PRICE { get; set; }
    @AuraEnabled public String COND_UPDAT { get; set; }
    @AuraEnabled public String SERNO_PROF { get; set; }
    @AuraEnabled public Integer NO_OF_SERI { get; set; }
    @AuraEnabled public String NOGRPOSTED { get; set; }
    @AuraEnabled public String MAT_GRP_SM { get; set; }
    @AuraEnabled public String MAN_PR_CH { get; set; }
    @AuraEnabled public String DOC_CAT_SD { get; set; }
    @AuraEnabled public String MATDETERID { get; set; }
    @AuraEnabled public String ITUSAGEID { get; set; }
    @AuraEnabled public String COSTESTNR { get; set; }
    @AuraEnabled public String CSTG_VRNT { get; set; }
    @AuraEnabled public String BOMITEMNR { get; set; }
    @AuraEnabled public String STAT_VAL { get; set; }
    @AuraEnabled public Date STAT_DATE { get; set; }
    @AuraEnabled public String BUS_TRANST { get; set; }
    @AuraEnabled public String PREF_INDIC { get; set; }
    @AuraEnabled public String NRCONDREC { get; set; }
    @AuraEnabled public String INTCLASSNR { get; set; }
    @AuraEnabled public String BATCH_EXIT { get; set; }
    @AuraEnabled public String BOM_CATEGO { get; set; }
    @AuraEnabled public String BOM_IT_NR { get; set; }
    @AuraEnabled public String COUNTER { get; set; }
    @AuraEnabled public String INCONSCONF { get; set; }
    @AuraEnabled public String OVERH_KEY { get; set; }
    @AuraEnabled public String CSTG_SHEET { get; set; }
    @AuraEnabled public String CSTG_VRNT1 { get; set; }
    @AuraEnabled public String PROD_ALLOC { get; set; }
    @AuraEnabled public String PRICE_REF { get; set; }
    @AuraEnabled public String MATPRICGRP { get; set; }
    @AuraEnabled public String MATFRGTGRP { get; set; }
    @AuraEnabled public String PLANDLVSCH { get; set; }
    @AuraEnabled public String SEQUENCENO { get; set; }
    @AuraEnabled public Double CREDPRIC { get; set; }
    @AuraEnabled public String PAY_GUARAN { get; set; }
    @AuraEnabled public Double GURANTEED { get; set; }
    @AuraEnabled public String CFOP_CODE { get; set; }
    @AuraEnabled public String TAXLAWICMS { get; set; }
    @AuraEnabled public String TAXLAWIPI { get; set; }
    @AuraEnabled public String SD_TAXCODE { get; set; }
    @AuraEnabled public String VALCONTRNR { get; set; }
    @AuraEnabled public String VALCONTRIT { get; set; }
    @AuraEnabled public String ASSORT_MOD { get; set; }
    @AuraEnabled public String VALSPECSTO { get; set; }
    @AuraEnabled public String MATGRHIE1 { get; set; }
    @AuraEnabled public String MATGRHIE2 { get; set; }
    @AuraEnabled public String PROMOTION { get; set; }
    @AuraEnabled public String SALES_DEAL { get; set; }
    @AuraEnabled public String FLGLEADUNI { get; set; }
    @AuraEnabled public String FREE_GOODS { get; set; }
    @AuraEnabled public String VALID_OBJ { get; set; }
    @AuraEnabled public Decimal TAX_AMOUNT { get; set; }
    @AuraEnabled public String MRP_AREA { get; set; }
    @AuraEnabled public String CUST_MAT35 { get; set; }
    @AuraEnabled public Decimal CR_EXCHRAT_V { get; set; }
    @AuraEnabled public Decimal EXCHRATEST_V { get; set; }
    @AuraEnabled public String ITM_TYPE_USAGE { get; set; }
    @AuraEnabled public String CFOP_LONG { get; set; }
    @AuraEnabled public Decimal GROSS_VAL { get; set; }
    @AuraEnabled public String LOG_SYSTEM_OWN { get; set; }
    @AuraEnabled public String TAXLAWISS { get; set; }
    @AuraEnabled public String TAXLAWCOFINS { get; set; }
    @AuraEnabled public String TAXLAWPIS { get; set; }
    @AuraEnabled public String DOC_CAT_SD_LONG { get; set; }
    @AuraEnabled public String MATERIAL_LONG { get; set; }
    @AuraEnabled public String MAT_ENTRD_LONG { get; set; }
    @AuraEnabled public String PR_REF_MAT_LONG { get; set; }
    @AuraEnabled public String PLNG_MATL_LONG { get; set; }
    @AuraEnabled public String PRICE_REF_LONG { get; set; }
    @AuraEnabled public Decimal PO_QUAN { get; set; }
    @AuraEnabled public String PO_UNIT { get; set; }
}