import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ClientDashboardApi
void main() {
  final instance = Openapi().getClientDashboardApi();

  group(ClientDashboardApi, () {
    //Future<BuiltList<AmountPerDateDto>> apiClientDashboardPaidPerDayPost(String apiKey, { DateRangeDto dateRangeDto }) async
    test('test apiClientDashboardPaidPerDayPost', () async {
      // TODO
    });

    //Future<BuiltList<CountPerDateDto>> apiClientDashboardShipmentsPerDayPost(String apiKey, { DateRangeDto dateRangeDto }) async
    test('test apiClientDashboardShipmentsPerDayPost', () async {
      // TODO
    });

    //Future<ShipmentsCountResponse> apiClientDashboardShipmentsPerStatusPost(String apiKey, { DateRangeDto dateRangeDto }) async
    test('test apiClientDashboardShipmentsPerStatusPost', () async {
      // TODO
    });

  });
}
