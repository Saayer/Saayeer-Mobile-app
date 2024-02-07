import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart';

@injectable
class UserCardUseCase
    implements
        BaseUseCase<Future<Either<Failure, UserCardEntity?>>, NoParameters> {
  final UserCardRepo userCardRepoImpl;

  const UserCardUseCase({
    required this.userCardRepoImpl,
  });

  @override
  Future<Either<Failure, UserCardEntity?>> call(NoParameters parameters) async {
    return await userCardRepoImpl.getProfile();
  }
}
