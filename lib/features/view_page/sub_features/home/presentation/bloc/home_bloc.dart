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
import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/use_cases/get_user_profile_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserProfileUseCase getUserProfileUseCase;

  HomeBloc({required this.getUserProfileUseCase}) : super(const HomeState()) {
    on<InitHome>(_initHome);
    on<RefreshEvent>(_refreshEvent);
  }

  Future<FutureOr<void>> _initHome(
      InitHome event, Emitter<HomeState> emit) async {
    await _getUserProfile(emit);
  }

  _getUserProfile(Emitter<HomeState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, UserProfileEntity> result =
        await getUserProfileUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES)));
    } else {
      final UserProfileEntity? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          addCities(rightResult);
          log("${rightResult.length}", name: "getCities");
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES),
          ));
        }
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES),
        ));
      }
    }
  }

  FutureOr<void> _refreshEvent(
      RefreshEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }
}
