import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/domain/repositories/shipment_summary_repo.dart';

@injectable
class GetCustomerDetailsUseCase implements BaseUseCase<Future<Either<Failure, CustomerGetDto>>, int> {
  final ShipmentSummaryRepo shipmentSummaryRepo;

  const GetCustomerDetailsUseCase({
    required this.shipmentSummaryRepo,
  });

  @override
  Future<Either<Failure, CustomerGetDto>> call(int customerId) async {
    return await shipmentSummaryRepo.getCustomerDetailsById(customerId);
  }
}
