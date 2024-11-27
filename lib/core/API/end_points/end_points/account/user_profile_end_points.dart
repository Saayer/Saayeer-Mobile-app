import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class UserProfileEndPoints {
  static String get getProfile {
    return EndPointBuilder.build(
            resourcePath: "GetProfile",
            collection: const EndPointsProfileCollection())
        .fullUrl;
  }
}
