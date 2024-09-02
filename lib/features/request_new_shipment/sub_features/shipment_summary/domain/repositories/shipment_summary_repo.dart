import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ShipmentSummaryRepo {
  Future<Either<Failure, StoreGetDto>> getStoreDetailsById(int storeId);

  Future<Either<Failure, CustomerGetDto>> getCustomerDetailsById(int customerId);

  Future<Either<Failure, ShipmentGetDto>> addNewShipment(ShipmentAddDto shipmentAddDto);
}
