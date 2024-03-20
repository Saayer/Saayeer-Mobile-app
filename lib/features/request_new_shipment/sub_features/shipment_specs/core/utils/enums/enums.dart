enum ShipmentSpecsFieldsTypes {
  CONTENT._(name: "content"),
  COST._(name: "cost"),
  WEIGHT._(name: "weigth"),
  LENGHT._(name: "lenght"),
  WIDTH._(name: "width"),
  HIEGHT._(name: "hieght");

  final String name;

  const ShipmentSpecsFieldsTypes._({required this.name});
}

enum StoreInfoErrorStatus { ERROR_STORE_INFO }
