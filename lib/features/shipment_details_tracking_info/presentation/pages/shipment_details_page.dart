import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/shipment_details_tracking_info/data/core/errors/shipment_tracking_details_error_handler.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/shipment_details_types_tab_bar.dart';

class ShipmentDetailsPage extends StatelessWidget {
  final ShipmentGetDto shipmentEntity;
  final ShipmentGetDtoExtended adminShipmentDto;

  const ShipmentDetailsPage({
    super.key,
    required this.shipmentEntity,
    required this.adminShipmentDto,
  });

  @override
  Widget build(BuildContext context) {
    final ShipmentDetailsBloc shipmentDetailsBloc = BlocProvider.of<ShipmentDetailsBloc>(context);
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (shipmentDetailsBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ///
            ShipmentTrackingDetailsErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            appBar: BaseAppBar(
              title:
                  "${"shipment".tr()} ${UserUtils.isAdmin() ? adminShipmentDto.shipmentId : shipmentEntity.shipmentId}",
              showBackLeading: true,
            ),
            body: const ShipmentDetailsTabBar(),
          ),
        );
      },
    );
  }
}
