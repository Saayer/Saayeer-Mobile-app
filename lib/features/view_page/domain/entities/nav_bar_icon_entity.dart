import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

class NavBarIconEntity extends Equatable {
  final IconData iconData;
  final bool isSelected;
  final NavBarIconTypes navBarIconType;
  final int index;

  const NavBarIconEntity({
    required this.iconData,
    required this.isSelected,
    required this.navBarIconType,
    required this.index,
  });

  NavBarIconEntity copyWith({
    IconData? iconData,
    bool? isSelected,
    NavBarIconTypes? navBarIconType,
    int? index,
  }) {
    return NavBarIconEntity(
      iconData: iconData ?? this.iconData,
      isSelected: isSelected ?? this.isSelected,
      navBarIconType: navBarIconType ?? this.navBarIconType,
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [iconData, isSelected, navBarIconType];
}

class HomeNavBarIconEntity extends NavBarIconEntity {
  const HomeNavBarIconEntity({
    super.iconData = Icons.home_filled,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.HOME,
    super.index = 0,
  });
}

class ShipmentsNavBarIconEntity extends NavBarIconEntity {
  const ShipmentsNavBarIconEntity({
    super.iconData = Icons.local_shipping,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.SHIPMENTS,
    super.index = 1,
  });
}

class RequestShipmentNavBarIconEntity extends NavBarIconEntity {
  const RequestShipmentNavBarIconEntity({
    super.iconData = Icons.add,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.REQUEST_SHIPMENT,
    super.index = 2,
  });
}

class AddressesNavBarIconEntity extends NavBarIconEntity {
  const AddressesNavBarIconEntity({
    super.iconData = Icons.location_on,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.ADDRESESS,
    super.index = 3,
  });
}

class MoreNavBarIconEntity extends NavBarIconEntity {
  const MoreNavBarIconEntity({
    super.iconData = Icons.more_horiz,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.MORE,
    super.index = 4,
  });
}

class ClientsNavBarIconEntity extends NavBarIconEntity {
  const ClientsNavBarIconEntity({
    super.iconData = Icons.people_alt,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.CLIENTS,
    super.index = 2,
  });
}

class AdminMoreNavBarIconEntity extends NavBarIconEntity {
  const AdminMoreNavBarIconEntity({
    super.iconData = Icons.more_horiz,
    super.isSelected = false,
    super.navBarIconType = NavBarIconTypes.MORE,
    super.index = 3,
  });
}
