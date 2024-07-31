import 'package:equatable/equatable.dart';

class SubmitAddressInfoEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const SubmitAddressInfoEntity(
      {required this.isSuccess, required this.message});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitAddressInfoEntity copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return SubmitAddressInfoEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }
}
