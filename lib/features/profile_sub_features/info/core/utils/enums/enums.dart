enum InfoTypes {
  PERSONAL_INFO._(name: "personal_info"),
  BUSINESS_INFO._(name: "business_info"),
  STORE_INFO._(name: "store_info");

  final String name;

  const InfoTypes._({required this.name});
}
