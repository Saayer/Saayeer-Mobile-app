import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/utils/enums.dart';

part 'view_page_event.dart';

part 'view_page_state.dart';

class ViewPageBloc extends Bloc<ViewPageEvent, ViewPageState> {
  ViewPageBloc() : super(ViewPageState()) {
    on<InitViewPage>(_initViewPage);
    on<GoToPage>(_goToPage);
    on<ToggleSlider>(_toggleSlider);
  }

  FutureOr<void> _initViewPage(event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));
    emit(state.copyWith(requestState: RequestState.LOADED, selectedPage: 0));
  }

  FutureOr<void> _goToPage(GoToPage event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));
    if (event.pageController!.hasClients) {
      event.pageController!.jumpToPage(event.pageIndex!);
      emit(state.copyWith(
          requestState: RequestState.LOADED, selectedPage: event.pageIndex));
    }
  }

  FutureOr<void> _toggleSlider(
      ToggleSlider event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(requestState: RequestState.LOADING));
    emit(state.copyWith(
        requestState: RequestState.LOADED, isSliderOpened: event.isOpened));
  }
}
