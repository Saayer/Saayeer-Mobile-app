import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@injectable
class GetTotalShipmentPerDaysUseCase implements BaseUseCase<Future<Either<Failure, List<CountPerDateDto>>>, DateRangeDto> {
  final HomeRepo homeRepoImpl;

  const GetTotalShipmentPerDaysUseCase({
    required this.homeRepoImpl,
  });

  @override
  Future<Either<Failure, List<CountPerDateDto>>> call(DateRangeDto dataRangeDto) async {
    return await homeRepoImpl.getTotalShipmentPerDays(dataRangeDto);
  }
}
