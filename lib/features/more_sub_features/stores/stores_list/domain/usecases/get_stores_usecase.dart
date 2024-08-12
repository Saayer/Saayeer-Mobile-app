import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/domain/repositories/stores_list_repo.dart';

@injectable
class GetStoresUseCase implements BaseUseCase<Future<Either<Failure, List<StoreGetDto>>>, NoParameters> {
  final StoresListRepo storesListRepo;

  const GetStoresUseCase({
    required this.storesListRepo,
  });

  @override
  Future<Either<Failure, List<StoreGetDto>>> call(NoParameters parameters) async {
    return await storesListRepo.getStores();
  }
}
