import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/bottom_sheet/log_in_bottom_sheet_widget.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';

class EmptyShipments extends StatelessWidget {
  final ShipmentsListTypes shipmentsType;

  const EmptyShipments({super.key, required this.shipmentsType});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);

    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final double size = (state.isFromHome ? 40 : 65);
        return EmptyStatusWidget(
          title: "empty_shipments_title"
              .tr()
              .replaceFirst("{}", shipmentsType.pluralName.tr()),
          desc: "empty_shipments_desc"
              .tr()
              .replaceFirst("{}", shipmentsType.pluralName.tr())
              .toLowerCase(),
          btnLabel: "request_shipment",
          iconName: NavBarIconTypes.SHIPMENTS.name,
          dividerWidth: (state.isFromHome ? 3 : 2),
          btnWidth: (state.isFromHome ? 1.5 : 1),
          onBtnPressed: () {
            if (!(viewPageBloc.state.isGuest!)) {
              viewPageBloc.add(const GoToPage(
                  navBarIconType: NavBarIconTypes.REQUEST_SHIPMENT));
            } else {
              getLogInBottomSheetWidget();
            }
          },
          size: size,
        );
      },
    );
  }
}
