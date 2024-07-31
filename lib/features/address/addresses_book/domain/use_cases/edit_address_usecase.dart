import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/addresses_book/domain/repositories/addresses_book_repo.dart';

@injectable
class EditAddressesUseCase implements BaseUseCase<Future<Either<Failure, void>>, CustomerAddDto?> {
  final AddressesBookRepo addressesBookRepoImpl;

  const EditAddressesUseCase({required this.addressesBookRepoImpl});

  @override
  Future<Either<Failure, void>> call(CustomerAddDto? customerDto) async {
    return await addressesBookRepoImpl.editAddresses(customerDto);
  }
}
