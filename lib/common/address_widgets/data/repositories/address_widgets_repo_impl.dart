import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/common/address_widgets/data/data_sources/remote/address_widgets_RDS.dart';
import 'package:saayer/common/address_widgets/data/models/get_cities/get_cities_response_model.dart';
import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';
import 'package:saayer/common/address_widgets/domain/repositories/address_widgets_repo.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';

@Injectable(as: AddressWidgetsRepo)
class AddressWidgetsRepoImpl implements AddressWidgetsRepo {
  final AddressWidgetsRDS addressWidgetsRDSImpl;

  const AddressWidgetsRepoImpl({
    required this.addressWidgetsRDSImpl,
  });

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    log("AddressInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final GetCitiesResponseModel result =
            await addressWidgetsRDSImpl.getCities();
        log("AddressInfoRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        log("AddressInfoRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    log("AddressInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
