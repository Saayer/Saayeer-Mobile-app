import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

class EndPointsBaseUrl {
  final String baseUrl;

  ///for web platform to set redirect url from moyasar gateway
  final String baseRedirectUrl;

  ///for web platform to set after [baseRedirectUrl]
  final String hrefForWeb;

  const EndPointsBaseUrl._internal({
    required this.baseUrl,
    required this.baseRedirectUrl,
    required this.hrefForWeb,
  });

  factory EndPointsBaseUrl.init() {
    switch (getIt<AppFlavor>().appFlavorEntity.flavorType) {
      case FlavorType.DEV:
        {
          return const EndPointsBaseUrl._internal(
            baseUrl: "https://app.saayer.com:9004/saayer-27/app",
            baseRedirectUrl: "https://app.saayer.com:9004/saayer-27/web",
            hrefForWeb: '/saayer-27/web',
          );
        }
      case FlavorType.STAGING:
        {
          return const EndPointsBaseUrl._internal(
            baseUrl: "https://app.saayer.com:9002/saayer-26/app",
            baseRedirectUrl: 'https://app.saayer.com:9002/saayer-26/web',
            hrefForWeb: '/saayer-26/web',
          );
        }
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(
            baseUrl: "https://app.saayer.com/v26/app",
            baseRedirectUrl: 'https://app.saayer.com/v26/web',
            hrefForWeb: '/v26/web',
          );
        }
    }
  }
}
