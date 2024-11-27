enum NavBarIconTypes {
  HOME._(name: "home"),
  SHIPMENTS._(name: "shipments"),
  REQUEST_SHIPMENT._(name: "new_shipment"),
  ADDRESESS._(name: "addresses_book"),
  MORE._(name: "more");

  final String name;

  const NavBarIconTypes._({required this.name});
}
