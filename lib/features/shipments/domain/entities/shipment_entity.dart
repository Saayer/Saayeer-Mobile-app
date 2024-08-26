import 'package:equatable/equatable.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';

abstract class ShipmentEntity extends Equatable {
  final ShipmentsListTypes shipmentsType;
  final String id, date, amount;

  final ShipmentsStatus shipmentStatus;

  const ShipmentEntity({
    required this.shipmentsType,
    required this.id,
    required this.date,
    required this.amount,
    required this.shipmentStatus,
  });

  @override
  List<Object> get props => [id];
}
