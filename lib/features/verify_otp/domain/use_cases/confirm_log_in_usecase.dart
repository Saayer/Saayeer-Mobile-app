import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/features/verify_otp/domain/repositories/verify_otp_repo.dart';

@injectable
class ConfirmLogInUseCase
    implements
        BaseUseCase<Future<Either<Failure, TokenResponseDto?>>,
            TokenRequestDto> {
  final VerifyOtpRepo verifyOtpRepoImpl;

  const ConfirmLogInUseCase({
    required this.verifyOtpRepoImpl,
  });

  @override
  Future<Either<Failure, TokenResponseDto?>> call(
      TokenRequestDto parameters) async {
    return await verifyOtpRepoImpl.confirmLogIn(parameters);
  }
}
