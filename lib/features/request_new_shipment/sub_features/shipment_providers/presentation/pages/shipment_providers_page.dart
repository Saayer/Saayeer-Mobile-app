import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_provider_model.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/blocs/shipment_providers_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/widgets/shipment_provider_card.dart';

class ShipmentProvidersPage extends StatelessWidget {
  const ShipmentProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShipmentProvidersBloc shipmentProvidersBloc =
        BlocProvider.of<ShipmentProvidersBloc>(context);
    return BlocConsumer<ShipmentProvidersBloc, ShipmentProvidersState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          // if (state.stateHelper.requestState == RequestState.SUCCESS) {
          // userInfoViewPageBloc.add(GoToNextPageEvent());
          // }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            // PersonalInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        // final bool isFromHome = state.isFromHome;
        return RefreshIndicator(
          onRefresh: () async {
            // shipmentsBloc.add(RefreshShipments());
          },
          color: SaayerTheme().getColorsPalette.primaryColor,
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          child: state.shipmentProvidersResponse != null
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.shipmentProvidersResponse!.data!.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final ShipmentProviderModel shipmentProviderModel =
                        state.shipmentProvidersResponse!.data![index];
                    final bool isLast = (index ==
                        state.shipmentProvidersResponse!.data!.length - 1);

                    return ShipmentProviderCard(
                        shipmentProviderModel: shipmentProviderModel);
                  })
              : Container(),
        );
      },
    );
  }
}
