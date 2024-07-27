import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart';
import 'package:saayer/features/verify_otp/data/models/verify_otp_response_model.dart';
import 'package:saayer/features/verify_otp/domain/entities/submit_verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart';

@Injectable(as: VerifyOtpRepo)
class VerifyOtpRepoImpl implements VerifyOtpRepo {
  final VerifyOtpRDS verifyOtpRDSImpl;
  final OpenAPIConfig openAPIConfig;

  const VerifyOtpRepoImpl({
    required this.verifyOtpRDSImpl,
    required this.openAPIConfig,
  });

  @override
  Future<Either<Failure, AuthenticatedResponseApiResponseModel?>> confirmLogIn(
      AuthenticateRequestVerify verifyOtpEntity) async {
    log("VerifyOtpRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<AuthenticatedResponseApiResponseModel> result =
            await openAPIConfig.openapi
                .getAccountApi().authPost(xApiKey: NetworkKeys.init().networkKeys.xApiKey, authenticateRequestVerify: verifyOtpEntity);
        log("VerifyOtpRepoImpl Right $result");
        if (result.statusCode == 200) {
          return Right(result.data);
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
