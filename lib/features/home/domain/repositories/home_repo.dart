import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, ClientGetDto>> getUserProfile();

  Future<Either<Failure, ShipmentsCountResponse>> getShipmentsStatusTotalCount(DateRangeDto dataRangeDto);

  Future<Either<Failure, CountPerDateResponse>> getTotalShipmentPerDays(DateRangeDto dataRangeDto);

  Future<Either<Failure, AmountPerDateResponse>> getTotalPaidPerDays(DateRangeDto dataRangeDto);
}
