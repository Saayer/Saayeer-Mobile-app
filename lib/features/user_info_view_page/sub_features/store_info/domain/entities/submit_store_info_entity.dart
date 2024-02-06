import 'package:equatable/equatable.dart';

class SubmitStoreInfoEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const SubmitStoreInfoEntity(
      {required this.isSuccess, required this.message});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitStoreInfoEntity copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return SubmitStoreInfoEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }
}
