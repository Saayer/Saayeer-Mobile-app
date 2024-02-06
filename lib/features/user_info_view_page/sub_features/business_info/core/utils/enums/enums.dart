enum BusinessInfoFieldsTypes {
  COMPANY_NAME._(name: "company_name"),
  EMAIL._(name: "email"),
  MOBILE_NUMBER._(name: "phone_num"),
  COMMERCIAL_REGISTERATION_NO._(name: "commercial_registration_no"),
  SHORT_ADDRESS._(name: "short_address"),
  DISTRICT._(name: "district"),
  GOVERNORATE._(name: "governorate");

  final String name;

  const BusinessInfoFieldsTypes._({required this.name});
}

enum BusinessInfoErrorStatus { ERROR_BUSINESS_INFO }
