import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/domain/entities/shipment_specs_entity.dart';

part 'request_shipment_event.dart';

part 'request_shipment_state.dart';

@Injectable()
class RequestShipmentBloc
    extends Bloc<RequestShipmentEvent, RequestShipmentState> {
  RequestShipmentBloc() : super(const RequestShipmentState()) {
    on<InitRequestShipmentViewPageEvent>(_initRequestShipmentViewPageEvent);
    on<GoToNextPageEvent>(_goToNextPageEvent);
    on<AddAddressInfoEvent>(_addAddressInfoEvent);
    on<AddShipmentSpecsEvent>(_addShipmentSpecsEvent);
  }

  FutureOr<void> _initRequestShipmentViewPageEvent(
      InitRequestShipmentViewPageEvent event,
      Emitter<RequestShipmentState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        currentPage: event.currentPage));
  }

  FutureOr<void> _goToNextPageEvent(
      GoToNextPageEvent event, Emitter<RequestShipmentState> emit) async{
    print('_goToNextPageEvent_goToNextPageEvent_goToNextPageEvent_goToNextPageEvent');
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    // getIt<SecureStorageService>().clearUserCardInfo();
await Future.delayed(Duration(seconds: 1));
    if (state.currentPage + 1 < 3) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED),
          currentPage: state.currentPage + 1));
    } else {
      emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.SUCCESS),
      ));
    }
  }

  FutureOr<void> _addAddressInfoEvent(
      AddAddressInfoEvent event, Emitter<RequestShipmentState> emit) async{
    emit(
      state.copyWith(
        stateHelper: const StateHelper(
          requestState: RequestState.LOADING,
        ),
        addressInfoEntity: event.addressInfoEntity,
      ),
    );

    print('state.addressInfoEntity.name');
    print(state.addressInfoEntity!.name);
    print(state.currentPage);


  await  _goToNextPageEvent(GoToNextPageEvent() , emit) ;


    print(state.currentPage);

  }

  FutureOr<void> _addShipmentSpecsEvent(AddShipmentSpecsEvent event, Emitter<RequestShipmentState> emit) {
    print('_addAddressInfoEvent');
    emit(
      state.copyWith(
        stateHelper: const StateHelper(
          requestState: RequestState.LOADING,
        ),
        shipmentSpecsEntity: event.shipmentSpecsEntity,
      ),
    );

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        currentPage: state.currentPage + 1));

    print('state.addressInfoEntity.name');
    print(state.addressInfoEntity!.name);
    print(state.currentPage);


  }
}
