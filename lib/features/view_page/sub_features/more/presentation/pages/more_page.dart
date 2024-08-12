import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:saayer/features/more_sub_features/help/presentation/screens/help_screen.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/screens/settings_screen.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/screens/static_pages_screen.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/screens/stores_list_screen.dart';
import 'package:saayer/features/more_sub_features/why_saayer/presentation/screens/why_saayer_screen.dart';
import 'package:saayer/features/splash/presentation/screens/splash_screen.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/widgets/more_cards_widget.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/widgets/more_item_widget.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    final MoreBloc moreBloc = BlocProvider.of<MoreBloc>(context);

    return BlocConsumer<MoreBloc, MoreState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (moreBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.isRefreshed) {}
          if (state.stateHelper.requestState == RequestState.LOADED) {
            if (state.isLoggedOut) {
              getIt<NavigationService>().navigateAndFinish(const SplashScreen());
            }
          }
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        const Widget dividerWidget = Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        );
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  // UserCardScreen(
                  //   isParentLoading: isLoading,
                  //   horizontalPadding: 10,
                  //   verticalPadding: 5,
                  // ),
                  if (!(viewPageBloc.state.isGuest!)) ...[
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: MoreCardsWidget(),
                    ),
                  ],
                  const SizedBox(
                    height: 16,
                  ),
                  const MoreItemWidget(
                    iconName: "settings",
                    title: "settings",
                    onPressedWidget: SettingsScreen(),
                  ),
                  dividerWidget,
                  const MoreItemWidget(
                    iconName: "total_store_requests",
                    title: "stores",
                    onPressedWidget: StoresListScreen(),
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
                  const MoreItemWidget(
                    iconName: "replacement_refund_policy",
                    title: "replacement_refund_policy",
                    onPressedWidget: StaticPagesScreen(staticPagesTypes: StaticPagesTypes.REPLACEMENTREFUNDPOLICY),
                  ),
                  dividerWidget,
                  const MoreItemWidget(
                    iconName: "privacy_policy",
                    title: "privacy_policy",
                    onPressedWidget: StaticPagesScreen(staticPagesTypes: StaticPagesTypes.PRIVACYPOLICY),
                  ),
                  dividerWidget,
                  const MoreItemWidget(
                    iconName: "terms_conditions",
                    title: "terms_conditions",
                    onPressedWidget: StaticPagesScreen(staticPagesTypes: StaticPagesTypes.TERMSCONDITIONS),
                  ),
                  dividerWidget,
                  const SizedBox(
                    height: 0,
                  ),
                  if (!(viewPageBloc.state.isGuest!))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: SaayerDefaultTextButton(
                        text: "log_out",
                        isEnabled: true,
                        borderRadius: 16,
                        onPressed: () {
                          moreBloc.add(LogOutEvent());
                        },
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SaayerDefaultTextButton(
                      text: "delete_account",
                      isEnabled: true,
                      borderRadius: 16,
                      onPressed: () {
                        moreBloc.add(OnDeleteAccount());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
