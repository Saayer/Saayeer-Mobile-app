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
            baseUrl: "https://app.saayer.com:9004/saayer-36/app",
            baseRedirectUrl: "https://app.saayer.com:9004",
            hrefForWeb: '/saayer-36/web',
          );
        }
      case FlavorType.STAGING:
        {
          return const EndPointsBaseUrl._internal(
            baseUrl: "https://app.saayer.com:9002/saayer-34/app",
            baseRedirectUrl: 'https://app.saayer.com:9002',
            hrefForWeb: '/saayer-34/web',
          );
        }
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(
            baseUrl: "https://app.saayer.com/v33/app",
            baseRedirectUrl: 'https://app.saayer.com',
            hrefForWeb: '/v33/web',
          );
        }
    }
  }
}
