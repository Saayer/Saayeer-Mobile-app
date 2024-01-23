import 'package:saayer/core/app_config/app_flavor_entity.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

class EndPointsBaseUrl {
  final String baseUrl;

  const EndPointsBaseUrl._internal({
    required this.baseUrl,
  });

  factory EndPointsBaseUrl.init() {
    switch (getIt<AppFlavorEntity>().flavorType) {
      case FlavorType.DEV:
        {
          return const EndPointsBaseUrl._internal(baseUrl: "");
        }
      case FlavorType.STAGING:
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(baseUrl: "");
        }
    }
  }
}
