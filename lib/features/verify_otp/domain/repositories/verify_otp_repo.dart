import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/verify_otp/domain/entities/submit_verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';

abstract class VerifyOtpRepo {
  Future<Either<Failure, SubmitVerifyOtpEntity?>> confirmLogIn(VerifyOtpEntity verifyOtpEntity);
}
