import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/helper/outbound_shipment_widget_helper.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/shipment_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';

class ShipmentsListView extends StatelessWidget {
  final List<ShipmentEntity> shipmentEntityList;

  const ShipmentsListView({super.key, required this.shipmentEntityList});

  @override
  Widget build(BuildContext context) {
    final ShipmentsBloc shipmentsBloc = BlocProvider.of<ShipmentsBloc>(context);
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            shipmentsBloc.add(RefreshShipments());
          },
          color: SaayerTheme().getColorsPalette.primaryColor,
          backgroundColor:  SaayerTheme().getColorsPalette.backgroundColor,
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
                          .getOutboundShipmentWidget(shipmentEntity);
                      break;
                    }
                }
                return Column(
                  children: [
                    shipmentWidget,
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
