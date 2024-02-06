import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/data_sources/remote/store_info_RDS.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/data/models/store_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/submit_store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart';

@Injectable(as: StoreInfoRepo)
class StoreInfoRepoImpl implements StoreInfoRepo {
  final StoreInfoRDS storeInfoRDSImpl;

  const StoreInfoRepoImpl({
    required this.storeInfoRDSImpl,
  });

  @override
  Future<Either<Failure, SubmitStoreInfoEntity?>> submitStoreInfo(
      StoreInfoEntity storeInfoEntity) async {
    log("StoreInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final StoreInfoResponseModel result =
            await storeInfoRDSImpl.submitStoreInfo(storeInfoEntity);
        log("StoreInfoRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "Log in failed"));
        }
      } catch (e) {
        log("StoreInfoRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Log in failed"));
      }
    }
    log("StoreInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
