import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/request_new_shipment/data/core/errors/new_shipment_error_handler.dart';
import 'package:saayer/features/user_info_view_page/presentation/widgets/linear_indicator.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/presentation/widgets/request_new_shipment_pages_helper.dart';

class RequestNewShipmentPage extends StatelessWidget {
  const RequestNewShipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final List<Widget> pages = RequestNewShipmentPagesHelper().requestShipmentPages();

    return BlocConsumer<RequestNewShipmentBloc, RequestNewShipmentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (requestShipmentBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ///
            NewShipmentErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: _buildRequestShipmentBody(context, state, pages),
        );
      },
    );
  }

  _buildRequestShipmentBody(BuildContext context, RequestNewShipmentState state, List<Widget> pages) {
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
                    width: _getIndicatorWidth(isCurrent,context),
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

  double _getIndicatorWidth(bool isCurrent, BuildContext context) {
    if(equalToTablet(context)){
      return isCurrent ? queryScreenWidth(context) / 6 : queryScreenWidth(context) / 8;
    }else if(largerThanTablet(context)){
      return isCurrent ? queryScreenWidth(context) / 7 : queryScreenWidth(context) / 9;
    }else {
      return isCurrent ? queryScreenWidth(context) / 5 : queryScreenWidth(context) / 7;
    }

  }
}
