enum NavBarIconTypes {
  HOME._(name: "home"),
  SHIPMENTS._(name: "shipments"),
  REQUEST_SHIPMENT._(name: "request_shipment"),
  PROFILE._(name: "profile"),
  MORE._(name: "more");

  final String name;

  const NavBarIconTypes._({required this.name});
}
