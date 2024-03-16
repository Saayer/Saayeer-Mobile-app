import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/bottom_sheet/log_in_bottom_sheet_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/profile/presentation/helper/on_card_pressed_helper.dart';
import 'package:saayer/features/view_page/sub_features/profile/presentation/helper/on_info_pressed_helper.dart';

class ProfileCardItemWidget extends StatelessWidget {
  final String title, iconName;

  const ProfileCardItemWidget(
      {super.key, required this.title, required this.iconName});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);

    return GestureDetector(
      onTap: () {
        _onPressed((viewPageBloc.state.isGuest!));
      },
      child: Container(
        // height: 50.h,
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Hero(
                  tag: "${title}HeroTag",
                  child: SvgPicture.asset(
                    Constants.getImagePath("$iconName.svg"),
                    // height: 60.h,
                    // width: 60.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.boldLabel(
                          SaayerTheme().getColorsPalette.orangeColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onPressed(bool isGuest) async {
    if (!isGuest) {
      final bool isInfo = (title.contains("info"));
      if (isInfo) {
        final OnInfoPressedHelper onInfoPressedHelper = OnInfoPressedHelper();
        await onInfoPressedHelper.onInfoPressed(title);
      } else {
        final OnCardPressedHelper onCardPressedHelper = OnCardPressedHelper();
        await onCardPressedHelper.onCardPressed(title);
      }
    } else {
      getLogInBottomSheetWidget();
    }
  }
}
