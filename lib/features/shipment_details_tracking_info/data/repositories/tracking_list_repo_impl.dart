import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/shipment_details_tracking_info/domain/repositories/tracking_list_repo.dart';

@Injectable(as: TrackingListRepo)
class TrackingListRepoImpl implements TrackingListRepo {
  final OpenAPIConfig openAPIConfig;

  TrackingListRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, List<ShipmentStatusGetDto>>> getShipmentTrackingList(int? shipmentId) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getShipmentTracingApi().apiShipmentTracingShipmentStatusesIdGet(
            id: shipmentId ?? 0, apiKey: NetworkKeys.init().networkKeys.apiKey);

        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get ShipmentTrackingList failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get ShipmentTrackingList failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
