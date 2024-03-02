import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class UserProfileEndPoints {
  static String get getProfile {
    return EndPointBuilder.build(resourcePath: "GetProfile/profileType=1", isAccount: true)
        .fullUrl;
  }
}
