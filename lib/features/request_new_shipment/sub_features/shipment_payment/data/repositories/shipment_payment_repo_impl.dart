import 'package:injectable/injectable.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/domain/repositories/shipment_payment_repo.dart';

@Injectable(as: ShipmentPaymentRepo)
class ShipmentPaymentRepoImpl implements ShipmentPaymentRepo {
  final OpenAPIConfig openApiConfig;

  const ShipmentPaymentRepoImpl({
    required this.openApiConfig,
  });

}
