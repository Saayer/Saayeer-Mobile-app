import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/domain/repositories/saayer_gain_repo.dart';

@injectable
class UpdateSaayerGainUseCase implements BaseUseCase<Future<Either<Failure, void>>, GainRatioPost> {
  final SaayerGainRepo saayerGainRepo;

  const UpdateSaayerGainUseCase({required this.saayerGainRepo});

  @override
  Future<Either<Failure, void>> call(GainRatioPost gainRatioPost) async {
    return await saayerGainRepo.updateSaayerGain(gainRatioPost);
  }
}
