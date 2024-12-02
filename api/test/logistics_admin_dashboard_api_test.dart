import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for LogisticsAdminDashboardApi
void main() {
  final instance = Openapi().getLogisticsAdminDashboardApi();

  group(LogisticsAdminDashboardApi, () {
    //Future<AmountPerDateResponse> apiLogisticsAdminDashboardPaidPerDayPost(String apiKey, { DateRangeDto dateRangeDto }) async
    test('test apiLogisticsAdminDashboardPaidPerDayPost', () async {
      // TODO
    });

    //Future<CountPerDateResponse> apiLogisticsAdminDashboardShipmentsPerDayPost(String apiKey, { DateRangeDto dateRangeDto }) async
    test('test apiLogisticsAdminDashboardShipmentsPerDayPost', () async {
      // TODO
    });

    //Future<ShipmentsCountResponseLAdmin> apiLogisticsAdminDashboardShipmentsPerStatusPost(String apiKey, { DateRangeDto dateRangeDto }) async
    test('test apiLogisticsAdminDashboardShipmentsPerStatusPost', () async {
      // TODO
    });

    //Future<BuiltList<ShipmentGetDtoExtended>> apiLogisticsAdminDashboardShipmentsPost(String apiKey, { ShipmentQueryLAdmin shipmentQueryLAdmin }) async
    test('test apiLogisticsAdminDashboardShipmentsPost', () async {
      // TODO
    });

  });
}
