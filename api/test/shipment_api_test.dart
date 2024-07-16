import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ShipmentApi
void main() {
  final instance = Openapi().getShipmentApi();

  group(ShipmentApi, () {
    //Future<CostResponseDtoListApiResponseModel> shipmentCalculateCostPost(String xApiKey, { String acceptLanguage, String xRequestKey, PackageDetails packageDetails }) async
    test('test shipmentCalculateCostPost', () async {
      // TODO
    });

    //Future<ObjectApiResponseModel> shipmentCreateShipmentPost(String xApiKey, { String acceptLanguage, String xRequestKey, CreateShipmentRequestDto createShipmentRequestDto }) async
    test('test shipmentCreateShipmentPost', () async {
      // TODO
    });

    //Future<ObjectApiResponseModel> shipmentGetShipmentsPost(String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test shipmentGetShipmentsPost', () async {
      // TODO
    });

  });
}
