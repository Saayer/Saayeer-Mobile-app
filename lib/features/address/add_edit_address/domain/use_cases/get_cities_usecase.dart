import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart';
@injectable
class GetCitiesUseCase
    implements
        BaseUseCase<Future<Either<Failure, List<CityGetDto>>>, int?> {
  final AddEditAddressInfoRepo addAddressInfoRepoImpl;

  const GetCitiesUseCase({
    required this.addAddressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, List<CityGetDto>>> call(
      int? governorateId) async {
    return await addAddressInfoRepoImpl.getCities(governorateId);
  }
}
