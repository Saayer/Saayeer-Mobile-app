import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/helper/outbound_shipment_widget_helper.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/shipment_entity.dart';

class ShipmentsListView extends StatelessWidget {
  final List<ShipmentEntity> shipmentEntityList;

  const ShipmentsListView({super.key, required this.shipmentEntityList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: shipmentEntityList.length,
        itemBuilder: (context, index) {
          final ShipmentEntity shipmentEntity = shipmentEntityList[index];
          switch (shipmentEntity.shipmentsType) {
            case ShipmentsTypes.INCOMING:
              {
                return Text("");
              }
            case ShipmentsTypes.OUTBOUND:
              {
                return OutboundShipmentWidgetHelper()
                    .getOutboundShipmentWidget(shipmentEntity);
              }
          }
        });
  }
}
