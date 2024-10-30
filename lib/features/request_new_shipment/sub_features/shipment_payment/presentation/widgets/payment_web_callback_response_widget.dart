import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyasar/moyasar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/errors/shipment_payment_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/bloc/shipment_payment_bloc.dart';
import "package:universal_html/html.dart" as html;

class PaymentWebCallbackResponseWidget extends StatelessWidget {
  final String status;
  final String message;

  const PaymentWebCallbackResponseWidget({super.key, required this.status, required this.message});

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
              ShipmentPaymentErrorHandler(status: PaymentStatus.failed, message: state.stateHelper.errorMessage)();
            }
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
              bottomSheet: (state.stateHelper.requestState == PaymentRequestState.WEBLOADING)
                  ? Container()
                  : _buildButtonsWidget(),
              body: (state.stateHelper.requestState == PaymentRequestState.WEBLOADING)
                  ? Container()
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          Constants.getGifPath("error.gif"),
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  _buildButtonsWidget() {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SaayerDefaultTextButton(
            text: "new_shipment",
            isEnabled: true,
            enabledColor: SaayerTheme().getColorsPalette.whiteColor,
            borderColor: SaayerTheme().getColorsPalette.primaryColor,
            textStyle: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.primaryColor),
            borderRadius: 16,
            onPressed: () {
              ///
              getIt<NavigationService>().navigateAndReplacementNamed(Routes.requestNewShipmentNamedPage);
              if (kIsWeb) {
                html.window.history.pushState(null, 'Home', '/');
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          SaayerDefaultTextButton(
            text: "home",
            isEnabled: true,
            borderRadius: 16,
            onPressed: () {
              ///
              getIt<NavigationService>().navigateAndFinishNamed(Routes.viewPageNamedPage);
              if (kIsWeb) {
                html.window.history.pushState(null, 'Home', '/');
              }
            },
          ),
        ],
      ),
    );
  }
}
