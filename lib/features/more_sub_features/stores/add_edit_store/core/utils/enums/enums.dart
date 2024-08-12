enum StoreInfoFieldsTypes {
  NAME._(name: "name"),
  COUNTRY._(name: "country"),
  GOVERNORATE._(name: "governorate"),
  CITY._(name: "city"),
  AREA._(name: "area"),
  ADDRESS._(name: "address"),
  ZIPCODE._(name: "zipCode"),
  FINANCIAL_RECORD_NUMBER._(name: "financial_record_number"),
  FREELANCE_CERTIFICATE_NUMBER._(name: "freelance_certificate_number");
  //MAROOF_ID._(name: "maroof_id"),

  final String name;

  const StoreInfoFieldsTypes._({required this.name});
}

enum AddEditStoreType { addStore, editStore }

enum StoreInfoErrorStatus { ERROR_STORE_INFO }
