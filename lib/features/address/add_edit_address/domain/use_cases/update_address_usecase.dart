import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart';

@injectable
class UpdateAddressUseCase implements BaseUseCase<Future<Either<Failure, void>>, CustomerAddDto> {
  final AddEditAddressInfoRepo addAddressInfoRepoImpl;

  const UpdateAddressUseCase({
    required this.addAddressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, void>> call(CustomerAddDto parameters) async {
    return await addAddressInfoRepoImpl.updateAddressInfo(parameters);
  }
}
