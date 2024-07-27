import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ProfileApi
void main() {
  final instance = Openapi().getProfileApi();

  group(ProfileApi, () {
    //Future<UserInformationVMApiResponseModel> profileGetProfileGet(String xApiKey, { ProfileTye profileTye, String acceptLanguage, String xRequestKey }) async
    test('test profileGetProfileGet', () async {
      // TODO
    });

    //Future<UserProfileVMApiResponseModel> profileGetUserProfileGet(String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test profileGetUserProfileGet', () async {
      // TODO
    });

    //Future<BooleanApiResponseModel> profileUpdateBusinessInfoPost(String xApiKey, { String acceptLanguage, String xRequestKey, BusinessInformationRequestVM businessInformationRequestVM }) async
    test('test profileUpdateBusinessInfoPost', () async {
      // TODO
    });

    //Future<BooleanApiResponseModel> profileUpdatePersonalInfoPost(String xApiKey, { String acceptLanguage, String xRequestKey, PersonalInformationRequestVM personalInformationRequestVM }) async
    test('test profileUpdatePersonalInfoPost', () async {
      // TODO
    });

  });
}
