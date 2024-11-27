import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/bloc/shipment_summary_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/widgets/sender_receiver_shimmer_widget.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/widgets/shipment_summary_text_fields_helper.dart';

class SenderSectionWidget extends StatelessWidget {
  const SenderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentSummaryBloc shipmentSummaryBloc = BlocProvider.of<ShipmentSummaryBloc>(context);
    bool isLoading = false;
    return BlocConsumer<ShipmentSummaryBloc, ShipmentSummaryState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        isLoading = (shipmentSummaryBloc.state.stateHelper.requestState == ShipmentSummaryRequestState.LOADING_SENDER);

        if (!isLoading) {
          if (state.stateHelper.requestState == ShipmentSummaryRequestState.SUCCESS_SENDER) {}
          if (state.stateHelper.requestState == ShipmentSummaryRequestState.ERROR_SENDER) {}
        }
      },
      builder: (context, state) {
        switch (requestShipmentBloc.senderType ?? SenderReceiverType.store) {
          case SenderReceiverType.store:
            {
              return (isLoading || shipmentSummaryBloc.state.senderStoreDto == null)
                  ? const SenderReceiverShimmerWidget()
                  : ShipmentSummaryTextFieldsHelper(
                          requestShipmentBloc: requestShipmentBloc,
                          shipmentCheckoutBloc: shipmentSummaryBloc,
                          shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.SENDER)
                      .getTextsWidget();
            }
          case SenderReceiverType.customer:
            {
              return (isLoading || shipmentSummaryBloc.state.senderCustomerDto == null)
                  ? const SenderReceiverShimmerWidget()
                  : ShipmentSummaryTextFieldsHelper(
                          requestShipmentBloc: requestShipmentBloc,
                          shipmentCheckoutBloc: shipmentSummaryBloc,
                          shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.SENDER)
                      .getTextsWidget();
            }
        }
      },
    );
  }
}
