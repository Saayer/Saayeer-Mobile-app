import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart';
import 'package:saayer/features/verify_otp/data/models/verify_otp_response_model.dart';
import 'package:saayer/features/verify_otp/domain/entities/submit_verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart';

@Injectable(as: VerifyOtpRepo)
class VerifyOtpRepoImpl implements VerifyOtpRepo {
  final VerifyOtpRDS verifyOtpRDSImpl;

  const VerifyOtpRepoImpl({
    required this.verifyOtpRDSImpl,
  });

  @override
  Future<Either<Failure, SubmitVerifyOtpEntity?>> confirmLogIn(
      VerifyOtpEntity verifyOtpEntity) async {
    log("VerifyOtpRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final VerifyOtpResponseModel result =
            await verifyOtpRDSImpl.confirmLogIn(verifyOtpEntity);
        log("VerifyOtpRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "VerifyOtp failed"));
        }
      } catch (e) {
        log("VerifyOtpRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "VerifyOtp failed"));
      }
    }
    log("VerifyOtpRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
