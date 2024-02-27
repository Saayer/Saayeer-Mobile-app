enum AddAddressFieldsTypes {
  NAME._(name: "name"),
  MOBILE._(name: "phone_num"),
  EMAIL._(name: "email"),
  // COUNTRY._(name: "country"),
  CITY._(name: "city"),
  DISTRICT._(name: "district"),
  ADDRESS._(name: "address");

  final String name;

  const AddAddressFieldsTypes._({required this.name});
}

enum AddAddressErrorStatus { ERROR_ADD_ADDRESS_INFO }
