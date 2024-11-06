enum TrackingStatusTypes {
  REQUESTED._(name: 'requested'),
  PICKED._(name: 'picked'),
  SHIPPING._(name: 'shipping'),
  DELIVERED._(name: 'delivered');

  final String name;

  const TrackingStatusTypes._({required this.name});
}

enum ShipmentTrackingDetailsErrorStatus {
  ERROR_GET_TRACKING,
}
