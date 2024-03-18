import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';
import 'package:saayer/common/address_widgets/domain/repositories/address_widgets_repo.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
@injectable
class GetCitiesUseCase
    implements
        BaseUseCase<Future<Either<Failure, List<CityEntity>>>, NoParameters> {
  final AddressWidgetsRepo addressWidgetsRepoImpl;

  const GetCitiesUseCase({
    required this.addressWidgetsRepoImpl,
  });

  @override
  Future<Either<Failure, List<CityEntity>>> call(
      NoParameters parameters) async {
    return await addressWidgetsRepoImpl.getCities();
  }
}
