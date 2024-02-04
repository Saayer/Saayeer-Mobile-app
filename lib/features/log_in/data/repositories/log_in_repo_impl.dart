import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/network/network_info.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/log_in/data/data_sources/remote/log_in_RDS.dart';
import 'package:saayer/features/log_in/data/models/log_in_response_model.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart';

@Injectable(as: LogInRepo)
class LogInRepoImpl implements LogInRepo {
  final LogInRDS logInRDSImpl;

  const LogInRepoImpl({
    required this.logInRDSImpl,
  });

  @override
  Future<Either<Failure, SubmitLogInEntity?>> logIn(
      LogInEntity logInEntity) async {
    log("LogInRepoImpl");
    final bool isConnected = await getIt<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        final LogInResponseModel result = await logInRDSImpl.logIn(logInEntity);
        log("LogInRepoImpl Right $result");
        if (result != null) {
          return Right(result.toDomain());
        } else {
          return Left(Failure(failureMessage: "Log in failed"));
        }
      } catch (e) {
        log("LogInRepoImpl Failure ${e.toString()}");
        return Left(Failure(failureMessage: "Log in failed"));
      }
    }
    log("LogInRepoImpl No Internet Connection");
    return Left(Failure(failureMessage: "No Internet Connection"));
  }
}
