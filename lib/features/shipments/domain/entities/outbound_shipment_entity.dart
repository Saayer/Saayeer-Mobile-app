import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/domain/entities/shipment_entity.dart';

class OutboundShipmentEntity extends ShipmentEntity {
  final String receiverName;

  const OutboundShipmentEntity({
    super.shipmentsType = ShipmentsTypes.OUTBOUND,
    required super.id,
    required super.date,
    required super.amount,
    required this.receiverName,
    required super.shipmentStatus,
  });

  OutboundShipmentEntity copyWith({
    ShipmentsTypes? shipmentsType,
    String? id,
    String? date,
    String? amount,
    String? receiverName,
    ShipmentStatus? shipmentStatus,
  }) {
    return OutboundShipmentEntity(
      shipmentsType: shipmentsType ?? this.shipmentsType,
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      receiverName: receiverName ?? this.receiverName,
      shipmentStatus: shipmentStatus ?? this.shipmentStatus,
    );
  }

  @override
  List<Object> get props => [
        super.shipmentsType,
        super.id,
        super.date,
        super.amount,
        receiverName,
        super.shipmentStatus
      ];
}
