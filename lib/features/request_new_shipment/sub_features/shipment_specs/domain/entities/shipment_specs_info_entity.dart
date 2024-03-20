import 'package:equatable/equatable.dart';

class ShipmentSpecsISubmitnfoEntity extends Equatable {
  final bool isSuccess;
  final String message;

  const ShipmentSpecsISubmitnfoEntity(
      {required this.isSuccess, required this.message});

  @override
  List<Object?> get props => [isSuccess, message];

  ShipmentSpecsISubmitnfoEntity copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return ShipmentSpecsISubmitnfoEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }
}
