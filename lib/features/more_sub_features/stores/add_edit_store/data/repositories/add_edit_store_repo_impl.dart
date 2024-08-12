import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/domain/repositories/add_edit_store_repo.dart';

@Injectable(as: AddEditStoreRepo)
class StoreInfoRepoImpl implements AddEditStoreRepo {
  final OpenAPIConfig openAPIConfig;

  const StoreInfoRepoImpl({
    required this.openAPIConfig,
  });

  @override
  Future<Either<Failure, StoreGetDto?>> addStore(StoreAddDto storeAddDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final result = await openAPIConfig.openapi
            .getStoresApi()
            .apiStoresPost(storeAddDto: storeAddDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "addStore failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "addStore failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> editStore(StoreAddDto? storeAddDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getStoresApi()
            .apiStoresPut(storeAddDto: storeAddDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        return Right(result.data);
      } catch (e) {
        return Left(Failure(failureMessage: "edit Store failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
