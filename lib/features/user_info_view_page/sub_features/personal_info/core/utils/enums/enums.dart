enum PersonalInfoFieldsTypes {
  NAME._(name: "name"),
  EMAIL._(name: "email"),
  NATIONAL_ID._(name: "national_id"),
  GOVERNORATE._(name: "governorate"),
  ADDRESS._(name: "address"),
  DISTRICT._(name: "district");

  final String name;

  const PersonalInfoFieldsTypes._({required this.name});
}

enum PersonalInfoErrorStatus { ERROR_PERSONAL_INFO }
