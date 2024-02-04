import 'package:injectable/injectable.dart';
import 'package:saayer/core/app_config/app_flavor_entity.dart';

@Singleton()
class AppFlavor {
  late final AppFlavorEntity appFlavorEntity;

  void setAppFlavorEntity(AppFlavorEntity appFlavorEntity) {
    this.appFlavorEntity = appFlavorEntity;
  }
}
