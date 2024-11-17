import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/domain/repositories/shipping_partners_list_repo.dart';

@Injectable(as: ShippingPartnersListRepo)
class ShippingPartnersListRepoImpl implements ShippingPartnersListRepo {
  final OpenAPIConfig openAPIConfig;

  ShippingPartnersListRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, List<LogisticsServiceBase>>> getShippingPartners() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final result = await openAPIConfig.openapi
            .getLogisticsApi()
            .apiLogisticsServicesGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "ShippingPartnersListRepoImpl failed"));
        }
      } catch (e) {
        return Left(Failure(failureMessage: "ShippingPartnersListRepoImpl failed"));
      }
    }
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
