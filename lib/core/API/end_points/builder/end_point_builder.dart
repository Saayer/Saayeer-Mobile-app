import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';

class EndPointBuilder {
  final String fullUrl;

  const EndPointBuilder.internal({
    required this.fullUrl,
  });

  factory EndPointBuilder.build(
      {required String resourcePath, bool isAccount = false}) {
    String baseUrl = EndPointsBaseUrl.init().baseUrl;
    if (isAccount) {
      baseUrl += "account/";
    }
    final String fullUrl = "$baseUrl$resourcePath";
    return EndPointBuilder.internal(fullUrl: fullUrl);
  }
}
