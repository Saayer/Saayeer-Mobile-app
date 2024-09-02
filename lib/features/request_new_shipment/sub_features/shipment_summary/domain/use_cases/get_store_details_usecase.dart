import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/domain/repositories/shipment_summary_repo.dart';

@injectable
class GetStoreDetailsUseCase implements BaseUseCase<Future<Either<Failure, StoreGetDto>>, int> {
  final ShipmentSummaryRepo shipmentSummaryRepo;

  const GetStoreDetailsUseCase({
    required this.shipmentSummaryRepo,
  });

  @override
  Future<Either<Failure, StoreGetDto>> call(int storeId) async {
    return await shipmentSummaryRepo.getStoreDetailsById(storeId);
  }
}
