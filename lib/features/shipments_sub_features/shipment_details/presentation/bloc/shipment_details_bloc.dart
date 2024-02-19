import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_details_entity.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_tracking_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/outbound_shipment_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/shipment_entity.dart';

part 'shipment_details_event.dart';

part 'shipment_details_state.dart';

@Injectable()
class ShipmentDetailsBloc
    extends Bloc<ShipmentDetailsEvent, ShipmentDetailsState> {
  ShipmentDetailsBloc() : super(const ShipmentDetailsState()) {
    on<InitShipmentDetails>(_initShipmentDetails);
  }

  final TextEditingController promoCodeController = TextEditingController();

  FutureOr<void> _initShipmentDetails(
      InitShipmentDetails event, Emitter<ShipmentDetailsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    late final ShipmentDetailsEntity shipmentDetailsEntity;
    if (event.shipmentEntity.shipmentsType == ShipmentsTypes.OUTBOUND) {
      final OutboundShipmentEntity outboundShipmentEntity =
          (event.shipmentEntity as OutboundShipmentEntity);
      shipmentDetailsEntity = ShipmentDetailsEntity(
          id: event.shipmentEntity.id,
          type: "Electronics",
          weight: "10",
          price: event.shipmentEntity.amount,
          date: event.shipmentEntity.date,
          senderName: "Tamer Hosny",
          senderAddress: "Gadda",
          receiverName: outboundShipmentEntity.receiverName,
          receiverAddress: "Makkah",
          shippingFees: "43.99",
          totalPrice: "543.99",
          shipmentsType: event.shipmentEntity.shipmentsType,
          shipmentStatus: event.shipmentEntity.shipmentStatus);
    } else {}
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        shipmentDetailsEntity: shipmentDetailsEntity,
        shipmentTrackingEntity: ShipmentTrackingEntity()));
  }
}
