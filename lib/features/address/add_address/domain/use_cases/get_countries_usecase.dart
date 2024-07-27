import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_address/domain/repositories/add_address_info_repo.dart';

@injectable
class GetCountriesUseCase implements BaseUseCase<Future<Either<Failure, List<AddressLookUpDto>>>, NoParameters> {
  final AddAddressInfoRepo addAddressInfoRepoImpl;

  const GetCountriesUseCase({
    required this.addAddressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, List<AddressLookUpDto>>> call(NoParameters parameters) async {
    return await addAddressInfoRepoImpl.getCountries();
  }
}
