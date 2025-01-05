import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/domain/repositories/shipping_partners_list_repo.dart';

@injectable
class GetShippingPartnersUseCase implements BaseUseCase<Future<Either<Failure, List<LogisticServiceGetDto>>>, NoParameters> {
  final ShippingPartnersListRepo shippingPartnersListRepo;

  const GetShippingPartnersUseCase({
    required this.shippingPartnersListRepo,
  });

  @override
  Future<Either<Failure, List<LogisticServiceGetDto>>> call(NoParameters parameters) async {
    return await shippingPartnersListRepo.getShippingPartners();
  }
}
