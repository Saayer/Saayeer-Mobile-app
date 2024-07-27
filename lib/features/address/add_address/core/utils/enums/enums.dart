enum AddAddressFieldsTypes {
  NAME._(name: "name"),
  MOBILE._(name: "phone_num"),
  ALTERNATIVE_MOBILE._(name: "phone_num2"),
  EMAIL._(name: "email"),
  COUNTRY._(name: "country"),
  GOVERNORATE._(name: "governorate"),
  CITY._(name: "city"),
  AREA._(name: "area"),
  ADDRESS._(name: "address"),
  ZIPCODE._(name: "zipCode");

  final String name;

  const AddAddressFieldsTypes._({required this.name});
}

enum AddAddressErrorStatus { ERROR_GET_CITIES, ERROR_ADD_ADDRESS_INFO }
