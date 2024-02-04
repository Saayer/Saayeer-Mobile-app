import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

class NavBarIconEntity extends Equatable {
  final IconData iconData;
  final bool isSelected;
  final NavBarIconTypes navBarIconType;

  const NavBarIconEntity({
    required this.iconData,
    required this.isSelected,
    required this.navBarIconType,
  });

  NavBarIconEntity copyWith({
    IconData? iconData,
    bool? isSelected,
    NavBarIconTypes? navBarIconType,
  }) {
    return NavBarIconEntity(
      iconData: iconData ?? this.iconData,
      isSelected: isSelected ?? this.isSelected,
      navBarIconType: navBarIconType ?? this.navBarIconType,
    );
  }

  @override
  List<Object> get props => [iconData, isSelected, navBarIconType];
}

class HomeNavBarIconEntity extends NavBarIconEntity {
  const HomeNavBarIconEntity(
      {super.iconData = Icons.home_filled,
      super.isSelected = false,
      super.navBarIconType = NavBarIconTypes.HOME});
}

class ShipmentsNavBarIconEntity extends NavBarIconEntity {
  const ShipmentsNavBarIconEntity(
      {super.iconData = Icons.local_shipping,
      super.isSelected = false,
      super.navBarIconType = NavBarIconTypes.SHIPMENTS});
}

class RequestShipmentNavBarIconEntity extends NavBarIconEntity {
  const RequestShipmentNavBarIconEntity(
      {super.iconData = Icons.add,
        super.isSelected = false,
        super.navBarIconType = NavBarIconTypes.REQUEST_SHIPMENT});
}

class EBillsNavBarIconEntity extends NavBarIconEntity {
  const EBillsNavBarIconEntity(
      {super.iconData = Icons.file_copy_outlined,
      super.isSelected = false,
      super.navBarIconType = NavBarIconTypes.EBILLS});
}

class MoreNavBarIconEntity extends NavBarIconEntity {
  const MoreNavBarIconEntity(
      {super.iconData = Icons.more_horiz,
      super.isSelected = false,
      super.navBarIconType = NavBarIconTypes.MORE});
}
