import 'package:equatable/equatable.dart';

class SubmitPersonalInfoEntity extends Equatable {
  final bool isSuccess;
  final String message, otp;

  const SubmitPersonalInfoEntity(
      {required this.isSuccess, required this.message, required this.otp});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitPersonalInfoEntity copyWith({
    bool? isSuccess,
    String? message,
    String? otp,
  }) {
    return SubmitPersonalInfoEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
      otp: otp ?? this.otp,
    );
  }
}
