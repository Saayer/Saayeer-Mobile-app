enum ShipmentsTypes {
  INBOUND._(
      singleName: "inbound_shipment",
      pluralName: "inbound_shipments",
      theName: "the_inbound_shipment"),
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
