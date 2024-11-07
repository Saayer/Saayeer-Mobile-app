import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

class EndPointsBaseUrl {
  final String baseUrl;

  ///for web platform to set redirect url from moyasar gateway
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
              baseUrl: "https://app.saayer.com:9004/saayer-26/app",
              baseRedirectUrl: "https://app.saayer.com:9004/saayer-26/web");
        }
      case FlavorType.STAGING:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com:9002/saayer-25/app",
              baseRedirectUrl: 'https://app.saayer.com:9002/saayer-25/web');
        }
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "https://app.saayer.com/v25/app", baseRedirectUrl: 'https://app.saayer.com/v25/web');
        }
    }
  }
}
