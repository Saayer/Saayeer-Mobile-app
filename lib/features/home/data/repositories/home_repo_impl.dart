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
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final OpenAPIConfig openAPIConfig;

  const HomeRepoImpl({
    required this.openAPIConfig,
  });

  @override
  Future<Either<Failure, ClientGetDto>> getUserProfile() async {
    log("getUserProfile");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<ClientGetDto> result =
            await openAPIConfig.openapi.getClientsApi().apiClientsGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    log("HomeRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
