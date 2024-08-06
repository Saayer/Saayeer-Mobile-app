import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/API/network_keys/network_keys.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/openAPI/openAPI_config.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/address/addresses_book/data/data_sources/remote/addresses_book_RDS.dart';
import 'package:saayer/features/address/addresses_book/domain/repositories/addresses_book_repo.dart';

@Injectable(as: AddressesBookRepo)
class AddressesBookRepoImpl implements AddressesBookRepo {
  final AddressesBookRDS addressesBookRDSImpl;

  final OpenAPIConfig openAPIConfig;

  AddressesBookRepoImpl({required this.addressesBookRDSImpl, required this.openAPIConfig});

  @override
  Future<Either<Failure, List<CustomerGetDto>>> getAddresses(CustomerQuery? customerQuery) async {
    log("AddressInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi.getCustomersApi().apiCustomersGetCustomersByPost(
            customerQuery: customerQuery, apiKey: NetworkKeys.init().networkKeys.apiKey);
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
  Future<Either<Failure, void>> deleteAddresses(int addressId) async {
    log("deleteAddressesRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getCustomersApi()
            .apiCustomersIdDelete(id: addressId, apiKey: NetworkKeys.init().networkKeys.apiKey);
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
  Future<Either<Failure, void>> editAddresses(CustomerAddDto? customerDto) async {
    log("editAddressesRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        ///
        final result = await openAPIConfig.openapi
            .getCustomersApi()
            .apiCustomersPut(customerAddDto: customerDto, apiKey: NetworkKeys.init().networkKeys.apiKey);
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
