import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class AuthEndPoints {
  static String get login {
    return EndPointBuilder.build(resourcePath: "login").fullUrl;
  }

  static String get confirmLogin {
    return EndPointBuilder.build(resourcePath: "Authlogin").fullUrl;
  }

  static String get entry {
    return EndPointBuilder.build(resourcePath: "entry").fullUrl;
  }
}
