import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/add_address/data/data_sources/remote/add_address_info_RDS.dart';
import 'package:saayer/features/add_address/data/models/get_cities/get_cities_response_model.dart';
import 'package:saayer/features/add_address/data/models/submit_address/submit_address_info_response_model.dart';
import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/add_address/domain/entities/city_entity.dart';
import 'package:saayer/features/add_address/domain/entities/submit_address_info_entity.dart';
import 'package:saayer/features/add_address/domain/repositories/add_address_info_repo.dart';

@Injectable(as: AddAddressInfoRepo)
class AddAddressInfoRepoImpl implements AddAddressInfoRepo {
  final AddAddressInfoRDS addAddressInfoRDSImpl;

  const AddAddressInfoRepoImpl({
    required this.addAddressInfoRDSImpl,
  });

  @override
  Future<Either<Failure, SubmitAddressInfoEntity?>> submitAddressInfo(
      AddressInfoEntity addressInfoEntity) async {
    log("AddressInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final SubmitAddressInfoResponseModel result =
            await addAddressInfoRDSImpl.submitAddressInfo(addressInfoEntity);
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

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    log("AddressInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final GetCitiesResponseModel result =
            await addAddressInfoRDSImpl.getCities();
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
