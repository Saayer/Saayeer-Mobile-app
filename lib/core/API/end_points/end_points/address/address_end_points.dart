import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class AddressEndPoints {
  static String get getCites {
    return EndPointBuilder.build(resourcePath: "Address/countryId/194").fullUrl;
  }

  static String get getAddresses {
    return EndPointBuilder.build(
            resourcePath: "GetClients",
            collection: const EndPointsClientCollection())
        .fullUrl;
  }
}
