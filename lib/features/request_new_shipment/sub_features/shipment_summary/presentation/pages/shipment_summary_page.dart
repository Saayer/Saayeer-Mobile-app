import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/errors/shipment_summary_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/bloc/shipment_summary_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/widgets/shipment_summary_widget.dart';

class ShipmentSummaryPage extends StatelessWidget {
  const ShipmentSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentSummaryBloc bloc = BlocProvider.of<ShipmentSummaryBloc>(context);

    return BlocConsumer<ShipmentSummaryBloc, ShipmentSummaryState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (bloc.state.stateHelper.requestState == ShipmentSummaryRequestState.LOADING_ADD_SHIPMENT);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == ShipmentSummaryRequestState.SUCCESS_ADD_SHIPMENT) {
            /// set shipment id then go to shipment payment screen
            requestShipmentBloc.add(SetShipmentId(shipmentId: bloc.state.shipmentGetDto?.shipmentId ?? 0));
          }
          if (state.stateHelper.requestState == ShipmentSummaryRequestState.ERROR_ADD_SHIPMENT) {
            ///
            ShipmentSummaryErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          bottomSheet: _buildSubmitButtonWidget(bloc, requestShipmentBloc),
          body: _buildCheckoutPaymentBody(bloc, requestShipmentBloc),
        );
      },
    );
  }

  _buildSubmitButtonWidget(ShipmentSummaryBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "next",
        isEnabled: true,
        borderRadius: 16,
        onPressed: () {
          ///
          bloc.add(AddNewShipment(
              shipmentAddDto: requestShipmentBloc.state.shipmentDtoBody,
              selectedServiceProvider: requestShipmentBloc.state.selectedServiceProvider,
              senderCustomerId: requestShipmentBloc.senderType == SenderReceiverType.store
                  ? null
                  : requestShipmentBloc.state.senderCustomerId,
              senderStoreId: requestShipmentBloc.senderType == SenderReceiverType.customer
                  ? null
                  : requestShipmentBloc.state.senderStoreId,
              receiverCustomerId: requestShipmentBloc.receiverType == SenderReceiverType.store
                  ? null
                  : requestShipmentBloc.state.receiverCustomerId,
              receiverStoreId: requestShipmentBloc.receiverType == SenderReceiverType.customer
                  ? null
                  : requestShipmentBloc.state.receiverStoreId));
        },
      ),
    );
  }

  _buildCheckoutPaymentBody(ShipmentSummaryBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'shipment_summary'.tr(),
                style: AppTextStyles.mainFocusedLabel(),
              ),
            ),
            const SizedBox(height: 10),
            const ShipmentSummaryWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
