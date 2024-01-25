import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart';

@injectable
class LogInUseCase
    implements
        BaseUseCase<Future<Either<Failure, SubmitLogInEntity?>>,
            LogInParameters> {
  Future<Either<Failure, SubmitLogInEntity?>> call(
      LogInParameters parameters) async {
    return await getIt<LogInRepo>().logIn(parameters.logInEntity);
  }
}

class LogInParameters extends Equatable {
  final LogInEntity logInEntity;

  const LogInParameters(this.logInEntity);

  @override
  List<Object?> get props => [logInEntity];
}
