part of 'verify_otp_bloc.dart';

@immutable
class VerifyOtpState extends Equatable {
  final StateHelper stateHelper;
  final TokenRequestDto? tokenRequestDto;
  final TokenResponseDto? tokenResponseDto;
  final bool isVerified, resetExpiryDate, isOtpResent;

   const VerifyOtpState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.tokenRequestDto,
      this.tokenResponseDto,
      this.isVerified = false,
      this.resetExpiryDate = false,
      this.isOtpResent = false});

  VerifyOtpState copyWith({
    StateHelper? stateHelper,
    TokenRequestDto? tokenRequestDto,
    TokenResponseDto? tokenResponseDto,
    bool? isVerified,
    bool? resetExpiryDate,
    bool? isOtpResent,
  }) {
    return VerifyOtpState(
      stateHelper: stateHelper ?? this.stateHelper,
      tokenRequestDto: tokenRequestDto ?? this.tokenRequestDto,
      tokenResponseDto:
      tokenResponseDto ?? this.tokenResponseDto,
      isVerified: isVerified ?? false,
      resetExpiryDate: resetExpiryDate ?? false,
      isOtpResent: isOtpResent ?? false,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        tokenRequestDto,
        tokenResponseDto,
        isVerified,
      ];
}
