import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'request_shipment_event.dart';
part 'request_shipment_state.dart';

@Injectable()
class RequestShipmentBloc extends Bloc<RequestShipmentEvent, RequestShipmentState> {
  RequestShipmentBloc() : super(const RequestShipmentState()) {
    on<InitUserInfoViewPageEvent>(_initUserInfoViewPageEvent);
    on<GoToNextPageEvent>(_goToNextPageEvent);
  }

  FutureOr<void> _initUserInfoViewPageEvent(
      InitUserInfoViewPageEvent event, Emitter<RequestShipmentState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        currentPage: event.currentPage));
  }

  FutureOr<void> _goToNextPageEvent(
      GoToNextPageEvent event, Emitter<RequestShipmentState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    // getIt<SecureStorageService>().clearUserCardInfo();

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

}
