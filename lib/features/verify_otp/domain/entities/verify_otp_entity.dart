import 'package:equatable/equatable.dart';

class VerifyOtpEntity extends Equatable {
  final String phoneNumber, otp;

  const VerifyOtpEntity({required this.phoneNumber, required this.otp});

  VerifyOtpEntity copyWith({
    String? phoneNumber,
    String? otp,
  }) {
    return VerifyOtpEntity(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object> get props => [phoneNumber];
}
