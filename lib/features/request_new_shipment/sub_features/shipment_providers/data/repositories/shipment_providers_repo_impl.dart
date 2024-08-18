import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/repositories/shipment_providers_repo.dart';

@Injectable(as: ShipmentProvidersRepo)
class ShipmentProvidersRepoImpl implements ShipmentProvidersRepo {
  final OpenAPIConfig openApiConfig;

  const ShipmentProvidersRepoImpl({
    required this.openApiConfig,
  });

  @override
  Future<Either<Failure, List<ShipmentCost>>> getShipmentProviders(ShipmentAddDto shipmentProvidersEntity) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final result = await openApiConfig.openapi.getLogisticsApi().apiLogisticsShipmentCostsGet(
            shipmentAddDto: shipmentProvidersEntity, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "ShipmentProvidersRepoImpl failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "ShipmentProvidersRepoImpl failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, ShipmentGetDto>> addNewShipment(ShipmentAddDto shipmentAddDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<ShipmentGetDto> result = await openApiConfig.openapi
            .getShipmentsApi()
            .apiShipmentsPost(shipmentAddDto: shipmentAddDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "addNewShipment failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "addNewShipment failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
