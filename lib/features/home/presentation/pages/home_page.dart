import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/home/core/errors/home_error_handler.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/new_shipment_card_item_widget.dart';

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
              HomeErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Flexible(
                //   child: UserCardScreen(
                //     isParentLoading: isLoading,
                //   ),
                // ),
                SizedBox(height: 10),
                NewShipmentCardItemWidget(),
                SizedBox(
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
                //if (state.clientDto != null)
                //   SizedBox(
                //     height: 400,
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 0),
                //       child: ShipmentsScreen(
                //         isFromHome: true,
                //       ),
                //     ),
                //   ),
              ],
            ),
          );
        },
      ),
    );
  }
}
