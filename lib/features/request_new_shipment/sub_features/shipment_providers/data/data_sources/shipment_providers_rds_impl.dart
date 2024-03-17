import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/account/user_info_end_points.dart';
import 'package:saayer/core/API/end_points/end_points/shipment/shipment_endpoints.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_prroviders_rds.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/request_shipment_provider.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';

@Injectable(as: ShipmentProvidersRDS)
class ShipmentProvidersRDSImpl implements ShipmentProvidersRDS {
  final ApiConsumer apiConsumer;

  ShipmentProvidersRDSImpl({required this.apiConsumer});

  @override
  Future<ShipmentProvidersResponse> getShipmentProviders() async {
    print('ShipmentProvidersRDSImpl');
    //todo entity
    final RequestShipmentProvider requestShipmentProvider =
        RequestShipmentProvider();

    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(ShipmentEndpoints.getShipmentProviders,
          body: requestShipmentProvider.toJson()),
    );

    print('result');
print(result);
    final ShipmentProvidersResponse shipmentProvidersResponse =
        ShipmentProvidersResponse.fromJson(result);
    return shipmentProvidersResponse;
  }
}
