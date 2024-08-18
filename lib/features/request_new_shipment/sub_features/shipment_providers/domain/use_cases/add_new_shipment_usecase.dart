import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart';

@injectable
class AddNewShipmentUseCase implements BaseUseCase<Future<Either<Failure, ShipmentGetDto>>, ShipmentAddDto> {
  final ShipmentProvidersRepo shipmentProvidersRepo;

  const AddNewShipmentUseCase({
    required this.shipmentProvidersRepo,
  });

  @override
  Future<Either<Failure, ShipmentGetDto>> call(ShipmentAddDto shipmentAddDto) async {
    return await shipmentProvidersRepo.addNewShipment(shipmentAddDto);
  }
}
