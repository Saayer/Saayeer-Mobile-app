enum ShipmentCheckoutFieldsTypes {
  SENDER._(name: "sender"),
  RECEIVER._(name: "receiver"),
  SHIPMENT_DETAILS._(name: "shipment_details"),
  SERVICE_PROVIDER._(name: "service_provider");

  final String name;

  const ShipmentCheckoutFieldsTypes._({required this.name});
}

enum ShipmentSummaryErrorStatus { GET_STORES_ERROR, GET_CUSTOMERS_ERROR, ADD_SHIPMENT_ERROR }

enum ShipmentSummaryRequestState {
  LOADING_SENDER,
  LOADED_SENDER,
  ERROR_SENDER,
  SUCCESS_SENDER,
  LOADING_RECEIVER,
  LOADED_RECEIVER,
  ERROR_RECEIVER,
  SUCCESS_RECEIVER,
  LOADING_ADD_SHIPMENT,
  LOADED_ADD_SHIPMENT,
  ERROR_ADD_SHIPMENT,
  SUCCESS_ADD_SHIPMENT,
}
