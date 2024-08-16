import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/blocs/shipment_providers_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/pages/shipment_providers_page.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';

class ShipmentProvidersScreen extends StatelessWidget {
  const ShipmentProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RequestNewShipmentBloc, RequestNewShipmentState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState !=
                nextState.stateHelper.requestState),
        listener: (context, state) async {},
        builder: (context, state) {
          return BlocProvider<ShipmentProvidersBloc>(
              create: (context) {
                final ShipmentProvidersBloc bloc =
                    getIt<ShipmentProvidersBloc>();
                bloc.add(GetShipmentProvidersEvent(
                  state.addressInfoEntity,
                  state.shipmentDtoBody,
                ));
                return bloc;
              },
              child: ShipmentProvidersPage());
        });
  }
}
