enum ClientsErrorStatus {
  ERROR_GET_CLIENTS,
}

enum ClientsFilterTypes {
  SEARCH._(name: "client_search_hint"),
  MOBILE._(name: "phone_num"),
  TOTAL_SHIPMENTS_MIN._(name: "total_shipments_min"),
  TOTAL_SHIPMENTS_MAX._(name: "total_shipments_max");

  final String name;

  const ClientsFilterTypes._({required this.name});
}
