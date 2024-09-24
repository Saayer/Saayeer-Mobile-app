import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ShipmentTracingApi
void main() {
  final instance = Openapi().getShipmentTracingApi();

  group(ShipmentTracingApi, () {
    //Future<String> apiShipmentTracingAramexWebhookGet(String apiKey, { AramexWebhookRequest aramexWebhookRequest }) async
    test('test apiShipmentTracingAramexWebhookGet', () async {
      // TODO
    });

    //Future<BuiltList<ShipmentStatusGetDto>> apiShipmentTracingShipmentStatusesIdGet(int id, String apiKey) async
    test('test apiShipmentTracingShipmentStatusesIdGet', () async {
      // TODO
    });

  });
}
