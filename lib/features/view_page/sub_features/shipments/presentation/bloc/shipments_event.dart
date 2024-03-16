part of 'shipments_bloc.dart';

abstract class ShipmentsEvent extends Equatable {
  const ShipmentsEvent();
}

class InitShipments extends ShipmentsEvent {
  final bool isFromHome;
  final bool isGuest;

  const InitShipments({this.isFromHome = false, required this.isGuest});

  @override
  List<Object?> get props => [isFromHome, isGuest];
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
