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
              baseUrl: "http://34.140.10.214/saayer-6/dev");
        }
      case FlavorType.STAGING:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "http://34.140.10.214/saayer-6/stag");
        }
      case FlavorType.PROD:
        {
          return const EndPointsBaseUrl._internal(
              baseUrl: "http://34.140.10.214/saayer-6/dev");
        }
    }
  }
}
