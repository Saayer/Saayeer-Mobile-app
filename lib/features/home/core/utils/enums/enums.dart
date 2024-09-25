enum HomeErrorStatus {
  ERROR_GET_USER_PROFILE,
  ERROR_GET_SHIPMENTS_COUNTS,
  ERROR_GET_TOTAL_SHIPMENTS_PER_DAYS,
  ERROR_GET_TOTAL_PAID_PER_DAYS,
}

enum ShipmentsStatisticsTypes {
  NEW_SHIPMENT._(name: 'new_shipment'),
  SHIPMENTS._(name: 'shipments'),
  REQUESTED._(name: 'requested'),
  PICKED._(name: 'picked'),
  SHIPPING._(name: 'onTheWay'),
  DELIVERED._(name: 'delivered');

  final String name;

  const ShipmentsStatisticsTypes._({required this.name});
}
