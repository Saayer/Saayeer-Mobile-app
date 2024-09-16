enum HomeErrorStatus { ERROR_GET_USER_PROFILE, ERROR_HOME }

enum ShipmentsStatisticsTypes{
  NEW_SHIPMENT._(name:'new_shipment'),
  SHIPMENTS._(name:'shipments'),
  REQUESTED._(name:'requested'),
  PICKED._(name:'picked'),
  SHIPPING._(name:'shipping'),
  DELIVERED._(name:'delivered');

  final String name;
  const ShipmentsStatisticsTypes._({required this.name});
}
