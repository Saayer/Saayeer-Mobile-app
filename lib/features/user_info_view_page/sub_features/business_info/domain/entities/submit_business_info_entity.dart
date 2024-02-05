import 'package:equatable/equatable.dart';

class SubmitBusinessInfoEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const SubmitBusinessInfoEntity({
    required this.isSuccess,
    required this.message,
  });

  SubmitBusinessInfoEntity copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return SubmitBusinessInfoEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [isSuccess, message];
}
