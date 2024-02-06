import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/submit_store_info_entity.dart';

abstract class StoreInfoRepo {
  Future<Either<Failure, SubmitStoreInfoEntity?>> submitStoreInfo(StoreInfoEntity storeInfoEntity);
}
