import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart';

@injectable
class GetShipmentProvidersUseCase
    implements
        BaseUseCase<Future<Either<Failure, ShipmentProvidersResponse?>>,
            NoParameters> {
  final ShipmentProvidersRepo shipmentProvidersRepo;

  const GetShipmentProvidersUseCase({
    required this.shipmentProvidersRepo,
  });

  @override
  Future<Either<Failure, ShipmentProvidersResponse?>> call(
      NoParameters parameters) async {
    return await shipmentProvidersRepo.getShipmentProviders();
  }
}
