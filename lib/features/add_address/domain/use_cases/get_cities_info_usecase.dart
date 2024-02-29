import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/add_address/domain/entities/city_entity.dart';
import 'package:saayer/features/add_address/domain/repositories/add_address_info_repo.dart';

@injectable
class GetCitiesUseCase
    implements
        BaseUseCase<Future<Either<Failure, List<CityEntity>>>, NoParameters> {
  final AddAddressInfoRepo addAddressInfoRepoImpl;

  const GetCitiesUseCase({
    required this.addAddressInfoRepoImpl,
  });

  @override
  Future<Either<Failure, List<CityEntity>>> call(
      NoParameters parameters) async {
    return await addAddressInfoRepoImpl.getCities();
  }
}
