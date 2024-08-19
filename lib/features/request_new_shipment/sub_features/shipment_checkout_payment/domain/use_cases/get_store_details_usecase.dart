import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/domain/repositories/shipment_checkout_payment_repo.dart';

@injectable
class GetStoreDetailsUseCase implements BaseUseCase<Future<Either<Failure, StoreGetDto>>, int> {
  final ShipmentCheckoutPaymentRepo shipmentCheckoutPaymentRepo;

  const GetStoreDetailsUseCase({
    required this.shipmentCheckoutPaymentRepo,
  });

  @override
  Future<Either<Failure, StoreGetDto>> call(int storeId) async {
    return await shipmentCheckoutPaymentRepo.getStoreDetailsById(storeId);
  }
}
