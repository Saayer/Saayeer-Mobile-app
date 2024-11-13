import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/bloc/shipment_summary_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/widgets/shipment_summary_text_fields_helper.dart';

class ShipmentSummaryWidget extends StatelessWidget {
  const ShipmentSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentSummaryBloc shipmentSummaryBloc = BlocProvider.of<ShipmentSummaryBloc>(context);
    return BlocConsumer<ShipmentSummaryBloc, ShipmentSummaryState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (shipmentSummaryBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            ///
            requestShipmentBloc.add(GoToNextPageEvent());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveRowColumn(
              layout: ResponsiveValue(context,
                      conditionalValues: [const Condition.equals(name: DESKTOP, value: ResponsiveRowColumnType.ROW)],
                      defaultValue: ResponsiveRowColumnType.COLUMN)
                  .value,
              columnVerticalDirection: VerticalDirection.down,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnSpacing: 5,
              rowSpacing: 10,
              children: [
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.loose,

                  /// Sender & Receiver
                  child: _buildFirstFiltersRow(requestShipmentBloc, shipmentSummaryBloc),
                ),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,

                    /// Shipment Details & Service Provider
                    child: _buildSecondFiltersRow(requestShipmentBloc, shipmentSummaryBloc))
              ],
            ),
            const SizedBox(height: 10),
            _buildAcceptTermsConditionsMsg(),
            const SizedBox(
              height: 100,
            )
          ],
        );
      },
    );
  }

  _buildFirstFiltersRow(RequestNewShipmentBloc requestShipmentBloc, ShipmentSummaryBloc shipmentCheckoutBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ShipmentSummaryTextFieldsHelper(
                requestShipmentBloc: requestShipmentBloc,
                shipmentCheckoutBloc: shipmentCheckoutBloc,
                shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.SENDER)
            .getTextsWidget(),
        const Divider(
          color: Colors.grey,
        ),
        ShipmentSummaryTextFieldsHelper(
                requestShipmentBloc: requestShipmentBloc,
                shipmentCheckoutBloc: shipmentCheckoutBloc,
                shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.RECEIVER)
            .getTextsWidget(),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  _buildSecondFiltersRow(RequestNewShipmentBloc requestShipmentBloc, ShipmentSummaryBloc shipmentCheckoutBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ShipmentSummaryTextFieldsHelper(
                requestShipmentBloc: requestShipmentBloc,
                shipmentCheckoutBloc: shipmentCheckoutBloc,
                shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.SHIPMENT_DETAILS)
            .getTextsWidget(),
        const Divider(
          color: Colors.grey,
        ),
        ShipmentSummaryTextFieldsHelper(
                requestShipmentBloc: requestShipmentBloc,
                shipmentCheckoutBloc: shipmentCheckoutBloc,
                shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.SERVICE_PROVIDER)
            .getTextsWidget(),
      ],
    );
  }

  _buildAcceptTermsConditionsMsg() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.error0.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(text: 'accept_terms_condition_msg'.tr(), style: AppTextStyles.mainFocusedLabel(null, 1.5)),
        TextSpan(
            text: 'terms_conditions'.tr(),
            style: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.blueColor,1.5),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ///
                getIt<NavigationService>()
                    .navigateToNamed(Routes.staticPagesNamedPage, arguments: StaticPagesTypes.TERMSCONDITIONS);
              })
      ])),
    );
  }
}
