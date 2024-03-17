class RequestShipmentProvider {
  // final BusinessInfoEntity businessInfoEntity;

  const RequestShipmentProvider(//{
      // required this.businessInfoEntity,
      //}
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["weight"] = 10;
    map["length"] = 0;
    map["width"] = 0;
    map["height"] = 0;
    map["from"] = "riyadh";
    map["to"] = "dammam";
    map["cost"] = 10;
    return map;
  }
}
