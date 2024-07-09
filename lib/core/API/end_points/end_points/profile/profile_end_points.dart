import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class ProfileEndPoints {
  static String get getUserProfile {
    return EndPointBuilder.build(
            resourcePath: "GetUserProfile",
            collection: const EndPointsProfileCollection())
        .fullUrl;
  }
}
