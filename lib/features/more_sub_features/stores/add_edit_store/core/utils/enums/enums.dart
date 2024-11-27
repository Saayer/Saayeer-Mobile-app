enum StoreInfoFieldsTypes {
  NAME._(name: "store_name"),
  PHONE._(name: "phone_num"),
  COUNTRY._(name: "country"),
  GOVERNORATE._(name: "governorate"),
  CITY._(name: "city"),
  ADDRESS._(name: "address"),
  ZIPCODE._(name: "zipCode");

  final String name;

  const StoreInfoFieldsTypes._({required this.name});
}

enum AddEditStoreType { addStore, editStore }

enum StoreInfoErrorStatus { ERROR_STORE_INFO }
