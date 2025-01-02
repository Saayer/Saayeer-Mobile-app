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
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/use_cases/get_shipment_providers_usecase.dart';

part 'shipment_providers_event.dart';

part 'shipment_providers_state.dart';

@Injectable()
class ShipmentProvidersBloc extends Bloc<ShipmentProvidersEvent, ShipmentProvidersState> {
  final GetShipmentProvidersUseCase getShipmentProvidersUseCase;

  ShipmentProvidersBloc({
    required this.getShipmentProvidersUseCase,
  }) : super(const ShipmentProvidersState()) {
    on<GetShipmentProvidersEvent>(_getShipmentProvidersList);
  }

  ///
  LogisticCostDto? selectedServiceProvider;

  FutureOr<void> _getShipmentProvidersList(
      GetShipmentProvidersEvent event, Emitter<ShipmentProvidersState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<LogisticCostDto>> result =
        await getShipmentProvidersUseCase(event.shipmentSpecsEntity ?? ShipmentCostRequest());

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
        requestState: RequestState.ERROR,
        errorStatus: ShipmentProvidersErrorStatus.ERROR_GET_SHIPMENT_PROVIDERS,
      )));
    } else {
      final List<LogisticCostDto>? rightResult = (result as Right).value;
      if (rightResult != null) {
        if (!(rightResult.first.hasError ?? false)) {
          selectedServiceProvider = rightResult.first;
        }

        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          shipmentProvidersResponse: rightResult,
        ));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
            requestState: RequestState.ERROR,
            errorStatus: ShipmentProvidersErrorStatus.ERROR_GET_SHIPMENT_PROVIDERS,
          ),
        ));
      }
    }
  }
}
