import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/domain/repositories/add_edit_store_repo.dart';

@injectable
class EditStoreUseCase implements BaseUseCase<Future<Either<Failure, void>>, StoreAddDto?> {
  final AddEditStoreRepo addEditStoreRepo;

  const EditStoreUseCase({required this.addEditStoreRepo});

  @override
  Future<Either<Failure, void>> call(StoreAddDto? storeDto) async {
    return await addEditStoreRepo.editStore(storeDto);
  }
}
