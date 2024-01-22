import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/utils/enums.dart';

part 'intro_event.dart';

part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  PageController pageController = PageController();

  IntroBloc() : super(IntroState()) {
    on<InitIntro>(_initIntro);
    on<ChangeCurrentPage>(_changeCurrentPage);
  }

  FutureOr<void> _initIntro(InitIntro event, Emitter<IntroState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));
    pageController = PageController(initialPage: 0, keepPage: true);
    emit(state.copyWith(requestState: RequestState.LOADED));
  }

  FutureOr<void> _changeCurrentPage(
      ChangeCurrentPage event, Emitter<IntroState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));
    pageController.jumpToPage(event.currentPage);
    emit(state.copyWith(
        requestState: RequestState.LOADED, currentPage: event.currentPage));
  }
}
