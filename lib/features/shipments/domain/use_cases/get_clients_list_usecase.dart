import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/shipments/domain/repositories/shipments_list_repo.dart';

@injectable
class GetClientsListUseCase implements BaseUseCase<Future<Either<Failure, List<ClientNamesRespnse>>>, NoParameters> {
  final ShipmentsListRepo shipmentsListRepo;

  const GetClientsListUseCase({
    required this.shipmentsListRepo,
  });

  @override
  Future<Either<Failure, List<ClientNamesRespnse>>> call(NoParameters parameters) async {
    return await shipmentsListRepo.getClientsList();
  }
}
