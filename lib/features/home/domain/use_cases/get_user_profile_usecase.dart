import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/home/domain/repositories/home_repo.dart';

@injectable
class GetUserProfileUseCase
    implements
        BaseUseCase<Future<Either<Failure, ClientGetDto>>, NoParameters> {
  final HomeRepo homeRepoImpl;

  const GetUserProfileUseCase({
    required this.homeRepoImpl,
  });

  @override
  Future<Either<Failure, ClientGetDto>> call(
      NoParameters parameters) async {
    return await homeRepoImpl.getUserProfile();
  }
}
