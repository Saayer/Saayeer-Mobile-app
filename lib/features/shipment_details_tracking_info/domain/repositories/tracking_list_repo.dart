import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class TrackingListRepo {
  Future<Either<Failure, List<ShipmentStatusGetDto>>> getShipmentTrackingList(int? shipmentId);
}
