import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for LogisticsApi
void main() {
  final instance = Openapi().getLogisticsApi();

  group(LogisticsApi, () {
    //Future<BuiltList<ShipmentCost>> apiLogisticsShipmentCostsGet(String apiKey, { ShipmentAddDto shipmentAddDto }) async
    test('test apiLogisticsShipmentCostsGet', () async {
      // TODO
    });

  });
}
