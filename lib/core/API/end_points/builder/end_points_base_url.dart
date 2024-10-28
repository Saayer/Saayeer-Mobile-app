import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

class EndPointsBaseUrl {
  final String baseUrl;

  ///for web platform to set redirect url to moyasar gateway
  final String baseRedirectUrl;

  const EndPointsBaseUrl._internal({
    required this.baseUrl,
    required this.baseRedirectUrl,
  });

  factory EndPointsBaseUrl.init() {
    switch (getIt<AppFlavor>().appFlavorEntity.flavorType) {
      case FlavorType.DEV:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com:9004/saayer-23/dev",
              baseRedirectUrl: "https://app.saayer.com:9004/saayer-23/web");
        }
      case FlavorType.STAGING:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com:9002/saayer-23/app",
              baseRedirectUrl: 'https://app.saayer.com:9002/saayer-23/web');
        }
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com/v1", baseRedirectUrl: 'https://app.saayer.com/v1');
        }
    }
  }
}
