import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@injectable
class GetAdminTotalPaidPerDaysUseCase implements BaseUseCase<Future<Either<Failure, AmountPerDateResponse>>, DateRangeDto> {
  final HomeRepo homeRepoImpl;

  const GetAdminTotalPaidPerDaysUseCase({
    required this.homeRepoImpl,
  });

  @override
  Future<Either<Failure, AmountPerDateResponse>> call(DateRangeDto dataRangeDto) async {
    return await homeRepoImpl.getAdminTotalPaidPerDays(dataRangeDto);
  }
}
