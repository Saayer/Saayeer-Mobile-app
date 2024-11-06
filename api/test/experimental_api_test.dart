import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ExperimentalApi
void main() {
  final instance = Openapi().getExperimentalApi();

  group(ExperimentalApi, () {
    //Future<String> apiExperimentalAddShipmentStatusGet(String apiKey, { ExperimentalShipmentStatusAdd experimentalShipmentStatusAdd }) async
    test('test apiExperimentalAddShipmentStatusGet', () async {
      // TODO
    });

    //Future<String> apiExperimentalShipmentCreatedAtGet(String apiKey, { ExperimentalShipmentCreatedAtRequest experimentalShipmentCreatedAtRequest }) async
    test('test apiExperimentalShipmentCreatedAtGet', () async {
      // TODO
    });

  });
}
