import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/status_code.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS.dart';
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart';

@Injectable(as: AddressesBookRepo)
class AddressesBookRepoImpl implements AddressesBookRepo {
  final AddressesBookRDS addressesBookRDSImpl;

  ///Todo: Need Modification after add it to new server
  late Openapi sayeerOpenapi;

  AddressesBookRepoImpl({
    required this.addressesBookRDSImpl,
  });

  @override
  Future<Either<Failure, List<CustomerGetDto>>> getAddresses(CustomerQuery? customerQuery) async {
    log("AddressInfoRepoImpl");
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

        ///
        final result = await sayeerOpenapi.getCustomersApi().apiCustomersGetCustomersByPost(customerQuery: customerQuery);
        log("AddressInfoRepoImpl Right $result");
        if (result.data != null) {
          return Right(result.data!.toList());
        } else {
          return Left(Failure(failureMessage: "get Addresses failed"));
        }
      } catch (e) {
        log("AddressInfoRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "get Addresses failed"));
      }
    }
    log("AddressInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> deleteAddresses(int addressId) async{
    log("deleteAddressesRepoImpl");
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

        ///
        final result = await sayeerOpenapi.getCustomersApi().apiCustomersIdDelete(id: addressId);
        log("DeleteAddressesRepoImpl Right $result");
        return Right(result.data);
      } catch (e) {
        log("DeleteAddressesRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "delete Addresses failed"));
      }
    }
    log("DeleteAddressesRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }

  @override
  Future<Either<Failure, void>> editAddresses(CustomerAddDto? customerDto) async{
    log("editAddressesRepoImpl");
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

        ///
        final result = await sayeerOpenapi.getCustomersApi().apiCustomersPut(customerAddDto: customerDto);
        log("editAddressesRepoImpl Right $result");
        return Right(result.data);
            } catch (e) {
        log("edit AddressesRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "edit Addresses failed"));
      }
    }
    log("EditAddressesRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
