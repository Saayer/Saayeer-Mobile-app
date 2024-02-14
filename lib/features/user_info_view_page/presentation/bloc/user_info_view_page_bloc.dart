import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/utils/enums.dart';

part 'user_info_view_page_event.dart';

part 'user_info_view_page_state.dart';

@Injectable()
class UserInfoViewPageBloc
    extends Bloc<UserInfoViewPageEvent, UserInfoViewPageState> {
  UserInfoViewPageBloc() : super(const UserInfoViewPageState()) {
    on<InitUserInfoViewPageEvent>(_initUserInfoViewPageEvent);
    on<GoToNextPageEvent>(_goToNextPageEvent);
  }

  FutureOr<void> _initUserInfoViewPageEvent(
      InitUserInfoViewPageEvent event, Emitter<UserInfoViewPageState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        currentPage: event.currentPage));
  }

  FutureOr<void> _goToNextPageEvent(
      GoToNextPageEvent event, Emitter<UserInfoViewPageState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    SecureStorageService().clearUserCardInfo();

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
