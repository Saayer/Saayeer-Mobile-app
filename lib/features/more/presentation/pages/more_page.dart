import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/more/presentation/bloc/more_bloc.dart';
import 'package:saayer/features/more/presentation/widgets/more_cards_widget.dart';
import 'package:saayer/features/more/presentation/widgets/more_item_widget.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              getIt<NavigationService>().navigateAndFinishNamed(Routes.splashNamedPage);
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
                  if (!UserUtils.isAdmin()) ...[
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
                    onPressedRouteName: Routes.settingsNamedPage,
                  ),
                  if (!UserUtils.isAdmin()) ...[
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "total_store_requests",
                      title: "stores",
                      onPressedRouteName: Routes.storesListNamedPage,
                    ),
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "contact_us",
                      title: "contact_us",
                      onPressedRouteName: Routes.contactUsNamedPage,
                    ),
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "logo",
                      title: "why_saayer",
                      size: 23,
                      onPressedRouteName: Routes.whySaayerNamedPage,
                    ),
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "total_shipments",
                      title: "shipping_partners",
                      size: 23,
                      onPressedRouteName: Routes.shippingPartnersNamedPage,
                    ),
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "replacement_refund_policy",
                      title: "replacement_refund_policy",
                      onPressedRouteName: Routes.staticPagesNamedPage,
                      routeArgument: StaticPagesTypes.REPLACEMENTREFUNDPOLICY,
                    ),
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "privacy_policy",
                      title: "privacy_policy",
                      onPressedRouteName: Routes.staticPagesNamedPage,
                      routeArgument: StaticPagesTypes.PRIVACYPOLICY,
                    ),
                    dividerWidget,
                    const MoreItemWidget(
                      iconName: "terms_conditions",
                      title: "terms_conditions",
                      onPressedRouteName: Routes.staticPagesNamedPage,
                      routeArgument: StaticPagesTypes.TERMSCONDITIONS,
                    ),
                  ],
                  dividerWidget,
                  const SizedBox(
                    height: 0,
                  ),
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
                  if (!UserUtils.isAdmin())
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
