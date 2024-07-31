import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart';
@injectable
class GetAreasUseCase
    implements
        BaseUseCase<Future<Either<Failure, List<AddressLookUpDto>>>, int?> {
  final AddEditAddressInfoRepo addAddressInfoRepoImpl;

  const GetAreasUseCase({
    required this.addAddressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, List<AddressLookUpDto>>> call(
      int? cityId) async {
    return await addAddressInfoRepoImpl.getAreas(cityId);
  }
}
