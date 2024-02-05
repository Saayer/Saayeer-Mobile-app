import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';

abstract class LogInRepo {
  Future<Either<Failure, SubmitLogInEntity?>> logIn(LogInEntity logInEntity);
}
