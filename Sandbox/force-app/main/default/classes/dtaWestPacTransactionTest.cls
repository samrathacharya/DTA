/* 
 * Generated by Overcast UTC 2022-02-10 17:57:26Z.
 * Changes to this class may cause incorrect behavior and will be lost if the scenario is re-activated.
 */
@istest
private class dtaWestPacTransactionTest {
    @istest
    private static void testdtaWestPacTransaction() {
        dtaWestPacTransaction actual = new dtaWestPacTransaction();
    }

    @istest
    private static void testTransactionParameters() {
        dtaWestPacTransaction.TransactionParameters actual = new dtaWestPacTransaction.TransactionParameters('a','a','a','a','a','a','a');

        system.assertEquals('a', actual.singleUseTokenId);
        system.assertEquals('a', actual.customerNumber);
        system.assertEquals('a', actual.transactionType);
        system.assertEquals('a', actual.principalAmount);
        system.assertEquals('a', actual.currency_x);
        system.assertEquals('a', actual.orderNumber);
        system.assertEquals('a', actual.merchantId);

        dtaWestPacTransaction.TransactionParameters actual0 = new dtaWestPacTransaction.TransactionParameters();
    }
    @istest
    private static void testTransactionsModel() {
        dtaWestPacTransaction.TransactionsModel actual = new dtaWestPacTransaction.TransactionsModel(0,'a','a','a','a','a','a','a','a','a','a','a','a',0,0,0,'a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a');

        actual.fraudResult = 'a';
        actual.customerIpCountry = 'a';
        actual.cardCountry = 'a';
        actual.isVoidable = true;
        actual.isRefundable = true;
        system.assertEquals(0, actual.transactionId);
        system.assertEquals('a', actual.receiptNumber);
        system.assertEquals('a', actual.status);
        system.assertEquals('a', actual.responseCode);
        system.assertEquals('a', actual.responseText);
        system.assertEquals('a', actual.transactionType);
        system.assertEquals('a', actual.customerNumber);
        system.assertEquals('a', actual.customerName);
        system.assertEquals('a', actual.customerEmail);
        system.assertEquals('a', actual.bpayRef);
        system.assertEquals('a', actual.orderNumber);
        system.assertEquals('a', actual.customerBankReference);
        system.assertEquals('a', actual.currency_x);
        system.assertEquals(0, actual.principalAmount);
        system.assertEquals(0, actual.surchargeAmount);
        system.assertEquals(0, actual.paymentAmount);
        system.assertEquals('a', actual.paymentMethod);
        system.assertEquals('a', actual.creditCard);
        system.assertEquals('a', actual.merchant);
        system.assertEquals('a', actual.bankAccount);
        system.assertEquals('a', actual.virtualAccount);
        system.assertEquals('a', actual.australiaPost);
        system.assertEquals('a', actual.bpay);
        system.assertEquals('a', actual.yourBankAccount);
        system.assertEquals('a', actual.customerPayPalAccount);
        system.assertEquals('a', actual.yourPayPalAccount);
        system.assertEquals('a', actual.transactionDateTime);
        system.assertEquals('a', actual.user);
        system.assertEquals('a', actual.settlementDate);
        system.assertEquals('a', actual.declinedDate);
        system.assertEquals('a', actual.parentTransaction);
        system.assertEquals('a', actual.customerIpAddress);
        system.assertEquals('a', actual.fraudResult);
        system.assertEquals('a', actual.customerIpCountry);
        system.assertEquals('a', actual.cardCountry);
        system.assertEquals(true, actual.isVoidable);
        system.assertEquals(true, actual.isRefundable);

        dtaWestPacTransaction.TransactionsModel actual0 = new dtaWestPacTransaction.TransactionsModel();
    }

    @istest
    private static void testCreatePayment() {
        overcast.TestingUtilities.SetupTestEnvironment('dtaWestPacTransaction');
        dtaWestPacTransaction api1 = new dtaWestPacTransaction();
        dtaWestPacTransaction api2 = new dtaWestPacTransaction();
        Map<String, Object> responseObjct = new Map<String, Object> {
            'status' => 200,
            'body' => new Map<String, Object> {
                'transactionId' => 0,
                'receiptNumber' => 'a',
                'status' => 'a',
                'responseCode' => 'a',
                'responseText' => 'a',
                'transactionType' => 'a',
                'customerNumber' => 'a',
                'customerName' => 'a',
                'customerEmail' => 'a',
                'bpayRef' => 'a',
                'orderNumber' => 'a',
                'customerBankReference' => 'a',
                'currency_x' => 'a',
                'principalAmount' => 0,
                'surchargeAmount' => 0,
                'paymentAmount' => 0,
                'paymentMethod' => 'a',
                'creditCard' => 'a',
                'merchant' => 'a',
                'bankAccount' => 'a',
                'virtualAccount' => 'a',
                'australiaPost' => 'a',
                'bpay' => 'a',
                'yourBankAccount' => 'a',
                'customerPayPalAccount' => 'a',
                'yourPayPalAccount' => 'a',
                'transactionDateTime' => 'a',
                'user' => 'a',
                'settlementDate' => 'a',
                'declinedDate' => 'a',
                'parentTransaction' => 'a',
                'customerIpAddress' => 'a',
                'fraudResult' => 'a',
                'customerIpCountry' => 'a',
                'cardCountry' => 'a',
                'isVoidable' => true,
                'isRefundable' => true
            }
        };
        dtaWestPacTransaction.testStaticResponse = '{"output":' + JSON.serialize(responseObjct) + ', "backendMessage":"message from backend"}';
        api1.testResponse = dtaWestPacTransaction.testStaticResponse;
        api2.testResponse = dtaWestPacTransaction.testStaticResponse;
        Map<String, Object> params = new Map<String, Object> {
            'body' => new dtaWestPacTransaction.TransactionParameters()
        };
        dtaWestPacTransaction.ApiResponse response1 = api1.createPayment(params);
        dtaWestPacTransaction.ApiResponse response2 = api1.createPayment(params, null, null);
        String requestLabel = api2.createPaymentAsync(params, new overcast.Logger('dtaWestPacTransaction'), null, new Continuation(10));
        dtaWestPacTransaction.ApiResponse response3 = dtaWestPacTransaction.getCreatePaymentAsyncResponse(requestLabel);
        System.assertEquals(200, response1.statusCode);
        System.assertEquals(200, response2.statusCode);
        System.assertNotEquals(null, requestLabel);
        System.assertEquals(200, response3.statusCode);
        System.assertEquals('message from backend', response1.backendMessage);
        System.assertEquals('message from backend', response2.backendMessage);
        System.assertEquals('message from backend', response3.backendMessage);

        dtaWestPacTransaction request = new dtaWestPacTransaction();
        request.testResponse = dtaWestPacTransaction.testStaticResponse;
        try {
            request.run();
            System.assert(false, 'An exception must be thrown.');
        } catch (Exception e) { }
        request.setOperationName('createPayment');
        overcast.Realtime.Restful response = request.run();
        System.assertEquals(200, response.getStatusCode());
        String requestLabel2 = request.runAsync(null, null, new Continuation(10));

        dtaWestPacTransaction output = new dtaWestPacTransaction();
        try {
            output.loadAsyncResponse('{"output":{"body":{"SAMPLE1":{"FIELD1":"VALUE1"}}}}');
            System.assert(false, 'An exception must be thrown.');
        } catch (Exception e) { }
        output.setOperationName('createPayment');
        try {
            output.loadAsyncResponse('{"output":{"body":{"SAMPLE1":{"FIELD1":"VALUE1"}}}}');
            System.assert(false, 'An exception must be thrown.');
        } catch (Exception e) { }
        output.loadAsyncResponse(dtaWestPacTransaction.testStaticResponse);
        System.assertEquals(200, output.getStatusCode());
    }

    @istest
    private static void testSerialize() {
        dtaWestPacTransaction input = new dtaWestPacTransaction();
        System.assertEquals(null, input.serialize());
        input.set('@prop1', 0);
        System.assertEquals('{"@prop1":0}', input.serialize());
    }

    @istest
    private static void testDeserializeError() {
        try {
            dtaWestPacTransaction.ApiResponse actual = dtaWestPacTransaction.deserialize('{"error":["A test error"]}', new Map<Integer, Type>());
            System.assert(false, 'No exception thrown');
        }
        catch (dtaWestPacTransaction.dtaWestPacTransactionException e) {
            System.assertEquals('A test error', e.getMessage());
        }
    }

    @istest
    private static void testGetterSetter() {
        dtaWestPacTransaction output = new dtaWestPacTransaction();
        output.set('SAMPLE1', new Map<String, Object>{
            'FIELD1' => 'VALUE1'
        });
        
        system.assertEquals(null, output.get('NOVAL'));
        
        Map<String, Object> sample1 = (Map<String, Object>)output.get('SAMPLE1');
        System.assertNotEquals(null, sample1);
        System.assertEquals('VALUE1', sample1.get('FIELD1'));

        output = new dtaWestPacTransaction();
        output.set('@prop1', 'a');
        output.set('@prop2.prop2-1', 'b');
        output.set('@prop2.prop2-2', 'c');
        System.assert(output.get('response') instanceof Map<String, Object>);
        System.assertEquals('a', output.get('@prop1'));
        System.assertEquals('b', output.get('@prop2.prop2-1'));
        System.assertEquals('c', output.get('@prop2.prop2-2'));
        System.assertEquals('a', output.get('response.@prop1'));
        System.assertEquals('b', output.get('response.@prop2.prop2-1'));
        System.assertEquals('c', output.get('response.@prop2.prop2-2'));
        System.assertEquals(null, output.get(null));
        System.assertEquals(null, output.get('@prop2.prop2-3'));
        System.assertEquals(null, output.get('@prop3'));

        output = new dtaWestPacTransaction();
        output.set('param', 'a');
        System.assertEquals('a', output.get('_'));
        output = new dtaWestPacTransaction();
        output.set('param', new List<String>{'a', 'b'});
        List<String> listParam = (List<String>)output.get('_');
        System.assertEquals(2, listParam.size());
        System.assertEquals('a', listParam[0]);
        System.assertEquals('b', listParam[1]);
    }
    
    @istest
    private static void testGetMetadata() {
        dtaWestPacTransaction output = new dtaWestPacTransaction();
        String topTypeName = output.getTopTypeName();
        Map<String, overcast.TypeInfo> metadata = output.getMetadata();
        Map<String, overcast.Realtime.ApiMetadata> apiMetadata = output.getApiMetadata();
    }

}