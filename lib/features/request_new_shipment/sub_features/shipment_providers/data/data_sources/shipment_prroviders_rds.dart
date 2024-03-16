import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';

abstract class ShipmentProvidersRDS {
  //todo add ShipmentProviderEntity
  Future<ShipmentProvidersResponse> getShipmentProviders();
}
