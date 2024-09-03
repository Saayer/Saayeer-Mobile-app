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
