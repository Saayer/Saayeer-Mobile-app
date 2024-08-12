import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ClientsApi
void main() {
  final instance = Openapi().getClientsApi();

  group(ClientsApi, () {
    //Future<ClientGetDto> apiClientsGet(String apiKey) async
    test('test apiClientsGet', () async {
      // TODO
    });

    //Future apiClientsPut(String apiKey, { ClientAddDto clientAddDto }) async
    test('test apiClientsPut', () async {
      // TODO
    });

  });
}
