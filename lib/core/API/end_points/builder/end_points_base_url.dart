import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

class EndPointsBaseUrl {
  final String baseUrl;

  const EndPointsBaseUrl._internal({
    required this.baseUrl,
  });

  factory EndPointsBaseUrl.init() {
    switch (getIt<AppFlavor>().appFlavorEntity.flavorType) {
      case FlavorType.DEV:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com:9002/saayer-22/dev");
        }
      case FlavorType.STAGING:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com:9002/saayer-22/stag");
        }
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com/v1");
        }
    }
  }
}
