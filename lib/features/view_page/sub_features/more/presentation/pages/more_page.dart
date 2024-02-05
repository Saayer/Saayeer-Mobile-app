import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final MoreBloc moreBloc = BlocProvider.of<MoreBloc>(context);
    return BlocConsumer<MoreBloc, MoreState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading =
            (moreBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        final Widget dividerWidget = Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Divider(
            thickness: 0.5,
            color: SaayerTheme().getColorsPalette.greyColor,
          ),
        );
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CupertinoListTile(
                    title: Text(
                      "dark_mode".tr(),
                      style: AppTextStyles.hintButtonLabel(),
                    ),
                    trailing: CupertinoSwitch(
                      value: SaayerTheme().isDarkThemeMode,
                      thumbColor:
                          SaayerTheme().getColorsPalette.backgroundColor,
                      activeColor: SaayerTheme().getColorsPalette.primaryColor,
                      onChanged: (value) {
                        SaayerTheme().setThemeMode();
                        // moreBloc.add(RefreshEvent());
                        getIt<NavigationService>().navigateAndReplacement(
                            const ViewPageScreen(
                              navBarIconType: NavBarIconTypes.MORE,
                            ),
                            isAnimated: true);
                      },
                    )),
                dividerWidget,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "language".tr(),
                        style: AppTextStyles.hintButtonLabel(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: ["english", "arabic"].map(
                        (e) {
                          final bool isEnabled = ((e == "english")
                              ? Localization.isEnglish()
                              : Localization.isArabic());
                          return Padding(
                            padding: EdgeInsets.all(8.r),
                            child: SaayerDefaultTextButton(
                              text: e,
                              isEnabled: isEnabled,
                              borderRadius: 12.r,
                              onPressed: () {
                                final Locale locale = ((e == "english")
                                    ? Localization.usEnglish
                                    : Localization.egArabic);
                                Localization.setLocale(locale);
                                getIt<NavigationService>()
                                    .navigateAndReplacement(
                                        const ViewPageScreen(
                                          navBarIconType: NavBarIconTypes.MORE,
                                        ),
                                        isAnimated: true);
                              },
                              btnWidth: width / 3.5,
                              btnHeight: 30.h,
                              textStyle: AppTextStyles.smallParagraph(
                                  SaayerTheme().getColorsPalette.whiteColor),
                            ),
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
                dividerWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}
