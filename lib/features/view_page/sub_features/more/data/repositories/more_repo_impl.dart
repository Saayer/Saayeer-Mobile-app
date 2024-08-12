import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/more/domain/repositories/more_repo.dart';

@Injectable(as: MoreRepo)
class MoreRepoImpl implements MoreRepo {
  final OpenAPIConfig openAPIConfig;

  const MoreRepoImpl({
    required this.openAPIConfig,
  });

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final result =
            await openAPIConfig.openapi.getAuthApi().apiAuthDelete(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.statusCode == 200 || result.statusCode == 201) {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "deleteAccount failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
