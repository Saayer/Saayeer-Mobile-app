enum StoreInfoFieldsTypes {
  NAME._(name: "name"),
  URL._(name: "url"),
  MAROOF_ID._(name: "maroof_id"),
  COMMERCIAL_REGISTERATION_NO._(name: "commercial_registration_no");

  final String name;

  const StoreInfoFieldsTypes._({required this.name});
}

enum StoreInfoErrorStatus { ERROR_STORE_INFO }
