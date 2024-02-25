import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';

part 'more_event.dart';

part 'more_state.dart';

@Injectable()
class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(const MoreState()) {
    on<RefreshEvent>(_refreshEvent);
    on<LogOutEvent>(_logOutEvent);
  }

  Future<FutureOr<void>> _refreshEvent(
      RefreshEvent event, Emitter<MoreState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        isRefreshed: true));
  }

  Future<FutureOr<void>> _logOutEvent(
      LogOutEvent event, Emitter<MoreState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getIt<LoggedInCheckerService>().logOut();

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        isLoggedOut: true));
  }
}
