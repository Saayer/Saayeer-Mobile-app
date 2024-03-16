import 'package:equatable/equatable.dart';

class ShipmentTrackingEntity extends Equatable {
  final String trackingId;

  const ShipmentTrackingEntity({
    required this.trackingId,
  });

  @override
  List<Object> get props => [trackingId];
}
