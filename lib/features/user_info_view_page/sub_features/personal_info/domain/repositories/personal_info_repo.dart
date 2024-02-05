import 'package:saayer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/submit_personal_info_entity.dart';

abstract class PersonalInfoRepo {
  Future<Either<Failure, SubmitPersonalInfoEntity?>> submitPersonalInfo(PersonalInfoEntity personalInfoEntity);
}
