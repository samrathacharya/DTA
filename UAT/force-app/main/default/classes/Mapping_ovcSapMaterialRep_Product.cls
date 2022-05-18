/*
 * Copyright © 2019 Vigience Co., Ltd. All Rights Reserved
 */
 
// This class allows advanced customizations for the mapping of records from ovcSapMaterialRep_MARAV__c to Product2.
// This class is constructed and executed each batch. Your class fields and properties will loose their values after each batch is complete.
// To retain data for the lifetime of the whole batch process, set the property persistentState.
//
// Scenario: ovcSapMaterialRep
// Source Object: ovcSapMaterialRep_MARAV__c
// Target Object: Product2
// Mapping Record Name: ovcSapMaterialRep_Product
// Direction: Inbound
// 
// Your changes will not be overwritten when resaving the mapping.
//
global class Mapping_ovcSapMaterialRep_Product extends overcast.ObjectMapping.PluginExtension implements overcast.ObjectMapping.EventPlugin, overcast.ObjectMapping.BatchableEventPlugin {
	static final String chainedScenario = 'ProductHierarchyDescRep';
    @TestVisible 
    Set<String> portalMaterials = new Set<String>();
    // Base class properties (Do not uncomment these properties.)
    //
    // Set perisistentState with your own object/data to retain any state for the duration of the batch job.
    // global Object persistentState


    global void execute(overcast__Run__c scenarioExecution, ovcSapMaterialRep_MARAV__c[] records) {
        m_logger = new overcast.Logger(scenarioExecution.Id);
        overcast.ObjectMapping.MappingConfig config = new overcast.ObjectMapping.MappingConfig('ovcSapMaterialRep_MARAV__c', records);
        config.rollbackOnError = false;
        // config.dmlOptions = new Database.DmlOptions(); // If set, config.dmlOptions will be used for the DML operations.
        // config.batchSize = 200; // Also set in UI. Allows dynamic setting of batch size.
        config.eventplugin = this;
        config.mappings = [SELECT overcast__Target__c, overcast__Map__c, overcast__Joins__c 
                    FROM overcast__IntegrationFieldMap__c 
                    WHERE overcast__ApexClass__c = 'Mapping_ovcSapMaterialRep_Product'];
        config.logger = m_logger;
        config.scenarioExecution = scenarioExecution;
        
		
		// Perform your pre-mapping processing here. Perform mid-mapping processing in beforeUpsert().    
        Set<String> productHierarchy = new Set<string>();
        Set<String> materialNumbers = new Set<String>();
		for (ovcSapMaterialRep_MARAV__c r : records) {
            if(String.isNotBlank(r.PRDHA__c)){
                productHierarchy.add(r.PRDHA__c);
            }
            materialNumbers.add(r.MATNR__c);
		}
        portalMaterials = getPortalMaterials(materialNumbers, m_logger);  
		//get Product Hierarchy Description
		Map<String, String> mapHierarchyDescription = getHierarchyDescription(productHierarchy, m_logger);
        //get Alternative Uoms
        Map<String, Set<String>> mapAlternativeUoms = getAlternativeUoms(materialNumbers, m_logger);

		//Set Product Hierarchy Description and Alternative Uoms
		for (ovcSapMaterialRep_MARAV__c r : records) {
            if(portalMaterials.contains(r.MATNR__c)){
                r.ovcHierarchyDescription__c = mapHierarchyDescription.get(r.PRDHA__c);
                Set<String> alternativeUOMs = mapAlternativeUoms.get(r.MATNR__c);  
                if(alternativeUOMs != null){
                	r.ovcAlternativeUoMs__c =  String.join(new List<String>(alternativeUOMs), ',');
                }
            }
		}              
        
        overcast.ObjectMapping.run(config);
                
        /* Custom Addon */
        //if (!Test.isRunningTest()) {
            //createProductHierarchyDesc(records, m_logger);
        //}
        /* End of Custom Addon */ 
             
        this.saveLogs();
    }

    // Begin ObjectMapping.EventPlugin interface implementation

    // BeforeUpsert Is called for each record that will be inserted/updated into the target object.
    // If the target record has an ID it will be updated, otherwise inserted.
    // Return true to accept the record for insert/update. False to reject the record.
    global boolean beforeUpsert(sobject sourceRecord, sobject targetRecord) {
        ovcSapMaterialRep_MARAV__c source = (ovcSapMaterialRep_MARAV__c)sourceRecord;
		if (!portalMaterials.contains(source.MATNR__c)) {
			return false;
		}
        Product2 target = (Product2)targetRecord;
        //logDebug(target.productCode);
        return true;
    }
    
    // AfterInsert Is called after both insert And update DML operations are successfull. 
    // If rollbackOnError Is true And a DML exception occurs when inserting Or updating, the transaction Is rolled back And AfterInsert Is Not called.
    // If rollbackOnError Is false And a DML exception occurs when inserting Or updating, AfterInsert Is called And saveResults will contain the error messages.
    global void afterInsert(sobject[] insertedRecords, Database.SaveResult[] saveResults) { 
        integer failedCount = 0;
        for (integer i = 0; i < saveResults.size(); ++i) {
            Database.Saveresult saveResult = saveResults[i];
            
            if (!saveResult.isSuccess()) {
                sobject insertedRecord = insertedRecords[i];
                list<string> fieldErrors = new list<string>(); 
                for (string fieldName : saveResult.getErrors()[0].getFields()) {
                    fieldErrors.add(fieldName + '=' + string.valueof(insertedRecord.get(fieldName)));
                }
                
                LogError(string.format('Failed to save record [ID={0}, Message={1}:{2}, {3}]', 
                    new string[]{
                        insertedRecord.Id, 
                        string.valueof(saveResult.getErrors()[0].getStatusCode()), 
                        saveResult.getErrors()[0].getMessage(), 
                        string.join(fieldErrors, ', ')
                    }));
                
                ++failedCount;
            }
        }
        if (failedCount > 0) {
            logError(string.format('{0} of {1} records failed to save.', 
                new string[]{ 
                    string.valueof(failedCount), 
                    string.valueof(insertedRecords.size()) 
                }));
            setStatusToError();
        }
    }
    
    // AfterUpdate Is called after both insert And update DML operations are successfull. 
    // If rollbackOnError Is true And a DML exception occurs when inserting Or updating, the transaction Is rolled back And AfterUpdate Is Not called.
    // If rollbackOnError Is false And a DML exception occurs when inserting Or updating, AfterUpdate Is called And saveResults will contain the error messages.
    global void afterUpdate(sobject[] updatedRecords, Database.SaveResult[] saveResults) {  
        afterInsert(updatedRecords, saveResults);
    }

    // End of interface implementation
        
    // Begin helper methods
        
    // Log an error message to the scenario execution log
    global void logError(String message) {
        m_logger.addLog('ERROR', '[Mapping_ovcSapMaterialRep_Product] ' + message);
    }
    
    // Log an warning message to the scenario execution log
    global void logWarning(String message) {
        m_logger.addLog('WARN', '[Mapping_ovcSapMaterialRep_Product] ' + message);
    }
    
    // Log an info message to the scenario execution log
    global void logInfo(String message) {
        m_logger.addLog('INFO', '[Mapping_ovcSapMaterialRep_Product] ' + message);
    }

    // Log a debug message to the scenario execution log
    global void logDebug(String message) {
        m_logger.addLog('DEBUG', '[Mapping_ovcSapMaterialRep_Product] ' + message);
    }
    
    // Set the scenario execution status to error
    global void setStatusToError() {
        m_logger.setStatusCode(400);
    }
    
    // Set the scenario execution status to warning
    global void setStatusToWarning() {
        m_logger.setStatusCode(500);
    }
    
    global void saveLogs() {
        m_logger.commitToDatabase();
    }
    
    // End helper methods

    @testvisible
    private overcast.Logger m_logger;

    global override overcast.Logger getLogger() {
        return m_logger;
    }
    
    @TestVisible
    private MaterialProductHierarchyRT testProdHier;
    @TestVisible
    private Map<String, String> getHierarchyDescription(
        Set<String> hierarchyCodes,
        overcast.logger logger    
    ){
        Map<String,String> mapProdHierDescription = new Map<String,String>();
		if (hierarchyCodes == null || hierarchyCodes.isEmpty()) {
			return mapProdHierDescription;
		}  

        MaterialProductHierarchyRT request = new MaterialProductHierarchyRT();

        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(
 			new overcast.Predicate(
				'PRODH',
				overcast.Predicate.FilterType.IN1,
				new List<String>(hierarchyCodes)           
            )
        );

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        Overcast.Logger loggerX = new Overcast.Logger('MaterialProductHierarchyRT');
        MaterialProductHierarchyRT resp = Test.isRunningTest()
        ? testProdHier
        : request.runQuery(q, loggerX, null);

		List<overcast__Log__c> logs = logger.getLogs();
		logs.addAll(loggerX.getLogs());
 
        for(MaterialProductHierarchyRT.T179T rec : resp.T179T){
            mapProdHierDescription.put(rec.PRODH, rec.VTEXT);      
        }
        return mapProdHierDescription;
    }
    
    /* Custom Addon */
    // Create scenario 'ProductHierarchyDescRep' execution
    /*@TestVisible
    private void createProductHierarchyDesc(ovcSapMaterialRep_MARAV__c[] records, overcast.Logger logger) {
        // Create an input set to retrieve current Stock Quantity from SAP.
        Set<String> productHierarchy = new Set<String>();

        for (ovcSapMaterialRep_MARAV__c rec : records) {
            productHierarchy.add(rec.PRDHA__c);
        }

        if (!productHierarchy.isEmpty()) {
            overcast.Predicate pred = new overcast.Predicate(null, overcast.Predicate.FilterType.AND1, '');

            overcast.Predicate hierCode = new overcast.Predicate(null, overcast.Predicate.FilterType.OR1, '');
            for (String productHierCode : productHierarchy) {
                hierCode.add(new overcast.Predicate('PRODH__c', overcast.Predicate.FilterType.Equals, productHierCode));
            }

            pred.add(hierCode);

            overcast__ScenarioTables__c[] st = [
                SELECT Id, overcast__Scenario__c
                FROM overcast__ScenarioTables__c
                WHERE overcast__Scenario__r.Name = :chainedScenario
                LIMIT 1
            ];
            if (st.isEmpty()) {
                logError('Unable to find scenario information for ' + chainedScenario);
                setStatusToError();
            } else {
                overcast__InputSet__c input = new overcast__InputSet__c(
                    Name = 'auto_' + overcast.Utilities.NewGuid(),
                    overcast__Scenario__c = st[0].overcast__Scenario__c,
                    overcast__ScenarioTables__c = st[0].Id
                );
                input.overcast__Condition2__c = pred.serialize();
                insert input;

                logInfo(
                    String.format(
                        'Enqueueing scenario [{0}] for {1} materials with InputSet [{2}]',
                        new List<String>{ chainedScenario, String.valueOf(productHierarchy.size()), input.Name }
                    )
                );
                overcast.Scenario.runAsync(chainedScenario, input.Name, logger);
            }
        }
    }
    /* End of Custom Addon */    

    @TestVisible
    private MaterialUnitsofMeasure testAltUoms;
    @TestVisible
    private Map<String, Set<String>> getAlternativeUoms(
        Set<String> matNos,
        overcast.logger logger    
    ){
        Map<String,Set<String>> mapMaterialAlternativeUOMs = new Map<String,Set<String>>();
		if (matNos == null || matNos.isEmpty()) {
			return mapMaterialAlternativeUOMs;
		}  

        MaterialUnitsofMeasure request = new MaterialUnitsofMeasure();

        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
        pred.add(
 			new overcast.Predicate(
				'MATNR',
				overcast.Predicate.FilterType.IN1,
				new List<String>(matNos)           
            )
        );

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        Overcast.Logger loggerX = new Overcast.Logger('MaterialUnitsofMeasure');
        MaterialUnitsofMeasure resp = Test.isRunningTest()
        ? testAltUoms
        : request.runQuery(q, loggerX, null);

		List<overcast__Log__c> logs = logger.getLogs();
		logs.addAll(loggerX.getLogs());
        
        for(MaterialUnitsofMeasure.MARM rec : resp.MARM){
            if(rec.MEINH == null){
                continue;
            }
            Set<String> availableUOMS = mapMaterialAlternativeUOMs.get(rec.MATNR);
            if (availableUOMS == null){
                mapMaterialAlternativeUOMs.put(rec.MATNR, new Set<String>{rec.MEINH});
            } else {
                availableUOMS.add(rec.MEINH);
            }
        }
        
        return mapMaterialAlternativeUOMs;
    } 
    
    @TestVisible
    private MaterialPortalSite testPortalMat;
    @TestVisible
    private set<String> getPortalMaterials(
        Set<String> matNos,
        overcast.logger logger    
    ){

        MaterialPortalSite request = new MaterialPortalSite();
        overcast.Predicate pred = new overcast.Predicate();
        pred.type = overcast.Predicate.FilterType.AND1;
    	pred.add(
		new overcast.Predicate(
			'DATAB',
			overcast.Predicate.FilterType.LESS_THAN_OR_EQUAL_TO,
			Date.today()
		    )
        );
        pred.add(
		new overcast.Predicate(
			'DATBI',
			overcast.Predicate.FilterType.GREATER_THAN_OR_EQUAL_TO,
			Date.today()
		    )
        );
        pred.add(
 			new overcast.Predicate(
				'MATNR',
				overcast.Predicate.FilterType.IN1,
				new List<String>(matNos)           
            )
        );
		pred.add(
 			new overcast.Predicate(
				'HYBRIS_SITE',
				overcast.Predicate.FilterType.EQUALS,
				'SALESFORCE'          
            )
        );        

        overcast.Query q = new overcast.Query();
        q.where_x = pred;
        Overcast.Logger loggerX = new Overcast.Logger('MaterialPortalSite');
        MaterialPortalSite resp = Test.isRunningTest()
        ? testPortalMat
        : request.runQuery(q, loggerX, null);

		List<overcast__Log__c> logs = logger.getLogs();
		logs.addAll(loggerX.getLogs());

        Set<String> availableMaterialtobeMapped = new Set<String>();
        
        for(MaterialPortalSite.ZMM_PORTAL rec : resp.ZMM_PORTAL){
            availableMaterialtobeMapped.add(rec.MATNR);
        }
        return availableMaterialtobeMapped;
    }           
}