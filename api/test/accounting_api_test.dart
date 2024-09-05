import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AccountingApi
void main() {
  final instance = Openapi().getAccountingApi();

  group(AccountingApi, () {
    //Future<CreatePaymentResponse> apiAccountingCreatePaymentPost(String apiKey, { PaymentAddDto paymentAddDto }) async
    test('test apiAccountingCreatePaymentPost', () async {
      // TODO
    });

  });
}
