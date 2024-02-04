import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/utils/enums.dart';

class AppFlavorEntity extends Equatable {
  final String appName;
  final FlavorType flavorType;
  final String? versionNum;

  const AppFlavorEntity({
    required this.appName,
    required this.flavorType,
    this.versionNum,
  });

  @override
  List<Object?> get props => [appName, flavorType, versionNum];

  AppFlavorEntity copyWith({
    String? appName,
    FlavorType? flavorType,
    String? versionNum,
  }) {
    return AppFlavorEntity(
      appName: appName ?? this.appName,
      flavorType: flavorType ?? this.flavorType,
      versionNum: versionNum ?? this.versionNum,
    );
  }
}
