import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/bottom_sheet/log_in_bottom_sheet_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/screens/request_shipment_screen.dart';

class NewShipmentCardItemWidget extends StatelessWidget {
  const NewShipmentCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return GestureDetector(
      onTap: () {
        if (!(viewPageBloc.state.isGuest!)) {
          getIt<NavigationService>().navigateTo(const RequestShipmentScreen());
        } else {
          getLogInBottomSheetWidget();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
            color: SaayerTheme().getColorsPalette.backgroundColor,
            borderRadius: BorderRadius.circular(16.r),
            // border: Border.all(
            //   color: SaayerTheme().getColorsPalette.primaryColor,
            //   width: 1.w
            // ),
            boxShadow: [
              BoxShadow(
                color:
                    SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: ListTile(
              minLeadingWidth: 0,
              leading: Image.asset(
                Constants.getIconPath("ic_logo.png"),
                width: 45.w,
                height: 45.h,
                //color: SaayerTheme().getColorsPalette.primaryColor,
              ),
              title: Text(
                "new_shipment_home_card_label".tr(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.label(
                    SaayerTheme().getColorsPalette.primaryColor),
              ),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 15.r, color: SaayerTheme().getColorsPalette.greyColor),
            ),
          ),
        ),
      ),
    );
  }
}