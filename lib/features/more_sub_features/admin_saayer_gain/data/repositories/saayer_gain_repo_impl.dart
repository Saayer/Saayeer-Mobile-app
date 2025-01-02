import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/domain/repositories/saayer_gain_repo.dart';

@Injectable(as: SaayerGainRepo)
class SaayerGainRepoImpl implements SaayerGainRepo {
  final OpenAPIConfig openAPIConfig;

  SaayerGainRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, num>> getSaayerGain() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getLogisticsApi()
            .apiLogisticsGetGainGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "get SaayerGain failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get SaayerGain failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> updateSaayerGain(GainRatioPost gainRatioPost) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getLogisticsApi()
            .apiLogisticsUpdateGainPost(gainRatioPost: gainRatioPost, apiKey: NetworkKeys.init().networkKeys.apiKey);
        return Right(result.data);
      } catch (e) {
        return Left(Failure(failureMessage: "update SaayerGain failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
