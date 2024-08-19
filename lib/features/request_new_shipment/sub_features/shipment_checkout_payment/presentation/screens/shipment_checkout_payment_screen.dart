import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/presentation/bloc/shipment_checkout_payment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/presentation/pages/shipment_checkout_payment_page.dart';

class ShipmentCheckoutPaymentScreen extends StatelessWidget {
  const ShipmentCheckoutPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<ShipmentCheckoutPaymentBloc>();
        final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
        if (requestShipmentBloc.senderType == SenderReceiverType.store) {
          bloc.add(GetSenderStoreDetailsById(storeId: requestShipmentBloc.state.senderStoreId));
        } else {
          bloc.add(GetSenderCustomerDetailsById(customerId: requestShipmentBloc.state.senderCustomerId));
        }
        if (requestShipmentBloc.receiverType == SenderReceiverType.store) {
          bloc.add(GetReceiverStoreDetailsById(storeId: requestShipmentBloc.state.receiverStoreId));
        } else {
          bloc.add(GetReceiverCustomerDetailsById(customerId: requestShipmentBloc.state.receiverCustomerId));
        }
        return bloc;
      },
      child: const ShipmentCheckoutPaymentPage(),
    );
  }
}
