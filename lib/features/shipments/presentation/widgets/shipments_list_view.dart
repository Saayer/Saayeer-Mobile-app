import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/screens/shipment_details_screen.dart';
import 'package:saayer/features/shipments/core/helper/outbound_shipment_widget_helper.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/domain/entities/shipment_entity.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';

class ShipmentsListView extends StatelessWidget {
  final List<ShipmentEntity> shipmentEntityList;

  const ShipmentsListView({super.key, required this.shipmentEntityList});

  @override
  Widget build(BuildContext context) {
    final ShipmentsBloc shipmentsBloc = BlocProvider.of<ShipmentsBloc>(context);
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bool isFromHome = state.isFromHome;
        return RefreshIndicator(
          onRefresh: () async {
            shipmentsBloc.add(RefreshShipments());
          },
          color: SaayerTheme().getColorsPalette.primaryColor,
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: shipmentEntityList.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final ShipmentEntity shipmentEntity = shipmentEntityList[index];
                final bool isLast = (index == shipmentEntityList.length - 1);
                Widget shipmentWidget;
                switch (shipmentEntity.shipmentsType) {
                  case ShipmentsTypes.INCOMING:
                    {
                      shipmentWidget = Text("");
                      break;
                    }
                  case ShipmentsTypes.OUTBOUND:
                    {
                      shipmentWidget = OutboundShipmentWidgetHelper()
                          .getOutboundShipmentWidget(
                              shipmentEntity, isFromHome);
                      break;
                    }
                }
                return Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          getIt<NavigationService>().navigateTo(
                              ShipmentDetailsScreen(
                                  shipmentEntity: shipmentEntity));
                        },
                        child: shipmentWidget),
                    if (isLast)
                      SizedBox(
                        height: 50.h,
                      )
                  ],
                );
              }),
        );
      },
    );
  }
}
