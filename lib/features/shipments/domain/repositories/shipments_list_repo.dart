import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ShipmentsListRepo {
  Future<Either<Failure, List<ShipmentGetDto>>> getShipmentsList(ShipmentQuery? shipmentQuery);

  Future<Either<Failure, List<LogisticServiceGetDto>>> getServiceProvidersList();

  Future<Either<Failure, List<ShipmentGetDtoExtended>>> getAdminShipmentsList(ShipmentQueryLAdmin? shipmentQuery);

  Future<Either<Failure, List<ClientNamesRespnse>>> getClientsList();
}
