enum ShipmentsTypes {
  INCOMING._(
      singleName: "incoming_shipment",
      pluralName: "incoming_shipments",
      theName: "the_incoming_shipment"),
  OUTBOUND._(
      singleName: "outbound_shipment",
      pluralName: "outbound_shipments",
      theName: "the_outbound_shipment");

  final String singleName, pluralName, theName;

  const ShipmentsTypes._(
      {required this.singleName,
      required this.pluralName,
      required this.theName});
}

enum ShipmentStatus {
  RECEIVED._(name: "received"),
  DELIVERED._(name: "delivered"),
  PAID._(name: "paid");

  final String name;

  const ShipmentStatus._({required this.name});
}
