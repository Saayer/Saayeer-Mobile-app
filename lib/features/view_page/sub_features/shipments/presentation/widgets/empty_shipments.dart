import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
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
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: (size + 5).r,
                        backgroundColor:
                            SaayerTheme().getColorsPalette.blackTextColor,
                        child: CircleAvatar(
                          radius: size.r,
                          backgroundColor:
                              SaayerTheme().getColorsPalette.backgroundColor,
                          child: SvgPicture.asset(
                            Constants.getIconPath(
                                "ic_${NavBarIconTypes.SHIPMENTS.name}.svg"),
                            width: size.w,
                            height: size.h,
                            color:
                                SaayerTheme().getColorsPalette.blackTextColor,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 180,
                        child: SizedBox(
                          width: width / (state.isFromHome ? 3 : 2),
                          child: Divider(
                            thickness: 5.w,
                            color:
                                SaayerTheme().getColorsPalette.blackTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "empty_shipments_title"
                        .tr()
                        .replaceFirst("{}", shipmentsType.pluralName.tr()),
                    style: state.isFromHome
                        ? AppTextStyles.boldLabel()
                        : AppTextStyles.boldLiteLabel(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "empty_shipments_desc"
                        .tr()
                        .replaceFirst("{}", shipmentsType.pluralName.tr())
                        .toLowerCase(),
                    style: state.isFromHome
                        ? AppTextStyles.label()
                        : AppTextStyles.liteLabel(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: width / (state.isFromHome ? 1.5 : 1),
                    color: SaayerTheme().getColorsPalette.backgroundColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
                      child: SaayerDefaultTextButton(
                        text: "request_shipment",
                        isEnabled: true,
                        borderRadius: 16.r,
                        onPressed: () {
                          viewPageBloc.add(const GoToPage(
                              navBarIconType:
                                  NavBarIconTypes.REQUEST_SHIPMENT));
                        },
                        btnWidth: width / 1.2,
                        btnHeight: 50.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
