enum ShipmentSpecInfoFieldsTypes {
  WEIGHT._(name: "weight_kg"),
  LENGTH._(name: "length_cm"),
  WIDTH._(name: "width_cm"),
  HEIGHT._(name: "height_cm"),
  CONTENT_DESCRIPTION._(name: "content_description"),
  CONTENT_VALUE._(name: "content_value");

  final String name;

  const ShipmentSpecInfoFieldsTypes._({required this.name});
}
