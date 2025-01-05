import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@injectable
class GetAdminTotalShipmentPerDaysUseCase implements BaseUseCase<Future<Either<Failure, CountPerDateResponse>>, DateRangeDto> {
  final HomeRepo homeRepoImpl;

  const GetAdminTotalShipmentPerDaysUseCase({
    required this.homeRepoImpl,
  });

  @override
  Future<Either<Failure, CountPerDateResponse>> call(DateRangeDto dataRangeDto) async {
    return await homeRepoImpl.getAdminTotalShipmentPerDays(dataRangeDto);
  }
}
