import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AddressLookupsApi
void main() {
  final instance = Openapi().getAddressLookupsApi();

  group(AddressLookupsApi, () {
    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsAreasCityIdGet(int cityId, String apiKey) async
    test('test apiAddressLookupsAreasCityIdGet', () async {
      // TODO
    });

    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsCitiesGovernorateIdGet(int governorateId, String apiKey) async
    test('test apiAddressLookupsCitiesGovernorateIdGet', () async {
      // TODO
    });

    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsCountriesGet(String apiKey) async
    test('test apiAddressLookupsCountriesGet', () async {
      // TODO
    });

    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsGovernoratesCountryIdGet(int countryId, String apiKey) async
    test('test apiAddressLookupsGovernoratesCountryIdGet', () async {
      // TODO
    });

  });
}
