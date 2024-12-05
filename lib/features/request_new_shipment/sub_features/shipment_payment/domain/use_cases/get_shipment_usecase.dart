import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/domain/repositories/shipment_payment_repo.dart';

@injectable
class GetShipmentUseCase implements BaseUseCase<Future<Either<Failure, ShipmentGetDto>>, int> {
  final ShipmentPaymentRepo shipmentPaymentRepo;

  const GetShipmentUseCase({
    required this.shipmentPaymentRepo,
  });

  @override
  Future<Either<Failure, ShipmentGetDto>> call(int shipmentId) async {
    return await shipmentPaymentRepo.getShipmentById(shipmentId);
  }
}
