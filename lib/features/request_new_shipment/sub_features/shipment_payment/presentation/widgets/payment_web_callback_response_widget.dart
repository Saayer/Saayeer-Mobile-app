import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyasar/moyasar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/errors/shipment_payment_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/bloc/shipment_payment_bloc.dart';

class PaymentWebCallbackResponseWidget extends StatelessWidget {
  final String status;
  final String message;

  const PaymentWebCallbackResponseWidget({super.key, required this.status,required this.message});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<ShipmentPaymentBloc>();
        var shipmentId = getIt<SharedPrefService>().getShipmentId();
        var paymentResponse = getIt<SharedPrefService>().getPaymentResponse();
        bloc.add(HandleWebCallbackResponse(
          paymentResponse: paymentResponse,
          status: status,
          message: message,
          shipmentId: shipmentId ?? 0,
        ));
        return bloc;
      },
      child: BlocConsumer<ShipmentPaymentBloc, ShipmentPaymentState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) async {
          final ShipmentPaymentBloc bloc = BlocProvider.of<ShipmentPaymentBloc>(context);
          final bool isLoading = (bloc.state.stateHelper.requestState == PaymentRequestState.WEBLOADING);
          LoadingDialog.setIsLoading(context, isLoading);

          if (!isLoading) {
            if (state.stateHelper.requestState == PaymentRequestState.WEBSUCCESS) {
              ///
              getIt<NavigationService>().navigateAndReplacementNamed(Routes.paymentSuccessNamedPage);
            }
            if (state.stateHelper.requestState == PaymentRequestState.WEBERROR) {
              ///
              ShipmentPaymentErrorHandler(status: PaymentStatus.failed, message: 'create_payment_failed')();
            }
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
              body: Container(),
            ),
          );
        },
      ),
    );
  }
}
