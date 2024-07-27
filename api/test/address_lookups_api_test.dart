import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AddressLookupsApi
void main() {
  final instance = Openapi().getAddressLookupsApi();

  group(AddressLookupsApi, () {
    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsAreasCityIdGet(int cityId) async
    test('test apiAddressLookupsAreasCityIdGet', () async {
      // TODO
    });

    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsCitiesGovernorateIdGet(int governorateId) async
    test('test apiAddressLookupsCitiesGovernorateIdGet', () async {
      // TODO
    });

    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsCountriesGet() async
    test('test apiAddressLookupsCountriesGet', () async {
      // TODO
    });

    //Future<BuiltList<AddressLookUpDto>> apiAddressLookupsGovernoratesCountryIdGet(int countryId) async
    test('test apiAddressLookupsGovernoratesCountryIdGet', () async {
      // TODO
    });

  });
}
