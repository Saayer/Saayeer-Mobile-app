import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/domain/repositories/add_edit_store_repo.dart';

@injectable
class SubmitStoreInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, StoreGetDto?>>,
            StoreAddDto> {
  final AddEditStoreRepo storeInfoRepoImpl;

  const SubmitStoreInfoUseCase({
    required this.storeInfoRepoImpl,
  });

  @override
  Future<Either<Failure, StoreGetDto?>> call(
      StoreAddDto storeDto) async {
    return await storeInfoRepoImpl.addStore(storeDto);
  }
}
