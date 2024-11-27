import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/shipments/domain/repositories/shipments_list_repo.dart';

@injectable
class GetServiceProvidersListUseCase
    implements BaseUseCase<Future<Either<Failure, List<LogisticsServiceBase>>>, NoParameters> {
  final ShipmentsListRepo shipmentsListRepo;

  const GetServiceProvidersListUseCase({
    required this.shipmentsListRepo,
  });

  @override
  Future<Either<Failure, List<LogisticsServiceBase>>> call(NoParameters parameters) async {
    return await shipmentsListRepo.getServiceProvidersList();
  }
}
