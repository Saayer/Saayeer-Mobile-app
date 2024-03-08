import 'package:saayer/core/API/end_points/builder/end_points_base_url.dart';
import 'package:saayer/core/API/end_points/builder/end_points_collection.dart';

class EndPointBuilder {
  final String fullUrl;

  const EndPointBuilder.internal({
    required this.fullUrl,
  });

  factory EndPointBuilder.build(
      {required String resourcePath, EndPointsBaseCollection? collection}) {
    String baseUrl = EndPointsBaseUrl.init().baseUrl;
    if (collection != null) {
      baseUrl += collection.path;
    }
    final String fullUrl = "$baseUrl$resourcePath";
    return EndPointBuilder.internal(fullUrl: fullUrl);
  }
}
