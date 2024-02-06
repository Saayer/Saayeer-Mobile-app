import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/submit_store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/repositories/store_info_repo.dart';

@injectable
class SubmitStoreInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, SubmitStoreInfoEntity?>>,
            StoreInfoParameters> {
  final StoreInfoRepo storeInfoRepoImpl;

  const SubmitStoreInfoUseCase({
    required this.storeInfoRepoImpl,
  });

  @override
  Future<Either<Failure, SubmitStoreInfoEntity?>> call(
      StoreInfoParameters parameters) async {
    return await storeInfoRepoImpl.submitStoreInfo(parameters.storeInfoEntity);
  }
}

class StoreInfoParameters extends Equatable {
  final StoreInfoEntity storeInfoEntity;

  const StoreInfoParameters({required this.storeInfoEntity});

  @override
  List<Object?> get props => [storeInfoEntity];
}
