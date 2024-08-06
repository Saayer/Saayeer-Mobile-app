part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class InitVerifyOtpEvent extends VerifyOtpEvent {
  final TokenRequestDto tokenRequestDto;

  const InitVerifyOtpEvent({
    required this.tokenRequestDto,
  });

  @override
  List<Object> get props => [tokenRequestDto];
}

class ResendOtpEvent extends VerifyOtpEvent {
  @override
  List<Object> get props => [];
}

class CheckOtpEvent extends VerifyOtpEvent {
  final String otp;

  const CheckOtpEvent({
    required this.otp,
  });

  @override
  List<Object> get props => [otp];
}
