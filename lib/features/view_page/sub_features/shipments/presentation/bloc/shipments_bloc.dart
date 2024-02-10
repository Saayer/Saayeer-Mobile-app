import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/outbound_shipment_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/shipment_entity.dart';

part 'shipments_event.dart';

part 'shipments_state.dart';

@Injectable()
class ShipmentsBloc extends Bloc<ShipmentsEvent, ShipmentsState> {
  ShipmentsBloc() : super(const ShipmentsState()) {
    on<InitShipments>(_initShipments);
    on<SelectShipmentType>(_selectShipmentType);
  }

  FutureOr<void> _initShipments(
      InitShipments event, Emitter<ShipmentsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Map<ShipmentsTypes, List<ShipmentEntity>> shipmentEntityListMap = {};
    shipmentEntityListMap[ShipmentsTypes.INCOMING] = [];
    shipmentEntityListMap[ShipmentsTypes.OUTBOUND] = List.generate(
        10,
        (index) => OutboundShipmentEntity(
            id: ((index + 1) * Random().nextInt(10) + 1).toString(),
            date: Constants.formattedNowDate.toString(),
            amount: ((index + 10) * Random().nextInt(100) + 50).toString(),
            receiverName: "Amr Diab",
            shipmentStatus: ShipmentStatus.values[Random().nextInt(3)]));
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        shipmentEntityListMap: shipmentEntityListMap));
  }

  FutureOr<void> _selectShipmentType(
      SelectShipmentType event, Emitter<ShipmentsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        selectedShipmentsType: event.shipmentsType));
  }
}
