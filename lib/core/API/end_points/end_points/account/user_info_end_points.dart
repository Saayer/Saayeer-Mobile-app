import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class UserInfoEndPoints {
  static String get updatePersonalInfo {
    return EndPointBuilder.build(
            resourcePath: "UpdatePersonalInfo", isAccount: true)
        .fullUrl;
  }

  static String get updateBusinessInfo {
    return EndPointBuilder.build(
            resourcePath: "UpdateBusinessInfo", isAccount: true)
        .fullUrl;
  }

  static String get createStoreInfo {
    return EndPointBuilder.build(
        resourcePath: "CreateStoreInfo", isAccount: true)
        .fullUrl;
  }

  static String get updateStoreInfo {
    return EndPointBuilder.build(
            resourcePath: "UpdateStoreInfo", isAccount: true)
        .fullUrl;
  }
}
