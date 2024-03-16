import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class ClientEndPoints {
  static String get getClients {
    return EndPointBuilder.build(
            resourcePath: "GetClients",
            collection: const EndPointsAccountCollection())
        .fullUrl;
  }

  static String get addClient {
    return EndPointBuilder.build(
            resourcePath: "AddClient",
            collection: const EndPointsAccountCollection())
        .fullUrl;
  }
}
