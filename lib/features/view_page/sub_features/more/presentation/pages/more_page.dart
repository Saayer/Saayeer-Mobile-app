import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:saayer/features/more_sub_features/help/presentation/screens/help_screen.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/screens/settings_screen.dart';
import 'package:saayer/features/more_sub_features/why_saayer/presentation/screens/why_saayer_screen.dart';
import 'package:saayer/features/splash/presentation/screens/splash_screen.dart';
import 'package:saayer/features/user_card/presentation/screens/user_card_screen.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/widgets/more_cards_widget.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/widgets/more_item_widget.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
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
          if (state.isRefreshed) {}
          if (state.stateHelper.requestState == RequestState.LOADED) {
            if (state.isLoggedOut) {
              getIt<NavigationService>()
                  .navigateAndFinish(const SplashScreen());
            }
          }
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        final bool isLoading =
            (state.stateHelper.requestState == RequestState.LOADING);

        final Widget dividerWidget = Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          // child: Divider(
          //   thickness: 0.5,
          //   color: SaayerTheme().getColorsPalette.greyColor,
          // ),
        );
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  UserCardScreen(
                    isParentLoading: isLoading,
                    horizontalPadding: 10,
                    verticalPadding: 5,
                  ),
                  if (!(viewPageBloc.state.isGuest!)) ...[
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const MoreCardsWidget(),
                    ),
                  ],
                  SizedBox(
                    height: 16.h,
                  ),
                  const MoreItemWidget(
                    iconName: "settings",
                    title: "settings",
                    onPressedWidget: SettingsScreen(),
                  ),
                  dividerWidget,
                  const MoreItemWidget(
                    iconName: "help",
                    title: "help",
                    onPressedWidget: HelpScreen(),
                  ),
                  dividerWidget,
                  const MoreItemWidget(
                    iconName: "contact_us",
                    title: "contact_us",
                    onPressedWidget: ContactUsScreen(),
                  ),
                  dividerWidget,
                  const MoreItemWidget(
                    iconName: "logo",
                    title: "why_saayer",
                    size: 23,
                    onPressedWidget: WhySaayerScreen(),
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  if (!(viewPageBloc.state.isGuest!))
                    Container(
                      width: width,
                      color: SaayerTheme().getColorsPalette.backgroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
                        child: SaayerDefaultTextButton(
                          text: "log_out",
                          isEnabled: true,
                          borderRadius: 16.r,
                          onPressed: () {
                            moreBloc.add(LogOutEvent());
                          },
                          btnWidth: width / 1.2,
                          btnHeight: 50.h,
                        ),
                      ),
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
