part of 'shipment_details_bloc.dart';

abstract class ShipmentDetailsEvent extends Equatable {
  const ShipmentDetailsEvent();
}

class InitShipmentDetails extends ShipmentDetailsEvent {
  final ShipmentEntity shipmentEntity;

  const InitShipmentDetails({
    required this.shipmentEntity,
  });

  InitShipmentDetails copyWith({
    ShipmentEntity? shipmentEntity,
  }) {
    return InitShipmentDetails(
      shipmentEntity: shipmentEntity ?? this.shipmentEntity,
    );
  }

  @override
  List<Object> get props => [shipmentEntity];
}
