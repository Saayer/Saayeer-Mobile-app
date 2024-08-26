import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ShipmentProvidersRepo {
  Future<Either<Failure, List<ServiceCost>>> getShipmentProviders(ShipmentCostObj shipmentDto);
}
