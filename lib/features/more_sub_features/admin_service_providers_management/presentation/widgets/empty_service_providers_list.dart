import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';

class EmptyServiceProvidersList extends StatelessWidget {
  const EmptyServiceProvidersList({super.key});

  @override
  Widget build(BuildContext context) {
    const double size = 65;
    return EmptyStatusWidget(
      title: "empty_service_providers_title".tr(),
      desc: "empty_service_providers_desc".tr(),
      btnLabel: "stores",
      iconName: "shipments",
      hasButton: false,
      size: size,
    );
  }
}