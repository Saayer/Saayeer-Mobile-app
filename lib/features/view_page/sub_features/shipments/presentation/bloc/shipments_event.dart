part of 'shipments_bloc.dart';

abstract class ShipmentsEvent extends Equatable {
  const ShipmentsEvent();
}

class InitShipments extends ShipmentsEvent {
  @override
  List<Object> get props => [];
}

class SelectShipmentType extends ShipmentsEvent {
  final ShipmentsTypes shipmentsType;

  const SelectShipmentType({
    required this.shipmentsType,
  });

  @override
  List<Object> get props => [shipmentsType];
}

class RefreshShipments extends ShipmentsEvent {
  @override
  List<Object> get props => [];
}