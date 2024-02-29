import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/repositories/home_repo.dart';

@injectable
class GetUserProfileUseCase
    implements
        BaseUseCase<Future<Either<Failure, UserProfileEntity>>, NoParameters> {
  final HomeRepo homeRepoImpl;

  const GetUserProfileUseCase({
    required this.homeRepoImpl,
  });

  @override
  Future<Either<Failure, UserProfileEntity>> call(
      NoParameters parameters) async {
    return await homeRepoImpl.getUserProfile();
  }
}
