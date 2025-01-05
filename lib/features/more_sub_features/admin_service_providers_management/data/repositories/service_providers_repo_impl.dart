import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/domain/repositories/service_providers_repo.dart';

@Injectable(as: ServiceProvidersRepo)
class ServiceProvidersRepoImpl implements ServiceProvidersRepo {
  final OpenAPIConfig openAPIConfig;

  ServiceProvidersRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, List<LogisticServiceGetDto>>> getServiceProvidersList() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getLogisticsApi()
            .apiLogisticsServicesGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get ServiceProvidersList failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get ServiceProvidersList failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> updateServiceProvider(LogisticServicePostDto logisticServicePostDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getLogisticsApi().apiLogisticsUpdateServicePost(
            logisticServicePostDto: logisticServicePostDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        return Right(result.data);
      } catch (e) {
        return Left(Failure(failureMessage: "update ServiceProvider failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
