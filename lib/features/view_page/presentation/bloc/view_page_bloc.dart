import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/view_page/domain/entities/nav_bar_icon_entity.dart';

part 'view_page_event.dart';

part 'view_page_state.dart';

class ViewPageBloc extends Bloc<ViewPageEvent, ViewPageState> {
  ViewPageBloc() : super(const ViewPageState()) {
    on<InitViewPage>(_initViewPage);
  }

  final List<NavBarIconEntity> navBarIconEntityList = [
    const HomeNavBarIconEntity(),
    const ShipmentsNavBarIconEntity(),
    const EBillsNavBarIconEntity(),
    const MoreNavBarIconEntity()
  ];

  FutureOr<void> _initViewPage(event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }
}
