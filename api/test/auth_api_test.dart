import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future<LoginResponseDto> apiAuthSignupPost(String apiKey, { LoginRequestDto loginRequestDto }) async
    test('test apiAuthSignupPost', () async {
      // TODO
    });

    //Future<TokenResponseDto> apiAuthTokenPost(String apiKey, { TokenRequestDto tokenRequestDto }) async
    test('test apiAuthTokenPost', () async {
      // TODO
    });

  });
}
