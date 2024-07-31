import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/addresses_book/domain/repositories/addresses_book_repo.dart';

@injectable
class GetAddressesUseCase
    implements
        BaseUseCase<Future<Either<Failure, List<CustomerGetDto>>>,
            CustomerQuery?> {
  final AddressesBookRepo addressesBookRepoImpl;

  const GetAddressesUseCase({
    required this.addressesBookRepoImpl,
  });

  @override
  Future<Either<Failure, List<CustomerGetDto>>> call(
      CustomerQuery? customerQuery) async {
    return await addressesBookRepoImpl.getAddresses(customerQuery);
  }
}
