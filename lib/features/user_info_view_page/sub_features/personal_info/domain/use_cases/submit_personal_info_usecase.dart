import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/submit_personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart';

@injectable
class SubmitPersonalInfoUseCase
    implements
        BaseUseCase<Future<Either<Failure, SubmitPersonalInfoEntity?>>,
            PersonalInfoParameters> {
  final PersonalInfoRepo personalInfoRepoImpl;

  const SubmitPersonalInfoUseCase({
    required this.personalInfoRepoImpl,
  });

  @override
  Future<Either<Failure, SubmitPersonalInfoEntity?>> call(
      PersonalInfoParameters parameters) async {
    return await personalInfoRepoImpl
        .submitPersonalInfo(parameters.personalInfoEntity);
  }
}

class PersonalInfoParameters extends Equatable {
  final PersonalInfoEntity personalInfoEntity;

  const PersonalInfoParameters({required this.personalInfoEntity});

  @override
  List<Object?> get props => [personalInfoEntity];
}
