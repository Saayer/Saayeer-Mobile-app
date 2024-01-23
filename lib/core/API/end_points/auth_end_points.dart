import 'package:saayer/core/API/end_points/builder/end_point_builder.dart';

class AuthEndPoints {
  String get login {
    return EndPointBuilder.build("").fullUrl;
  }
}
