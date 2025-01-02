import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/domain/repositories/saayer_gain_repo.dart';

@injectable
class GetSaayerGainUseCase implements BaseUseCase<Future<Either<Failure, num>>, NoParameters> {
  final SaayerGainRepo saayerGainRepo;

  const GetSaayerGainUseCase({
    required this.saayerGainRepo,
  });

  @override
  Future<Either<Failure, num>> call(NoParameters parameters) async {
    return await saayerGainRepo.getSaayerGain();
  }
}
