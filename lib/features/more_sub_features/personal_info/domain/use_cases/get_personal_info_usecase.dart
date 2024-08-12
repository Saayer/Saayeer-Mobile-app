import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/repositories/personal_info_repo.dart';

@injectable
class GetPersonalInfoUseCase implements BaseUseCase<Future<Either<Failure, ClientGetDto?>>, NoParameters> {
  final PersonalInfoRepo personalInfoRepoImpl;

  const GetPersonalInfoUseCase({
    required this.personalInfoRepoImpl,
  });

  @override
  Future<Either<Failure, ClientGetDto?>> call(NoParameters parameters) async {
    return await personalInfoRepoImpl.getPersonalInfo();
  }
}
