import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ClientApi
void main() {
  final instance = Openapi().getClientApi();

  group(ClientApi, () {
    //Future<BooleanApiResponseModel> clientAddClientPost(String xApiKey, { String acceptLanguage, String xRequestKey, ClientsInformationRequestVM clientsInformationRequestVM }) async
    test('test clientAddClientPost', () async {
      // TODO
    });

    //Future<ClientsInformationResponseVMListApiResponseModel> clientGetClientsGet(String xApiKey, { String acceptLanguage, String xRequestKey }) async
    test('test clientGetClientsGet', () async {
      // TODO
    });

  });
}
