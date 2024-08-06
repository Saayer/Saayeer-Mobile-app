import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/user_card/presentation/screens/user_card_screen.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/widgets/new_shipment_card_item_widget.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/screens/shipments_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) {
          final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          log("isLoading : $isLoading", name: "HomeBloc");
          log("${LoadingDialog.checkIfLoadingVisible()}", name: "LoadingDialog.checkIsLoading()");
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.LOADED) {}
            if (state.stateHelper.requestState == RequestState.SUCCESS) {}
            if (state.stateHelper.requestState == RequestState.ERROR) {
              //HomeErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) {
          final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
          return Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: UserCardScreen(
                    isParentLoading: isLoading,
                  ),
                ),
                const NewShipmentCardItemWidget(),
                const SizedBox(
                  height: 16,
                ),
                // if ((!(viewPageBloc.state.isGuest!)) &&
                //     state.userProfileEntity == null) ...[
                //   Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 16.w),
                //     child: ShimmerWidget(
                //       widgetHeight: 500.h,
                //       child: const SizedBox(),
                //     ),
                //   ),
                // ],
                // if ((!(viewPageBloc.state.isGuest!)) && state.userProfileEntity != null) ...[
                //   const Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 16),
                //     child: HomeCardsWidget(),
                //   ),
                //   const SizedBox(
                //     height: 5,
                //   ),
                // ],
                if (state.userProfileEntity != null)
                  const SizedBox(
                    height: 400,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: ShipmentsScreen(
                        isFromHome: true,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
