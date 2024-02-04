enum NavBarIconTypes {
  HOME._(name: "home"),
  SHIPMENTS._(name: "shipments"),
  REQUEST_SHIPMENT._(name: "request_shipment"),
  EBILLS._(name: "ebills"),
  MORE._(name: "more");

  final String name;

  const NavBarIconTypes._({required this.name});
}
