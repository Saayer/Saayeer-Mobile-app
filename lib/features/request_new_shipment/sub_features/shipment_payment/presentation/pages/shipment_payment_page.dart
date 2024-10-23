import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyasar/moyasar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/errors/shipment_payment_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/bloc/shipment_payment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/widgets/moyasar_payment_method_widget.dart';

class ShipmentPaymentPage extends StatelessWidget {
  const ShipmentPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentPaymentBloc bloc = BlocProvider.of<ShipmentPaymentBloc>(context);

    return BlocConsumer<ShipmentPaymentBloc, ShipmentPaymentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (bloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            ///
            getIt<NavigationService>().navigateAndReplacementNamed(Routes.paymentSuccessNamedPage);
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ///
            ShipmentPaymentErrorHandler(status: PaymentStatus.failed, message: 'create_payment_failed')();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: _buildPaymentBody(bloc, requestShipmentBloc),
        );
      },
    );
  }

  _buildPaymentBody(ShipmentPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'checkout'.tr(),
              style: AppTextStyles.mainFocusedLabel(),
            ),
          ),
          const SizedBox(height: 10),
          MoyasarPaymentMethodWidget(
              bloc: bloc,
              orderDesc: requestShipmentBloc.state.shipmentDtoBody?.contentDesc ?? '',
              amount: requestShipmentBloc.state.selectedServiceProvider?.cost ?? 0,
              weight: requestShipmentBloc.state.shipmentDtoBody?.weight ?? 0,
              shipmentId: requestShipmentBloc.state.shipmentId ?? 0,
              clientPhone: getIt<SharedPrefService>().getClientPhone() ?? ''),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
