import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CustomersApi
void main() {
  final instance = Openapi().getCustomersApi();

  group(CustomersApi, () {
    //Future<BuiltList<CustomerGetDto>> apiCustomersGet(String apiKey) async
    test('test apiCustomersGet', () async {
      // TODO
    });

    //Future<BuiltList<CustomerGetDto>> apiCustomersGetCustomersByPost(String apiKey, { CustomerQuery customerQuery }) async
    test('test apiCustomersGetCustomersByPost', () async {
      // TODO
    });

    //Future apiCustomersIdDelete(int id, String apiKey) async
    test('test apiCustomersIdDelete', () async {
      // TODO
    });

    //Future<CustomerGetDto> apiCustomersIdGet(int id, String apiKey) async
    test('test apiCustomersIdGet', () async {
      // TODO
    });

    //Future<CustomerGetDto> apiCustomersPost(String apiKey, { CustomerAddDto customerAddDto }) async
    test('test apiCustomersPost', () async {
      // TODO
    });

    //Future apiCustomersPut(String apiKey, { CustomerAddDto customerAddDto }) async
    test('test apiCustomersPut', () async {
      // TODO
    });

  });
}
