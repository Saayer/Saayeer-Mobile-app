import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/repositories/add_edit_address_info_repo.dart';

@injectable
class SubmitAddressInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, CustomerGetDto?>>,
            CustomerAddDto> {
  final AddEditAddressInfoRepo addAddressInfoRepoImpl;

  const SubmitAddressInfoUseCase({
    required this.addAddressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, CustomerGetDto?>> call(
      CustomerAddDto parameters) async {
    return await addAddressInfoRepoImpl
        .submitAddressInfo(parameters);
  }
}
