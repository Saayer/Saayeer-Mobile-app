import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/data_sources/remote/personal_info_RDS.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/data/models/personal_info_response_model.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/submit_personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/repositories/personal_info_repo.dart';

@Injectable(as: PersonalInfoRepo)
class PersonalInfoRepoImpl implements PersonalInfoRepo {
  final PersonalInfoRDS personalInfoRDSImpl;

  const PersonalInfoRepoImpl({
    required this.personalInfoRDSImpl,
  });

  @override
  Future<Either<Failure, SubmitPersonalInfoEntity?>> submitPersonalInfo(
      PersonalInfoEntity personalInfoEntity) async {
    log("PersonalInfoRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final PersonalInfoResponseModel result =
            await personalInfoRDSImpl.submitPersonalInfo(personalInfoEntity);
        log("PersonalInfoRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "Log in failed"));
        }
      } catch (e) {
        log("PersonalInfoRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Log in failed"));
      }
    }
    log("PersonalInfoRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
