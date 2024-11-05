part of 'shipment_details_bloc.dart';

abstract class ShipmentDetailsEvent extends Equatable {
  const ShipmentDetailsEvent();
}

class InitShipmentDetails extends ShipmentDetailsEvent {
  final ShipmentGetDto shipmentDto;

  const InitShipmentDetails({
    required this.shipmentDto,
  });

  InitShipmentDetails copyWith({
    ShipmentGetDto? shipmentDto,
  }) {
    return InitShipmentDetails(
      shipmentDto: shipmentDto ?? this.shipmentDto,
    );
  }

  @override
  List<Object> get props => [shipmentDto];
}

class GetShipmentTrackingList extends ShipmentDetailsEvent {
  final int shipmentId;

  const GetShipmentTrackingList({
    required this.shipmentId,
  });

  @override
  List<Object?> get props => [shipmentId];
}

class DownloadShipment extends ShipmentDetailsEvent {
  final int shipmentId;
  final String labelUrl;

  const DownloadShipment({
    required this.shipmentId,
    required this.labelUrl,
  });

  @override
  List<Object?> get props => [
        shipmentId,
        labelUrl,
      ];
}
