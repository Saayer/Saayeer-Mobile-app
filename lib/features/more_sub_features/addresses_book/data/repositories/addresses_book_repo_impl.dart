import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/more_sub_features/addresses_book/data/data_sources/remote/addresses_book_RDS.dart';
import 'package:saayer/features/more_sub_features/addresses_book/data/models/get_addresses_response_model.dart';
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart';

@Injectable(as: AddressesBookRepo)
class AddressesBookRepoImpl implements AddressesBookRepo {
  final AddressesBookRDS addressesBookRDSImpl;

  const AddressesBookRepoImpl({
    required this.addressesBookRDSImpl,
  });

  @override
  Future<Either<Failure, List<AddressInfoEntity>>> getAddresses() async {
    log("AddressInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final GetAddressesResponseModel result =
            await addressesBookRDSImpl.getAddresses();
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
