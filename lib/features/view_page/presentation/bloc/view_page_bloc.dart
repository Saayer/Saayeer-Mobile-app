import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/current_user/current_user_enums.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
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
    on<SetShipmentsFiltersValue>(_setShipmentsFiltersValue);
  }

  final List<NavBarIconEntity> navBarIconEntityList = [
    const HomeNavBarIconEntity(isSelected: true),
    const ShipmentsNavBarIconEntity(),
    const RequestShipmentNavBarIconEntity(),
    const AddressesNavBarIconEntity(),
    const MoreNavBarIconEntity()
  ];

  final List<NavBarIconEntity> adminNavBarList = [
    const HomeNavBarIconEntity(isSelected: true),
    const ShipmentsNavBarIconEntity(),
    const ClientsNavBarIconEntity(),
    const AdminMoreNavBarIconEntity()
  ];

  /// use these values in shipments list screen with filter
  ShipmentStatusEnum? initExportShipmentsStatusFilter;
  DateTime? exportShipmentDateFrom;
  DateTime? exportShipmentDateTo;

  /// use these values in admin shipments list screen with filter
  ShipmentStatusEnum? initAdminShipmentsStatusFilter;
  DateTime? adminShipmentDateFrom;
  DateTime? adminShipmentDateTo;

  Future<FutureOr<void>> _initViewPage(event, Emitter<ViewPageState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final CurrentUserTypes currentUserType = await getIt<LoggedInCheckerService>().getCurrentUserType();
    final bool isGuest = (currentUserType == CurrentUserTypes.GUEST);

    log("$isGuest", name: "initViewPage");
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED), isGuest: isGuest));
    await _goToPage(GoToPage(navBarIconType: event.navBarIconType), emit);
  }

  FutureOr<void> _goToPage(GoToPage event, Emitter<ViewPageState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final List<NavBarIconEntity> newNavBarIconEntityList = [];
    if (UserUtils.isAdmin()) {
      for (NavBarIconEntity navBarIconEntity in adminNavBarList) {
        newNavBarIconEntityList
            .add(navBarIconEntity.copyWith(isSelected: (event.navBarIconType == navBarIconEntity.navBarIconType)));
      }

      adminNavBarList.clear();
      adminNavBarList.addAll(newNavBarIconEntityList);
    } else {
      for (NavBarIconEntity navBarIconEntity in navBarIconEntityList) {
        newNavBarIconEntityList
            .add(navBarIconEntity.copyWith(isSelected: (event.navBarIconType == navBarIconEntity.navBarIconType)));
      }

      navBarIconEntityList.clear();
      navBarIconEntityList.addAll(newNavBarIconEntityList);
    }

    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  Future<FutureOr<void>> _refresh(Refresh event, Emitter<ViewPageState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _setShipmentsFiltersValue(SetShipmentsFiltersValue event, Emitter<ViewPageState> emit) {
    if(UserUtils.isAdmin()){
      initAdminShipmentsStatusFilter = event.initExportShipmentStatusFilter;
      adminShipmentDateFrom = event.exportShipmentDateFrom;
      adminShipmentDateTo = event.exportShipmentDateTo;
    }else{
      initExportShipmentsStatusFilter = event.initExportShipmentStatusFilter;
      exportShipmentDateFrom = event.exportShipmentDateFrom;
      exportShipmentDateTo = event.exportShipmentDateTo;
    }

  }
}
