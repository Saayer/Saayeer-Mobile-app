import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ShipmentsApi
void main() {
  final instance = Openapi().getShipmentsApi();

  group(ShipmentsApi, () {
    //Future<BuiltList<ShipmentGetDto>> apiShipmentsGet(String apiKey) async
    test('test apiShipmentsGet', () async {
      // TODO
    });

    //Future apiShipmentsIdDelete(int id, String apiKey) async
    test('test apiShipmentsIdDelete', () async {
      // TODO
    });

    //Future<ShipmentGetDto> apiShipmentsIdGet(int id, String apiKey) async
    test('test apiShipmentsIdGet', () async {
      // TODO
    });

    //Future<ShipmentGetDto> apiShipmentsPost(String apiKey, { ShipmentAddDto shipmentAddDto }) async
    test('test apiShipmentsPost', () async {
      // TODO
    });

    //Future apiShipmentsPut(String apiKey, { ShipmentAddDto shipmentAddDto }) async
    test('test apiShipmentsPut', () async {
      // TODO
    });

  });
}
