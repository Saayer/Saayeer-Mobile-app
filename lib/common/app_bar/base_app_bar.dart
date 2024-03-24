import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final void Function()? onTapLeading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool showBackLeading;
  final bool showAppBar;
  final Widget leadingWidget;
  final double height;

  const BaseAppBar({
    super.key,
    this.title,
    this.onTapLeading,
    this.actions,
    this.centerTitle = true,
    this.showBackLeading = true,
    this.showAppBar = true,
    this.leadingWidget = const SizedBox(),
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return showAppBar
        ? AppBar(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            centerTitle: centerTitle,
            titleSpacing: 0,
            elevation: 2,
            title: title == null
                ? Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                Constants.getIconPath("ic_logo_text.png")))),
                  )
                : Text(
                    title!.tr(),
                    style: AppTextStyles.mainFocusedLabel(),
                  ),
            actions: actions ?? [],
            //leadingWidth: !(showBackLeading) ? 20.w : null,
            leading: showBackLeading
                ? GestureDetector(
                    onTap: onTapLeading ??
                        () {
                          FocusScope.of(context).unfocus();
                          getIt<NavigationService>().pop();
                        },
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: SaayerTheme().getColorsPalette.blackTextColor,
                    ),
                  )
                : leadingWidget,
          )
        : PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(),
          );
  }

  @override
  Size get preferredSize =>
      showAppBar ? Size.fromHeight(height.h) : Size.fromHeight(0.0);
}
