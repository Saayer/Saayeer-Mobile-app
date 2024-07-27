import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CustomersApi
void main() {
  final instance = Openapi().getCustomersApi();

  group(CustomersApi, () {
    //Future<BuiltList<CustomerGetDto>> apiCustomersGet() async
    test('test apiCustomersGet', () async {
      // TODO
    });

    //Future apiCustomersIdDelete(int id) async
    test('test apiCustomersIdDelete', () async {
      // TODO
    });

    //Future<CustomerGetDto> apiCustomersIdGet(int id) async
    test('test apiCustomersIdGet', () async {
      // TODO
    });

    //Future<CustomerGetDto> apiCustomersPost({ CustomerAddDto customerAddDto }) async
    test('test apiCustomersPost', () async {
      // TODO
    });

    //Future apiCustomersPut({ CustomerAddDto customerAddDto }) async
    test('test apiCustomersPut', () async {
      // TODO
    });

  });
}
