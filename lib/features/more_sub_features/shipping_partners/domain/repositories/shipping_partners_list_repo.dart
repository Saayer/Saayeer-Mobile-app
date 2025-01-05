import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ShippingPartnersListRepo {
  Future<Either<Failure, List<LogisticServiceGetDto>>> getShippingPartners();
}
