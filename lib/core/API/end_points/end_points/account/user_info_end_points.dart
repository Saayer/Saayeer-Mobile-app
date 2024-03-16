import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class UserInfoEndPoints {
  static String get updatePersonalInfo {
    return EndPointBuilder.build(
            resourcePath: "UpdatePersonalInfo",
            collection: const EndPointsAccountCollection())
        .fullUrl;
  }

  static String get updateBusinessInfo {
    return EndPointBuilder.build(
            resourcePath: "UpdateBusinessInfo",
            collection: const EndPointsAccountCollection())
        .fullUrl;
  }

  static String get createStoreInfo {
    return EndPointBuilder.build(
            resourcePath: "CreateStoreInfo",
            collection: const EndPointsAccountCollection())
        .fullUrl;
  }

  static String get updateStoreInfo {
    return EndPointBuilder.build(
            resourcePath: "UpdateStoreInfo",
            collection: const EndPointsAccountCollection())
        .fullUrl;
  }
}
