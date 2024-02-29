import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class AddressEndPoints {
  static String get getCites {
    return EndPointBuilder.build(resourcePath: "Address/GetCites").fullUrl;
  }
}
