import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class ShipmentEndpoints {
  static String get getAddresses {
    return EndPointBuilder.build(
            resourcePath: "CalculateCost",
            collection: const EndPointShipmentCollection())
        .fullUrl;
  }
}
