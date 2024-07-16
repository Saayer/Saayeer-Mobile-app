import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AccountApi
void main() {
  final instance = Openapi().getAccountApi();

  group(AccountApi, () {
    //Future<AuthenticatedResponseApiResponseModel> authPost(String xApiKey, AuthenticateRequestVerify authenticateRequestVerify, { String acceptLanguage, String xRequestKey }) async
    test('test authPost', () async {
      // TODO
    });

    //Future<AuthenticateResponseVerify> loginPost(String xApiKey, AuthenticateRequest authenticateRequest, { String acceptLanguage, String xRequestKey }) async
    test('test loginPost', () async {
      // TODO
    });

    //Future<AuthenticatedResponseApiResponseModel> refreshTokenPost(String xApiKey, TokenApiModel tokenApiModel, { String acceptLanguage, String xRequestKey }) async
    test('test refreshTokenPost', () async {
      // TODO
    });

    //Future<BooleanApiResponseModel> revokeTokenPost(String xApiKey, TokenApiModel tokenApiModel, { String acceptLanguage, String xRequestKey }) async
    test('test revokeTokenPost', () async {
      // TODO
    });

  });
}
