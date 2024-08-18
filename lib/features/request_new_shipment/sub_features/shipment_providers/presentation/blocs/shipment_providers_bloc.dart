import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/use_cases/add_new_shipment_usecase.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/use_cases/get_shipment_providers_usecase.dart';

part 'shipment_providers_event.dart';

part 'shipment_providers_state.dart';

@Injectable()
class ShipmentProvidersBloc extends Bloc<ShipmentProvidersEvent, ShipmentProvidersState> {
  final GetShipmentProvidersUseCase getShipmentProvidersUseCase;
  final AddNewShipmentUseCase addNewShipmentUseCase;

  ShipmentProvidersBloc({required this.getShipmentProvidersUseCase, required this.addNewShipmentUseCase}) : super(const ShipmentProvidersState()) {
    on<GetShipmentProvidersEvent>(_getShipmentProvidersList);
    on<AddNewShipment>(_addNewShipment);
  }

  ///
  ShipmentCost? selectedServiceProvider;

  FutureOr<void> _getShipmentProvidersList(GetShipmentProvidersEvent event, Emitter<ShipmentProvidersState> emit) async {
      emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

      final Either<Failure, List<ShipmentCost>> result =
      await getShipmentProvidersUseCase(event.shipmentSpecsEntity ?? ShipmentAddDto());

      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
            )));
      } else {
        final List<ShipmentCost>? rightResult = (result as Right).value;
        if (rightResult != null) {
          selectedServiceProvider = rightResult.first;
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
            shipmentProvidersResponse: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
            ),
          ));
        }
      }
  }

  FutureOr<void> _addNewShipment(AddNewShipment event, Emitter<ShipmentProvidersState> emit) async{
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, ShipmentGetDto> result =
    await addNewShipmentUseCase(event.shipmentAddDto ?? ShipmentAddDto());

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
            requestState: RequestState.ERROR,
          )));
    } else {
      final ShipmentGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
          shipmentGetDto: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
          ),
        ));
      }
    }
  }
}
