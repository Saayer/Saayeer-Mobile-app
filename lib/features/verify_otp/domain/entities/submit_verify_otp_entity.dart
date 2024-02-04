import 'package:equatable/equatable.dart';

class SubmitVerifyOtpEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const SubmitVerifyOtpEntity(
      {required this.isSuccess, required this.message});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitVerifyOtpEntity copyWith({
    bool? isSuccess,
    String? message
  }) {
    return SubmitVerifyOtpEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message
    );
  }
}
