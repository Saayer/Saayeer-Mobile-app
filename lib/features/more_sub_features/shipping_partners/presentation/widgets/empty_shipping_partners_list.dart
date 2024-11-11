import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/bloc/stores_list_bloc.dart';

class EmptyShippingPartnersList extends StatelessWidget {
  const EmptyShippingPartnersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoresListBloc, StoresListState>(
      listener: (context, state) {},
      builder: (context, state) {
        const double size = 65;
        return EmptyStatusWidget(
          title: "empty_stores_title".tr(),
          desc: "empty_stores_desc".tr(),
          btnLabel: "stores",
          iconName: "total_store_requests",
          hasButton: false,
          size: size,
        );
      },
    );
  }
}
