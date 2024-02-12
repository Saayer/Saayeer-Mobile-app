import 'package:equatable/equatable.dart';

class SubmitAddressShipmentsEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const SubmitAddressShipmentsEntity(
      {required this.isSuccess, required this.message});

  @override
  List<Object?> get props => [isSuccess, message];

  SubmitAddressShipmentsEntity copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return SubmitAddressShipmentsEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }
}
