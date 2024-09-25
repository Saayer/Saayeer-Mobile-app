import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@injectable
class GetTotalPaidPerDaysUseCase implements BaseUseCase<Future<Either<Failure, List<AmountPerDateDto>>>, DateRangeDto> {
  final HomeRepo homeRepoImpl;

  const GetTotalPaidPerDaysUseCase({
    required this.homeRepoImpl,
  });

  @override
  Future<Either<Failure, List<AmountPerDateDto>>> call(DateRangeDto dataRangeDto) async {
    return await homeRepoImpl.getTotalPaidPerDays(dataRangeDto);
  }
}
