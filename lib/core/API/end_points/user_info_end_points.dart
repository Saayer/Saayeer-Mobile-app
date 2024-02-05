import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class UserInfoEndPoints {
  static String get updatePersonalInfo {
    return EndPointBuilder.build("account/UpdatePersonalInfo").fullUrl;
  }

  static String get updateBusinessInfo {
    return EndPointBuilder.build("account/UpdateBusinessInfo").fullUrl;
  }
}
