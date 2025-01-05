import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class SaayerGainRepo {
  Future<Either<Failure, num>> getSaayerGain();

  Future<Either<Failure, void>> updateSaayerGain(GainRatioPost gainRatioPost);
}
