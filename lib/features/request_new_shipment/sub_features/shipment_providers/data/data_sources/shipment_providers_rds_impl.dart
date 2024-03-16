import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/account/user_info_end_points.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_prroviders_rds.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';

class ShipmentProvidersRDSImpl implements ShipmentProvidersRDS {
  final ApiConsumer apiConsumer;

  ShipmentProvidersRDSImpl({required this.apiConsumer});

  @override
  Future<ShipmentProvidersResponse> getShipmentProviders() async {
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(UserInfoEndPoints.updateBusinessInfo,
          body: businessInfoRequestModel.toJson()),
    );
    final BusinessInfoResponseModel businessInfoResponseModel =
        BusinessInfoResponseModel.fromJson(result);
    return businessInfoResponseModel;
  }
}
