import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/addresses_book/domain/repositories/addresses_book_repo.dart';

@injectable
class DeleteAddressesUseCase implements BaseUseCase<Future<Either<Failure, void>>, int> {
  final AddressesBookRepo addressesBookRepoImpl;

  const DeleteAddressesUseCase({required this.addressesBookRepoImpl});

  @override
  Future<Either<Failure, void>> call(int addressId) async {
    return await addressesBookRepoImpl.deleteAddresses(addressId);
  }
}
