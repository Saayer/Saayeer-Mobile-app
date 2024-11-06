import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/core/errors/shipment_providers_error_handler.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/blocs/shipment_providers_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/widgets/empty_service_providers.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/widgets/shipment_provider_card.dart';

class ShipmentProvidersPage extends StatefulWidget {
  const ShipmentProvidersPage({super.key});

  @override
  State<ShipmentProvidersPage> createState() => _ShipmentProvidersPageState();
}

class _ShipmentProvidersPageState extends State<ShipmentProvidersPage> {
  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentProvidersBloc shipmentProvidersBloc = BlocProvider.of<ShipmentProvidersBloc>(context);
    return BlocConsumer<ShipmentProvidersBloc, ShipmentProvidersState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            requestShipmentBloc.add(GoToNextPageEvent());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ///
            ShipmentProvidersErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: _buildShipmentServiceProvidersBodyWidget(shipmentProvidersBloc),
          bottomSheet: _buildNextButtonWidget(shipmentProvidersBloc, requestShipmentBloc),
        );
      },
    );
  }

  _buildNextButtonWidget(ShipmentProvidersBloc shipmentProvidersBloc, RequestNewShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "next",
        isEnabled: shipmentProvidersBloc.selectedServiceProvider != null ? true : false,
        borderRadius: 16,
        onPressed: () {
          if (shipmentProvidersBloc.selectedServiceProvider != null) {
            requestShipmentBloc.add(
                SetSelectedServiceProvider(selectedServiceProvider: shipmentProvidersBloc.selectedServiceProvider!));
            requestShipmentBloc.add(GoToNextPageEvent());
          } else {
            SaayerToast().showErrorToast(msg: "must_select_service_provider".tr());
          }
        },
      ),
    );
  }

  _buildShipmentServiceProvidersBodyWidget(ShipmentProvidersBloc shipmentProvidersBloc) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'service_providers'.tr(),
                style: AppTextStyles.mainFocusedLabel(),
              ),
            ),
            const SizedBox(height: 10),
            shipmentProvidersBloc.state.shipmentProvidersResponse == null
                ? Container()
                : _buildServiceProvidersListWidget(shipmentProvidersBloc),
            const SizedBox(height: 10),
            _buildServiceProviderNote(shipmentProvidersBloc),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom + 100,
            ),
          ],
        ),
      ),
    );
  }

  _buildServiceProvidersListWidget(ShipmentProvidersBloc shipmentProvidersBloc) {
    return shipmentProvidersBloc.state.shipmentProvidersResponse!.isEmpty
        ? const EmptyServiceProviders()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: shipmentProvidersBloc.state.shipmentProvidersResponse!.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final ServiceCost shipmentProviderModel = shipmentProvidersBloc.state.shipmentProvidersResponse![index];

              return ShipmentProviderCard(
                shipmentProviderModel: shipmentProviderModel,
                groupValue: shipmentProvidersBloc.selectedServiceProvider,
                onChanged: (ServiceCost? model) {
                  setState(() {
                    shipmentProvidersBloc.selectedServiceProvider = model;
                  });
                },
              );
            });
  }

  _buildServiceProviderNote(ShipmentProvidersBloc shipmentProvidersBloc) {
    if (shipmentProvidersBloc.selectedServiceProvider == null) {
      return Container();
    } else {
      if (shipmentProvidersBloc.selectedServiceProvider!.company != null) {
        return Text('${shipmentProvidersBloc.selectedServiceProvider!.company!.toLowerCase()}_note_msg'.tr(),
            style: AppTextStyles.paragraph(SaayerTheme().getColorsPalette.greyColor));
      } else {
        return Container();
      }
    }
  }
}
