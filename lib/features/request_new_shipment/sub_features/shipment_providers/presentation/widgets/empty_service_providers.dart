import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';

class EmptyServiceProviders extends StatelessWidget {
  const EmptyServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmptyStatusWidget(
        title: "empty_service_providers_title".tr(),
        desc: "empty_service_providers_desc".tr(),
        btnLabel: "",
        iconName: "logo",
        hasButton: false,
        onBtnPressed: () {},
        size: 60,
      ),
    );
  }
}
