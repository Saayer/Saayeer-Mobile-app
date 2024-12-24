enum ShipmentsListTypes {
  EXPORT._(singleName: "export_shipment", pluralName: "export_shipments", theName: "the_export_shipment"),
  IMPORT._(singleName: "import_shipment", pluralName: "import_shipments", theName: "the_import_shipment");

  final String singleName, pluralName, theName;

  const ShipmentsListTypes._({required this.singleName, required this.pluralName, required this.theName});
}

enum ShipmentsErrorStatus {
  ERROR_GET_SHIPMENTS,
  ERROR_DELETE_SHIPMENTS,
  ERROR_EDIT_SHIPMENTS,
  ERROR_GET_STORES,
  ERROR_GET_SERVICE_PROVIDERS,
  ERROR_GET_CLIENTS,
}

enum ShipmentsFilterTypes {
  SEARCH._(name: "search_hint"),
  STORE._(name: "store"),
  SELECT_DATE_FROM._(name: "select_date_from"),
  SELECT_DATE_TO._(name: "select_date_to"),
  STATUS._(name: "status"),
  SERVICE_PROVIDER._(name: "service_provider");

  final String name;

  const ShipmentsFilterTypes._({required this.name});
}

enum AdminShipmentsFilterTypes {
  SEARCH._(name: "search_hint"),
  CLIENT._(name: "client"),
  SELECT_DATE_FROM._(name: "select_date_from"),
  SELECT_DATE_TO._(name: "select_date_to"),
  STATUS._(name: "status"),
  SERVICE_PROVIDER._(name: "service_provider");

  final String name;

  const AdminShipmentsFilterTypes._({required this.name});
}
