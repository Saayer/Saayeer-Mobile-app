import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/domain/entities/nav_bar_icon_entity.dart';

part 'view_page_event.dart';

part 'view_page_state.dart';

@Injectable()
class ViewPageBloc extends Bloc<ViewPageEvent, ViewPageState> {
  ViewPageBloc() : super(const ViewPageState()) {
    on<InitViewPage>(_initViewPage);
    on<GoToPage>(_goToPage);
    on<Refresh>(_refresh);
  }

  final List<NavBarIconEntity> navBarIconEntityList = [
    const HomeNavBarIconEntity(isSelected: true),
    const ShipmentsNavBarIconEntity(),
    const RequestShipmentNavBarIconEntity(),
    const ProfileNavBarIconEntity(),
    const MoreNavBarIconEntity()
  ];

  FutureOr<void> _initViewPage(event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _goToPage(GoToPage event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final List<NavBarIconEntity> newNavBarIconEntityList = [];
    for (NavBarIconEntity navBarIconEntity in navBarIconEntityList) {
      newNavBarIconEntityList.add(navBarIconEntity.copyWith(
          isSelected:
              (event.navBarIconType == navBarIconEntity.navBarIconType)));
    }

    navBarIconEntityList.clear();
    navBarIconEntityList.addAll(newNavBarIconEntityList);

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  Future<FutureOr<void>> _refresh(
      Refresh event, Emitter<ViewPageState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }
}
