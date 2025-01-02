import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart';

@injectable
class GetShipmentProvidersUseCase implements BaseUseCase<Future<Either<Failure, List<LogisticCostDto>>>, ShipmentCostRequest> {
  final ShipmentProvidersRepo shipmentProvidersRepo;

  const GetShipmentProvidersUseCase({
    required this.shipmentProvidersRepo,
  });

  @override
  Future<Either<Failure, List<LogisticCostDto>>> call(ShipmentCostRequest shipmentDto) async {
    return await shipmentProvidersRepo.getShipmentProviders(shipmentDto);
  }
}
