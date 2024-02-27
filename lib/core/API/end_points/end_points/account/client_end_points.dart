import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class ClientEndPoints {
  static String get getClients {
    return EndPointBuilder.build(resourcePath: "GetClients", isAccount: true)
        .fullUrl;
  }

  static String get addClient {
    return EndPointBuilder.build(resourcePath: "AddClient", isAccount: true)
        .fullUrl;
  }
}
