import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_provider_model.dart';

class ShipmentProvidersResponse {
  final String? reqSecureKey;
  final bool? success;
  final List<ShipmentProviderModel>? data;
  final dynamic errorMessage;

  ShipmentProvidersResponse({
    this.reqSecureKey,
    this.success,
    this.data,
    this.errorMessage,
  });

  factory ShipmentProvidersResponse.fromJson(Map<String, dynamic> json) =>
      ShipmentProvidersResponse(
        reqSecureKey: json["reqSecureKey"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<ShipmentProviderModel>.from(json["data"]!.map((x) => ShipmentProviderModel.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "reqSecureKey": reqSecureKey,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}
