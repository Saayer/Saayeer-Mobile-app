import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for StoresApi
void main() {
  final instance = Openapi().getStoresApi();

  group(StoresApi, () {
    //Future<BuiltList<StoreGetDto>> apiStoresGet(String apiKey) async
    test('test apiStoresGet', () async {
      // TODO
    });

    //Future apiStoresIdDelete(int id, String apiKey) async
    test('test apiStoresIdDelete', () async {
      // TODO
    });

    //Future<StoreGetDto> apiStoresIdGet(int id, String apiKey) async
    test('test apiStoresIdGet', () async {
      // TODO
    });

    //Future<StoreGetDto> apiStoresPost(String apiKey, { StoreAddDto storeAddDto }) async
    test('test apiStoresPost', () async {
      // TODO
    });

    //Future apiStoresPut(String apiKey, { StoreAddDto storeAddDto }) async
    test('test apiStoresPut', () async {
      // TODO
    });

  });
}
