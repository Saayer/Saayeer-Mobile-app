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
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart';
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart';

@Injectable(as: LogInRepo)
class LogInRepoImpl implements LogInRepo {
  final LogInRDS logInRDSImpl;
  final OpenAPIConfig openAPIConfig;

   const LogInRepoImpl({
    required this.logInRDSImpl,required this.openAPIConfig
  });

  @override
  Future<Either<Failure, LoginResponseDto?>> logIn(LoginRequestDto loginRequestDto) async {
    log("LogInRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<LoginResponseDto?> result = await openAPIConfig.openapi
            .getAuthApi()
            .apiAuthSignupClientPost(loginRequestDto: loginRequestDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        log("LogInRepoImpl Right $result");
        if (result.statusCode == 200 || result.statusCode == 201) {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "Log in failed"));
        }
      } catch (e) {
        log("LogInRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Log in failed"));
      }
    }
    log("LogInRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
