class ShipmentProviderModel {
  final String? name;
  final String? icon;
  final String? featuereName;
  final int? deliverDays;
  final String? deliverDaysPharse;
  final double? totalPrice;

  ShipmentProviderModel({
    this.name,
    this.icon,
    this.featuereName,
    this.deliverDays,
    this.deliverDaysPharse,
    this.totalPrice,
  });

  factory ShipmentProviderModel.fromJson(Map<String, dynamic> json) => ShipmentProviderModel(
        name: json["name"],
        icon: json["icon"],
        featuereName: json["featuereName"],
        deliverDays: json["deliverDays"],
        deliverDaysPharse: json["deliverDaysPharse"],
        totalPrice: json["totalPrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "featuereName": featuereName,
        "deliverDays": deliverDays,
        "deliverDaysPharse": deliverDaysPharse,
        "totalPrice": totalPrice,
      };
}
