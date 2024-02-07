import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_card/data/data_sources/remote/user_card_RDS.dart';
import 'package:saayer/features/user_card/data/models/user_card_response_model.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_card/domain/repositories/user_card_repo.dart';

@Injectable(as: UserCardRepo)
class UserCardRepoImpl implements UserCardRepo {
  final UserCardRDS userCardRDSImpl;

  const UserCardRepoImpl({
    required this.userCardRDSImpl,
  });

  @override
  Future<Either<Failure, UserCardEntity?>> getProfile() async {
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final UserCardResponseModel result = await userCardRDSImpl.getProfile();
        log("UserCardRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "UserCard failed"));
        }
      } catch (e) {
        log("UserCardRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "UserCard failed"));
      }
    }
    log("UserCardRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
