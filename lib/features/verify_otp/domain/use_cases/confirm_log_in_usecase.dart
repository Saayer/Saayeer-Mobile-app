import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/log_in/domain/entities/log_in_entity.dart';
import 'package:saayer/features/log_in/domain/entities/submit_log_in_entity.dart';
import 'package:saayer/features/log_in/domain/repositories/log_in_repo.dart';
import 'package:saayer/features/verify_otp/domain/entities/submit_verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart';
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart';

@injectable
class ConfirmLogInUseCase
    implements
        BaseUseCase<Future<Either<Failure, SubmitVerifyOtpEntity?>>,
            ConfirmLogInParameters> {
  final VerifyOtpRepo verifyOtpRepoImpl;

  const ConfirmLogInUseCase({
    required this.verifyOtpRepoImpl,
  });

  @override
  Future<Either<Failure, SubmitVerifyOtpEntity?>> call(
      ConfirmLogInParameters parameters) async {
    return await verifyOtpRepoImpl.confirmLogIn(parameters.verifyOtpEntity);
  }
}

class ConfirmLogInParameters extends Equatable {
  final VerifyOtpEntity verifyOtpEntity;

  const ConfirmLogInParameters({required this.verifyOtpEntity});

  @override
  List<Object?> get props => [verifyOtpEntity];
}
