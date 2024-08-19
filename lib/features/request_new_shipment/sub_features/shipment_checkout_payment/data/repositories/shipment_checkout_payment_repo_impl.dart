import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:openapi/src/model/customer_get_dto.dart';
import 'package:openapi/src/model/store_get_dto.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/domain/repositories/shipment_checkout_payment_repo.dart';

@Injectable(as: ShipmentCheckoutPaymentRepo)
class ShipmentCheckoutPaymentRepoImpl implements ShipmentCheckoutPaymentRepo {
  final OpenAPIConfig openApiConfig;

  const ShipmentCheckoutPaymentRepoImpl({
    required this.openApiConfig,
  });

  @override
  Future<Either<Failure, CustomerGetDto>> getCustomerDetailsById(int customerId) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<CustomerGetDto> result = await openApiConfig.openapi
            .getCustomersApi()
            .apiCustomersIdGet(id: customerId, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "getCustomerDetailsById failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "getCustomerDetailsById failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, StoreGetDto>> getStoreDetailsById(int storeId) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<StoreGetDto> result = await openApiConfig.openapi
            .getStoresApi()
            .apiStoresIdGet(id: storeId, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "getStoreDetailsById failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "getStoreDetailsById failed"));
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
