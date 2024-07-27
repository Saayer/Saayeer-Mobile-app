import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/add_address/domain/repositories/add_address_info_repo.dart';

@injectable
class SubmitAddressInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, CustomerGetDto?>>,
            CustomerAddDto> {
  final AddAddressInfoRepo addAddressInfoRepoImpl;

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

class AddressInfoParameters extends Equatable {
  final AddressInfoEntity addressInfoEntity;

  const AddressInfoParameters({required this.addressInfoEntity});

  @override
  List<Object?> get props => [addressInfoEntity];
}
