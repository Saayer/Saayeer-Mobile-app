import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/repositories/stores_list_repo.dart';

@Injectable(as: StoresListRepo)
class StoresListRepoImpl implements StoresListRepo {
  final OpenAPIConfig openAPIConfig;

  StoresListRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, List<StoreGetDto>>> getStores() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result =
            await openAPIConfig.openapi.getStoresApi().apiStoresGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get Stores failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get Stores failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> deleteStore(int storeId) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getStoresApi()
            .apiStoresIdDelete(id: storeId, apiKey: NetworkKeys.init().networkKeys.apiKey);
        return Right(result.data);
      } catch (e) {
        return Left(Failure(failureMessage: "delete Store failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
