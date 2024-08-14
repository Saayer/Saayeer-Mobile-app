import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/user_info_view_page/presentation/widgets/linear_indicator.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/widgets/request_shipment_pages_helper.dart';

class RequestShipmentPage extends StatelessWidget {
  const RequestShipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestShipmentBloc requestShipmentBloc = BlocProvider.of<RequestShipmentBloc>(context);
    final List<Widget> pages =
        RequestShipmentPagesHelper(requestShipmentBloc: requestShipmentBloc).requestShipmentPages();

    return BlocConsumer<RequestShipmentBloc, RequestShipmentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (requestShipmentBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            // getIt<NavigationService>()
            //     .navigateAndFinish(const ViewPageScreen());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(
            showBackLeading: true,
            onTapLeading: () {
              ///
              requestShipmentBloc.add(GoToPreviousPage());
            },
            title: 'request_shipment'.tr(),
          ),
          body: _buildRequestShipmentBody(context, state, pages),
        );
      },
    );
  }

  _buildRequestShipmentBody(BuildContext context, RequestShipmentState state, List<Widget> pages) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (index) {
                  final bool isPrevious = (state.currentPage > index);
                  final bool isCurrent = (state.currentPage == index);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isCurrent ? screenWidth(context) / 4 : screenWidth(context) / 6,
                    child: LinearIndicator(
                      color: isPrevious
                          ? (SaayerTheme().getColorsPalette.superDarkOrangeColor)
                          : isCurrent
                              ? (SaayerTheme().getColorsPalette.primaryColor)
                              : (SaayerTheme().getColorsPalette.greyColor),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Flexible(fit: FlexFit.tight, child: pages[state.currentPage])
            ],
          )),
    );
  }
}
