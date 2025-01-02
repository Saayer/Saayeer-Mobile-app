import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/shipments/domain/repositories/shipments_list_repo.dart';

@Injectable(as: ShipmentsListRepo)
class ShipmentsListRepoImpl implements ShipmentsListRepo {
  final OpenAPIConfig openAPIConfig;

  ShipmentsListRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, List<ShipmentGetDto>>> getShipmentsList(ShipmentQuery? shipmentQuery) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getShipmentsApi()
            .apiShipmentsGetbyPost(shipmentQuery: shipmentQuery, apiKey: NetworkKeys.init().networkKeys.apiKey);

        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get Shipments failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get Shipments failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, List<LogisticServiceGetDto>>> getServiceProvidersList() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getLogisticsApi()
            .apiLogisticsServicesGet(apiKey: NetworkKeys.init().networkKeys.apiKey);

        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get ServiceProviders failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get ServiceProviders failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, List<ShipmentGetDtoExtended>>> getAdminShipmentsList(ShipmentQueryLAdmin? shipmentQuery) async{
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getLogisticsAdminDashboardApi()
            .apiLogisticsAdminDashboardShipmentsPost(shipmentQueryLAdmin: shipmentQuery, apiKey: NetworkKeys.init().networkKeys.apiKey);

        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get AdminShipments failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get AdminShipments failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, List<ClientNamesRespnse>>> getClientsList() async{
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getClientsApi()
            .apiClientsNamesGet(apiKey: NetworkKeys.init().networkKeys.apiKey);

        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get ClientsList failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "get ClientsList failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
