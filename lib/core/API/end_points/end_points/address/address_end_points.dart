import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class AddressEndPoints {
  static String get getCites {
    return EndPointBuilder.build(resourcePath: "Address/countryId/194").fullUrl;
  }

  static String get getAddresses {
    return EndPointBuilder.build(resourcePath: "GetClients", isAccount: true)
        .fullUrl;
  }
}
