import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/shipment_details_tracking_info/domain/entities/shipment_tracking_entity.dart';

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
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        shipmentDto: event.shipmentDto,
        shipmentTrackingEntity:
            const ShipmentTrackingEntity(trackingId: "ytrtyc23243trtretr")));
  }
}
