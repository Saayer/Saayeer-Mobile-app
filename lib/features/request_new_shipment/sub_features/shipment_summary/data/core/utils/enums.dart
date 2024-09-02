enum ShipmentCheckoutFieldsTypes {
  SENDER._(name: "sender"),
  RECEIVER._(name: "receiver"),
  SHIPMENT_DETAILS._(name: "shipment_details"),
  SERVICE_PROVIDER._(name: "service_provider");

  final String name;

  const ShipmentCheckoutFieldsTypes._({required this.name});
}

enum ShipmentSummaryErrorStatus { GET_STORES_ERROR, GET_CUSTOMERS_ERROR, ADD_SHIPMENT_ERROR }
