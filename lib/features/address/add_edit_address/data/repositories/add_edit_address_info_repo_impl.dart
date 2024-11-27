import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:openapi/src/model/address_look_up_dto.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart';

@Injectable(as: AddEditAddressInfoRepo)
class AddEditAddressInfoRepoImpl implements AddEditAddressInfoRepo {
  final OpenAPIConfig openAPIConfig;

  AddEditAddressInfoRepoImpl({required this.openAPIConfig});

  @override
  Future<Either<Failure, CustomerGetDto?>> submitAddressInfo(CustomerAddDto customerAddDto) async {
    log("submitAddressInfo");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final Response<CustomerGetDto> result = await openAPIConfig.openapi
            .getCustomersApi()
            .apiCustomersPost(customerAddDto: customerAddDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        log("submitAddressInfo Right $result");
        if (result.data != null) {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        log("submitAddressInfo Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    log("AddressInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, List<AddressLookUpDto>>> getCountries() async {
    log("AddressWidgetsRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getAddressLookupsApi()
            .apiAddressLookupsCountriesGet(apiKey: NetworkKeys.init().networkKeys.apiKey);
        log("AddressWidgetsRepoImpl Right $result");
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "Get Countries failed"));
        }
      } catch (e) {
        log("AddressWidgetsRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Get Countries failed"));
      }
    }
    log("AddressInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, List<AddressLookUpDto>>> getGovernorates(int? countryId) async {
    log("AddressWidgetsRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getAddressLookupsApi().apiAddressLookupsGovernoratesCountryIdGet(
            countryId: countryId ?? 0, apiKey: NetworkKeys.init().networkKeys.apiKey);
        log("AddressWidgetsRepoImpl Right $result");
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "Get Governorate failed"));
        }
      } catch (e) {
        log("AddressWidgetsRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Get Governorate failed"));
      }
    }
    log("AddressInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, List<CityGetDto>>> getCities(int? governorateId) async {
    log("AddressWidgetsRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getAddressLookupsApi().apiAddressLookupsCitiesGovernorateIdGet(
            governorateId: governorateId ?? 0, apiKey: NetworkKeys.init().networkKeys.apiKey);
        log("AddressWidgetsRepoImpl Right $result");
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "Get City failed"));
        }
      } catch (e) {
        log("AddressWidgetsRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Get City failed"));
      }
    }
    log("AddressInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> updateAddressInfo(CustomerAddDto customerAddDto) async {
    log("updateAddressInfo");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final Response<void> result = await openAPIConfig.openapi
            .getCustomersApi()
            .apiCustomersPut(customerAddDto: customerAddDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
        log("updateAddressInfo Right $result");
        if (result.statusMessage == 'OK') {
          return Right(result.data);
        } else {
          return Left(Failure(failureMessage: "Request failed"));
        }
      } catch (e) {
        log("updateAddressInfo Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Request failed"));
      }
    }
    log("updateAddressInfo No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
