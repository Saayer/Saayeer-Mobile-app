import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for StoreApi
void main() {
  final instance = Openapi().getStoreApi();

  group(StoreApi, () {
    //Future<BooleanApiResponseModel> storeCreateStoreInfoPost(String xApiKey, { String acceptLanguage, String xRequestKey, CreateStoreInformationVM createStoreInformationVM }) async
    test('test storeCreateStoreInfoPost', () async {
      // TODO
    });

    //Future<BooleanApiResponseModel> storeUpdateStoreInfoPost(String xApiKey, { String acceptLanguage, String xRequestKey, StoreInformationVM storeInformationVM }) async
    test('test storeUpdateStoreInfoPost', () async {
      // TODO
    });

  });
}
