import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/domain/repositories/service_providers_repo.dart';

@injectable
class GetServiceProvidersListUseCase implements BaseUseCase<Future<Either<Failure, List<LogisticServiceGetDto>>>, NoParameters> {
  final ServiceProvidersRepo serviceProvidersRepo;

  const GetServiceProvidersListUseCase({
    required this.serviceProvidersRepo,
  });

  @override
  Future<Either<Failure, List<LogisticServiceGetDto>>> call(NoParameters parameters) async {
    return await serviceProvidersRepo.getServiceProvidersList();
  }
}