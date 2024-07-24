import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class VerifyOtpRepo {
  Future<Either<Failure, AuthenticatedResponseApiResponseModel?>> confirmLogIn(AuthenticateRequestVerify verifyOtpEntity);
}
