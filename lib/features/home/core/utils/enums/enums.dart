enum HomeErrorStatus {
  ERROR_GET_USER_PROFILE,
  ERROR_GET_SHIPMENTS_COUNTS,
  ERROR_GET_TOTAL_SHIPMENTS_PER_DAYS,
  ERROR_GET_TOTAL_PAID_PER_DAYS,
}

enum HomeRequestState {
  LOADING_SHIPMENTS_COUNT,
  LOADED_SHIPMENTS_COUNT,
  ERROR_SHIPMENTS_COUNT,
  SUCCESS_SHIPMENTS_COUNT,
  LOADING_SHIPMENTS_COUNT_PER_DAY,
  LOADED_SHIPMENTS_COUNT_PER_DAY,
  ERROR_SHIPMENTS_COUNT_PER_DAY,
  SUCCESS_SHIPMENTS_COUNT_PER_DAY,
  LOADING_PAID_COUNT_PER_DAY,
  LOADED_PAID_COUNT_PER_DAY,
  ERROR_PAID_COUNT_PER_DAY,
  SUCCESS_PAID_COUNT_PER_DAY,
}

enum ShipmentsStatisticsTypes {
  NEW_SHIPMENT._(name: 'new_shipment'),
  CLIENTS._(name: 'clients'),
  SHIPMENTS._(name: 'shipments'),
  REQUESTED._(name: 'requested'),
  PICKED._(name: 'picked'),
  SHIPPING._(name: 'onTheWay'),
  DELIVERED._(name: 'delivered');

  final String name;

  const ShipmentsStatisticsTypes._({required this.name});
}
