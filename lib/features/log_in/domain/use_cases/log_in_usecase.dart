import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart';

@injectable
class LogInUseCase
    implements
        BaseUseCase<Future<Either<Failure, LoginResponseDto?>>,
            LogInParameters> {
  final LogInRepo logInRepoImpl;

  const LogInUseCase({
    required this.logInRepoImpl,
  });

  @override
  Future<Either<Failure, LoginResponseDto?>> call(
      LogInParameters parameters) async {
    return await logInRepoImpl.logIn(parameters.loginRequestDto);
  }
}

class LogInParameters extends Equatable {
  final LoginRequestDto loginRequestDto;

  const LogInParameters({required this.loginRequestDto});

  @override
  List<Object?> get props => [loginRequestDto];
}
