import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/bloc/shipment_summary_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/widgets/sender_receiver_shimmer_widget.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/widgets/shipment_summary_text_fields_helper.dart';

class ReceiverSectionWidget extends StatelessWidget {
  const ReceiverSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentSummaryBloc shipmentSummaryBloc = BlocProvider.of<ShipmentSummaryBloc>(context);
    bool isLoading = false;
    return BlocConsumer<ShipmentSummaryBloc, ShipmentSummaryState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        isLoading =
            (shipmentSummaryBloc.state.stateHelper.requestState == ShipmentSummaryRequestState.LOADING_RECEIVER);
        if (!isLoading) {
          if (state.stateHelper.requestState == ShipmentSummaryRequestState.SUCCESS_RECEIVER) {}
          if (state.stateHelper.requestState == ShipmentSummaryRequestState.ERROR_RECEIVER) {}
        }
      },
      builder: (context, state) {
        switch (requestShipmentBloc.receiverType ?? SenderReceiverType.store) {
          case SenderReceiverType.store:
            {
              return (isLoading || shipmentSummaryBloc.state.receiverStoreDto == null)
                  ? const SenderReceiverShimmerWidget()
                  : ShipmentSummaryTextFieldsHelper(
                          requestShipmentBloc: requestShipmentBloc,
                          shipmentCheckoutBloc: shipmentSummaryBloc,
                          shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.RECEIVER)
                      .getTextsWidget();
            }
          case SenderReceiverType.customer:
            {
              return (isLoading || shipmentSummaryBloc.state.receiverCustomerDto == null)
                  ? const SenderReceiverShimmerWidget()
                  : ShipmentSummaryTextFieldsHelper(
                          requestShipmentBloc: requestShipmentBloc,
                          shipmentCheckoutBloc: shipmentSummaryBloc,
                          shipmentCheckoutFieldsTypes: ShipmentCheckoutFieldsTypes.RECEIVER)
                      .getTextsWidget();
            }
        }
      },
    );
  }
}
