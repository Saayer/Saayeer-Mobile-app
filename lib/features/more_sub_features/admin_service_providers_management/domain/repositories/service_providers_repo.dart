import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ServiceProvidersRepo {
  Future<Either<Failure, List<LogisticServiceGetDto>>> getServiceProvidersList();

  Future<Either<Failure, void>> updateServiceProvider(LogisticServicePostDto logisticServicePostDto);
}
