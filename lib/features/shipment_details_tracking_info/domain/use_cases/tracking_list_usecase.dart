import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/shipment_details_tracking_info/domain/repositories/tracking_list_repo.dart';

@injectable
class TrackingListUseCase implements BaseUseCase<Future<Either<Failure, List<ShipmentStatusGetDto>>>, int?> {
  final TrackingListRepo trackingListRepo;

  const TrackingListUseCase({
    required this.trackingListRepo,
  });

  @override
  Future<Either<Failure, List<ShipmentStatusGetDto>>> call(int? shipmentId) async {
    return await trackingListRepo.getShipmentTrackingList(shipmentId);
  }
}
