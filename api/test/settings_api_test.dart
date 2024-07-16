import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SettingsApi
void main() {
  final instance = Openapi().getSettingsApi();

  group(SettingsApi, () {
    //Future<AppSettingsApiResponsePublicModel> awbGet(String refNumber, String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test awbGet', () async {
      // TODO
    });

    //Future<AppSettingsApiResponsePublicModel> configurationsPost(String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test configurationsPost', () async {
      // TODO
    });

    //Future<ObjectApiResponseModel> entryPost(String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test entryPost', () async {
      // TODO
    });

  });
}
