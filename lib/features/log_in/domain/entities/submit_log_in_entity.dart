import 'package:equatable/equatable.dart';

class SubmitLogInEntity extends Equatable {
  final bool isSuccess;
  final String message, otp;

  const SubmitLogInEntity(
      {required this.isSuccess, required this.message, required this.otp});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitLogInEntity copyWith({
    bool? isSuccess,
    String? message,
    String? otp,
  }) {
    return SubmitLogInEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
      otp: otp ?? this.otp,
    );
  }
}
