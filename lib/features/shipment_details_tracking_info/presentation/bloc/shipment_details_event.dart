part of 'shipment_details_bloc.dart';

abstract class ShipmentDetailsEvent extends Equatable {
  const ShipmentDetailsEvent();
}

class InitShipmentDetails extends ShipmentDetailsEvent {
  final ShipmentGetDto shipmentDto;
  final ShipmentGetDtoExtended adminShipmentDto;

  const InitShipmentDetails({
    required this.shipmentDto,
    required this.adminShipmentDto,
  });

  InitShipmentDetails copyWith({
    ShipmentGetDto? shipmentDto,
    ShipmentGetDtoExtended? adminShipmentDto,
  }) {
    return InitShipmentDetails(
      shipmentDto: shipmentDto ?? this.shipmentDto,
      adminShipmentDto: adminShipmentDto ?? this.adminShipmentDto,
    );
  }

  @override
  List<Object> get props => [
        shipmentDto,
        adminShipmentDto,
      ];
}

class GetShipmentTrackingList extends ShipmentDetailsEvent {
  final int shipmentId;

  const GetShipmentTrackingList({
    required this.shipmentId,
  });

  @override
  List<Object?> get props => [shipmentId];
}
