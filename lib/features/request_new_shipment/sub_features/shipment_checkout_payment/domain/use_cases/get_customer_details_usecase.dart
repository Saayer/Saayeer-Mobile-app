import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/domain/repositories/shipment_checkout_payment_repo.dart';

@injectable
class GetCustomerDetailsUseCase implements BaseUseCase<Future<Either<Failure, CustomerGetDto>>, int> {
  final ShipmentCheckoutPaymentRepo shipmentCheckoutPaymentRepo;

  const GetCustomerDetailsUseCase({
    required this.shipmentCheckoutPaymentRepo,
  });

  @override
  Future<Either<Failure, CustomerGetDto>> call(int customerId) async {
    return await shipmentCheckoutPaymentRepo.getCustomerDetailsById(customerId);
  }
}
