import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class ProfileEndPoints {
  static String get getUserProfile {
    return EndPointBuilder.build(
            resourcePath: "GetUserProfile", isAccount: true)
        .fullUrl;
  }
}
