import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/entities/get_shipment_providers_entity.dart';

abstract class ShipmentProvidersRDS {
  Future<ShipmentProvidersResponse> getShipmentProviders( GetShipmentProvidersEntity shipmentProvidersEntity);
}
