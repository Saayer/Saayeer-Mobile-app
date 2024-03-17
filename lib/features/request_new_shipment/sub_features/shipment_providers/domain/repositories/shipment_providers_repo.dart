import 'package:dartz/dartz.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';

abstract class ShipmentProvidersRepo {
  Future<Either<Failure, ShipmentProvidersResponse?>> getShipmentProviders();
}
