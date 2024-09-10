import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/src/model/create_payment_response.dart';
import 'package:openapi/src/model/payment_add_dto.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/domain/repositories/shipment_payment_repo.dart';

@Injectable(as: ShipmentPaymentRepo)
class ShipmentPaymentRepoImpl implements ShipmentPaymentRepo {
  final OpenAPIConfig openApiConfig;

  const ShipmentPaymentRepoImpl({
    required this.openApiConfig,
  });

  @override
  Future<Either<Failure, CreatePaymentResponse>> createPayment(PaymentAddDto paymentDto) async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final Response<CreatePaymentResponse> result = await openApiConfig.openapi
            .getAccountingApi()
            .apiAccountingCreatePaymentPost(paymentAddDto: paymentDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return Left(Failure(failureMessage: "createPayment failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "createPayment failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
