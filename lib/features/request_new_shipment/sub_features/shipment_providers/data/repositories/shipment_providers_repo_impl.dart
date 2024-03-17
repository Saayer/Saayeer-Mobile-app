import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/data_sources/shipment_prroviders_rds.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart';

@Injectable(as: ShipmentProvidersRepo)
class ShipmentProvidersRepoImpl implements ShipmentProvidersRepo {
  final ShipmentProvidersRDS shipmentProvidersRDS;

  const ShipmentProvidersRepoImpl({
    required this.shipmentProvidersRDS,
  });

  @override
  Future<Either<Failure, ShipmentProvidersResponse?>>
      getShipmentProviders() async {
    log("ShipmentProvidersRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final ShipmentProvidersResponse result =
            await shipmentProvidersRDS.getShipmentProviders();
        log("ShipmentProvidersRepoImpl Right $result");
        if (result != null) {
          return Right(result);
        } else {
          return Left(
              Failure(failureMessage: "ShipmentProvidersRepoImpl failed"));
        }
      } catch (e) {
        log("ShipmentProvidersRepoImpl Failure ${e.toString()}");
        return Left(
            Failure(failureMessage: "ShipmentProvidersRepoImpl failed"));
      }
    }
    log("ShipmentProvidersRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
