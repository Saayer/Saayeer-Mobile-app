import 'package:equatable/equatable.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';

class ShipmentDetailsEntity extends Equatable {
  final String id,
      type,
      weight,
      price,
      date,
      senderName,
      senderAddress,
      receiverName,
      receiverAddress,
      shippingFees,
      totalPrice;

  final ShipmentsTypes shipmentsType;

  final ShipmentStatus shipmentStatus;

  const ShipmentDetailsEntity(
      {required this.id,
      required this.type,
      required this.weight,
      required this.price,
      required this.date,
      required this.senderName,
      required this.senderAddress,
      required this.receiverName,
      required this.receiverAddress,
      required this.shippingFees,
      required this.totalPrice,
      required this.shipmentsType,
      required this.shipmentStatus});

  @override
  List<Object> get props => [id];

  ShipmentDetailsEntity copyWith({
    String? id,
    String? type,
    String? weight,
    String? price,
    String? date,
    String? senderName,
    String? senderAddress,
    String? receiverName,
    String? receiverAddress,
    String? shippingFees,
    String? totalPrice,
    ShipmentsTypes? shipmentsType,
    ShipmentStatus? shipmentStatus,
  }) {
    return ShipmentDetailsEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      date: date ?? this.date,
      senderName: senderName ?? this.senderName,
      senderAddress: senderAddress ?? this.senderAddress,
      receiverName: receiverName ?? this.receiverName,
      receiverAddress: receiverAddress ?? this.receiverAddress,
      shippingFees: shippingFees ?? this.shippingFees,
      totalPrice: totalPrice ?? this.totalPrice,
      shipmentsType: shipmentsType ?? this.shipmentsType,
      shipmentStatus: shipmentStatus ?? this.shipmentStatus,
    );
  }
}
