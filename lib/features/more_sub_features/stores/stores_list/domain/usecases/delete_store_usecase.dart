import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/repositories/stores_list_repo.dart';

@injectable
class DeleteStoresUseCase implements BaseUseCase<Future<Either<Failure, void>>, int> {
  final StoresListRepo storesListRepo;

  const DeleteStoresUseCase({required this.storesListRepo});

  @override
  Future<Either<Failure, void>> call(int storeId) async {
    return await storesListRepo.deleteStore(storeId);
  }
}
