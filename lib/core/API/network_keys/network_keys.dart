import 'package:saayer/core/API/network_keys/base_network_keys.dart';
import 'package:saayer/core/API/network_keys/dev_network_keys.dart';
import 'package:saayer/core/API/network_keys/prod_network_keys.dart';
import 'package:saayer/core/app_config/app_flavor.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

class NetworkKeys {
  final BaseNetworkKeys networkKeys;

  const NetworkKeys._internal({
    required this.networkKeys,
  });

  factory NetworkKeys.init() {
    switch (getIt<AppFlavor>().appFlavorEntity.flavorType) {
      case FlavorType.DEV:
        {
          return NetworkKeys._internal(networkKeys: DevNetworkKeys());
        }
      case FlavorType.STAGING:
        {
          return NetworkKeys._internal(networkKeys: DevNetworkKeys());
        }
      case FlavorType.PROD:
        {
          return NetworkKeys._internal(networkKeys: ProdNetworkKeys());
        }
    }
  }
}
