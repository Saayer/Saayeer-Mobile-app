import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AddressApi
void main() {
  final instance = Openapi().getAddressApi();

  group(AddressApi, () {
    //Future<LookupDtoListApiResponseModel> addressCityIdCityIdGet(int cityId, String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test addressCityIdCityIdGet', () async {
      // TODO
    });

    //Future<LookupDtoListApiResponseModel> addressCountriesGet(String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test addressCountriesGet', () async {
      // TODO
    });

    //Future<LookupDtoListApiResponseModel> addressCountryIdCountryIdGet(int countryId, String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test addressCountryIdCountryIdGet', () async {
      // TODO
    });

  });
}
