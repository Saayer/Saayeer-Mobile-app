import 'package:equatable/equatable.dart';

class SubmitPersonalInfoEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const SubmitPersonalInfoEntity(
      {required this.isSuccess, required this.message});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitPersonalInfoEntity copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return SubmitPersonalInfoEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }
}
