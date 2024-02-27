import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/add_address/domain/entities/submit_address_info_entity.dart';
import 'package:saayer/features/add_address/domain/repositories/add_address_info_repo.dart';

@injectable
class SubmitAddressInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, SubmitAddressInfoEntity?>>,
            AddressInfoParameters> {
  final AddressInfoRepo addressInfoRepoImpl;

  const SubmitAddressInfoUseCase({
    required this.addressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, SubmitAddressInfoEntity?>> call(
      AddressInfoParameters parameters) async {
    return await addressInfoRepoImpl
        .submitAddressInfo(parameters.addressInfoEntity);
  }
}

class AddressInfoParameters extends Equatable {
  final AddressInfoEntity addressInfoEntity;

  const AddressInfoParameters({required this.addressInfoEntity});

  @override
  List<Object?> get props => [addressInfoEntity];
}
