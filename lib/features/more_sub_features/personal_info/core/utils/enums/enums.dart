enum PersonalInfoFieldsTypes {
  NAME._(name: "name"),
  EMAIL._(name: "email"),
  PHONE._(name: "phone"),
  BUSINESSNAME._(name: "business_name");

  final String name;

  const PersonalInfoFieldsTypes._({required this.name});
}

enum PersonalInfoErrorStatus { ERROR_PERSONAL_INFO }
