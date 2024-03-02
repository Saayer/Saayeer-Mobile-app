import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart';

@injectable
class GetAddressesUseCase
    implements
        BaseUseCase<Future<Either<Failure, List<AddressInfoEntity>>>,
            NoParameters> {
  final AddressesBookRepo addressesBookRepoImpl;

  const GetAddressesUseCase({
    required this.addressesBookRepoImpl,
  });

  @override
  Future<Either<Failure, List<AddressInfoEntity>>> call(
      NoParameters parameters) async {
    return await addressesBookRepoImpl.getAddresses();
  }
}
