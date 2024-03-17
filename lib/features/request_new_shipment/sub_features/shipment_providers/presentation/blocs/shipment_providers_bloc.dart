import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/data/models/shipment_providers_response.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/domain/use_cases/get_shipment_providers_usecase.dart';

part 'shipment_providers_event.dart';

part 'shipment_providers_state.dart';

@Injectable()
class ShipmentProvidersBloc
    extends Bloc<ShipmentProvidersEvent, ShipmentProvidersState> {
  final GetShipmentProvidersUseCase getShipmentProvidersUseCase;

  ShipmentProvidersBloc({required this.getShipmentProvidersUseCase})
      : super(ShipmentProvidersState()) {
    on<ShipmentProvidersEvent>((event, emit) async {
   if(event is GetShipmentProvidersEvent){
     emit(state.copyWith(
         stateHelper: const StateHelper(requestState: RequestState.LOADING)));

     final Either<Failure, ShipmentProvidersResponse?> result =
     await getShipmentProvidersUseCase(NoParameters());

     if (result.isLeft()) {
       final Failure leftResult = (result as Left).value;
       log("left submitPersonalInfoData $leftResult");
       emit(state.copyWith(
           stateHelper: state.stateHelper.copyWith(
             requestState: RequestState.ERROR,
             //        errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO
           )));
     } else {
       final ShipmentProvidersResponse? rightResult = (result as Right).value;
       log("right submitPersonalInfoData $rightResult");
       if (rightResult != null) {
         if (rightResult.success!) {
           emit(state.copyWith(
             stateHelper: const StateHelper(
                 requestState: RequestState.SUCCESS, loadingMessage: ""),
             shipmentProvidersResponse: rightResult,
           ));
         } else {
           emit(state.copyWith(
             stateHelper: const StateHelper(
               requestState: RequestState.ERROR,
               //          errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO
             ),
             shipmentProvidersResponse: rightResult,
           ));
         }
       } else {
         log("", name: "SubmitPersonalInfoEvent error");
         emit(state.copyWith(
           stateHelper: const StateHelper(
             requestState: RequestState.ERROR,
             //        errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO
           ),
         ));
       }
     }
   }
    });
  }
}
