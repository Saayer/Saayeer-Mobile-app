part of 'verify_otp_bloc.dart';

class VerifyOtpState extends Equatable {
  final StateHelper stateHelper;
  final VerifyOtpEntity? verifyOtpEntity;
  final SubmitVerifyOtpEntity? submitVerifyOtpEntity;
  final bool isVerified, resetExpiryDate, isOtpResent;

  const VerifyOtpState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.verifyOtpEntity,
      this.submitVerifyOtpEntity,
      this.isVerified = false,
      this.resetExpiryDate = false,
      this.isOtpResent = false});

  VerifyOtpState copyWith({
    StateHelper? stateHelper,
    VerifyOtpEntity? verifyOtpEntity,
    SubmitVerifyOtpEntity? submitVerifyOtpEntity,
    bool? isVerified,
    bool? resetExpiryDate,
    bool? isOtpResent,
  }) {
    return VerifyOtpState(
      stateHelper: stateHelper ?? this.stateHelper,
      verifyOtpEntity: verifyOtpEntity ?? this.verifyOtpEntity,
      submitVerifyOtpEntity:
          submitVerifyOtpEntity ?? this.submitVerifyOtpEntity,
      isVerified: isVerified ?? false,
      resetExpiryDate: resetExpiryDate ?? false,
      isOtpResent: isOtpResent ?? false,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        verifyOtpEntity,
        submitVerifyOtpEntity,
        isVerified,
      ];
}
