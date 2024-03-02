import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/bottom_sheet/log_in_bottom_sheet_widget.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';

class EmptyShipments extends StatelessWidget {
  final ShipmentsTypes shipmentsType;

  const EmptyShipments({super.key, required this.shipmentsType});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);

    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
            if (!viewPageBloc.state.isGuest) {
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
