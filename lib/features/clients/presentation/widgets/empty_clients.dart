import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

class EmptyClients extends StatelessWidget {
  final bool hasButton;

  const EmptyClients({
    super.key,
    this.hasButton = false,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 65;
    return EmptyStatusWidget(
      title: "empty_shipments_title".tr().replaceFirst("{}", 'clients'.tr()),
      desc: "empty_shipments_desc".tr().replaceFirst("{}", 'clients'.tr()).toLowerCase(),
      btnLabel: "request_shipment",
      iconName: NavBarIconTypes.SHIPMENTS.name,
      dividerWidth: 2,
      hasButton: hasButton,
      btnWidth: 1,
      onBtnPressed: () {},
      size: size,
    );
  }
}
