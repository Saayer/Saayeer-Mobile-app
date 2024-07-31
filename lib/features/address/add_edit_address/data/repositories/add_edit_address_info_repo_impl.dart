import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:openapi/src/model/address_look_up_dto.dart';
import 'package:saayer/core/API/status_code.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart';

@Injectable(as: AddEditAddressInfoRepo)
class AddEditAddressInfoRepoImpl implements AddEditAddressInfoRepo {

  ///Todo: Need Modification after add it to new server
  late Openapi sayeerOpenapi;

  AddEditAddressInfoRepoImpl();

  @override
  Future<Either<Failure, CustomerGetDto?>> submitAddressInfo(CustomerAddDto customerAddDto) async {
    log("submitAddressInfo");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        sayeerOpenapi = Openapi(
            dio: Dio(BaseOptions(
                baseUrl: 'http://34.140.10.214/saayer-v0-2/',
                validateStatus: (status) {
                  return (status == StatusCode.ok) || (status == StatusCode.success);
                },

                ///ConnectionTimeOut in ms
                connectTimeout: const Duration(milliseconds: 20000))));
        final Response<CustomerGetDto> result = await sayeerOpenapi.getCustomersApi().apiCustomersPost(customerAddDto: customerAddDto);
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
      ///Todo: Need Modification after add it to new server
      try {
        ///
        sayeerOpenapi = Openapi(
            dio: Dio(BaseOptions(
                baseUrl: 'http://34.140.10.214/saayer-v0-2/',
                validateStatus: (status) {
                  return (status == StatusCode.ok) || (status == StatusCode.success);
                },

                ///ConnectionTimeOut in ms
                connectTimeout: const Duration(milliseconds: 20000))));

        ///
        final result = await sayeerOpenapi.getAddressLookupsApi().apiAddressLookupsCountriesGet();
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
      ///Todo: Need Modification after add it to new server
      try {
        ///
        sayeerOpenapi = Openapi(
            dio: Dio(BaseOptions(
                baseUrl: 'http://34.140.10.214/saayer-v0-2/',
                validateStatus: (status) {
                  return (status == StatusCode.ok) || (status == StatusCode.success);
                },

                ///ConnectionTimeOut in ms
                connectTimeout: const Duration(milliseconds: 20000))));

        ///
        final result = await sayeerOpenapi
            .getAddressLookupsApi()
            .apiAddressLookupsGovernoratesCountryIdGet(countryId: countryId ?? 0);
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
  Future<Either<Failure, List<AddressLookUpDto>>> getCities(int? governorateId) async {
    log("AddressWidgetsRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      ///Todo: Need Modification after add it to new server
      try {
        ///
        sayeerOpenapi = Openapi(
            dio: Dio(BaseOptions(
                baseUrl: 'http://34.140.10.214/saayer-v0-2/',
                validateStatus: (status) {
                  return (status == StatusCode.ok) || (status == StatusCode.success);
                },

                ///ConnectionTimeOut in ms
                connectTimeout: const Duration(milliseconds: 20000))));

        ///
        final result = await sayeerOpenapi
            .getAddressLookupsApi()
            .apiAddressLookupsCitiesGovernorateIdGet(governorateId: governorateId ?? 0);
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
  Future<Either<Failure, List<AddressLookUpDto>>> getAreas(int? cityId) async {
    log("AddressWidgetsRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      ///Todo: Need Modification after add it to new server
      try {
        ///
        sayeerOpenapi = Openapi(
            dio: Dio(BaseOptions(
                baseUrl: 'http://34.140.10.214/saayer-v0-2/',
                validateStatus: (status) {
                  return (status == StatusCode.ok) || (status == StatusCode.success);
                },

                ///ConnectionTimeOut in ms
                connectTimeout: const Duration(milliseconds: 20000))));

        ///
        final result = await sayeerOpenapi.getAddressLookupsApi().apiAddressLookupsAreasCityIdGet(cityId: cityId ?? 0);
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
        sayeerOpenapi = Openapi(
            dio: Dio(BaseOptions(
                baseUrl: 'http://34.140.10.214/saayer-v0-2/',
                validateStatus: (status) {
                  return (status == StatusCode.ok) || (status == StatusCode.success);
                },

                ///ConnectionTimeOut in ms
                connectTimeout: const Duration(milliseconds: 20000))));
        final Response<void> result = await sayeerOpenapi.getCustomersApi().apiCustomersPut(customerAddDto: customerAddDto);
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
