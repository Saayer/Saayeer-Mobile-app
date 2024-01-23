import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';

class EndPointBuilder {
  final String fullUrl;

  const EndPointBuilder.internal({
    required this.fullUrl,
  });

  factory EndPointBuilder.build(String resourcePath) {
    final String baseUrl = EndPointsBaseUrl.init().baseUrl;
    final String fullUrl = "$baseUrl$resourcePath";
    return EndPointBuilder.internal(fullUrl: fullUrl);
  }
}
