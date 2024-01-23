import 'package:equatable/equatable.dart';
import 'package:saayer/core/utils/enums.dart';

class AppFlavorEntity extends Equatable {
  final String appName;
  final FlavorType flavorType;
  final String? versionNum;

  AppFlavorEntity._internal(
      {required this.appName, required this.flavorType, this.versionNum});

  static AppFlavorEntity? _instance;

  factory AppFlavorEntity.getInstance() {
    return _instance!;
  }

  factory AppFlavorEntity.initInstance(
      String appName, FlavorType flavorType, String? versionNum) {
    if (_instance == null) {
      _instance = AppFlavorEntity._internal(
          appName: appName, flavorType: flavorType, versionNum: versionNum);
      return _instance!;
    }
    return _instance!;
  }

  @override
  List<Object?> get props => [appName, flavorType, versionNum];
}
