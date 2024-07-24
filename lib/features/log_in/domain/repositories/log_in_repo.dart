import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LogInRepo {
  Future<Either<Failure, AuthenticateResponseVerify?>> logIn(AuthenticateRequest authenticateRequest);
}
