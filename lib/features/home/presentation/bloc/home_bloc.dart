import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/domain/use_cases/get_shipments_status_total_count_usecase.dart';
import 'package:saayer/features/home/domain/use_cases/get_total_paid_per_days_usecase.dart';
import 'package:saayer/features/home/domain/use_cases/get_total_shipment_per_days_usecase.dart';
import 'package:saayer/features/home/domain/use_cases/get_user_profile_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final GetShipmentsStatusTotalCountUseCase getShipmentsStatusTotalCountUseCase;
  final GetTotalShipmentPerDaysUseCase getTotalShipmentPerDaysUseCase;
  final GetTotalPaidPerDaysUseCase getTotalPaidPerDaysUseCase;

  HomeBloc({
    required this.getUserProfileUseCase,
    required this.getShipmentsStatusTotalCountUseCase,
    required this.getTotalShipmentPerDaysUseCase,
    required this.getTotalPaidPerDaysUseCase,
  }) : super(const HomeState()) {
    on<InitHome>(_initHome);
    on<RefreshEvent>(_refreshEvent);
    on<GetTotalStatusShipmentsCount>(_getTotalStatusShipmentsCount);
    on<GetTotalShipmentsPerDays>(_getTotalShipmentsPerDays);
    on<GetTotalPaidPerDays>(_getTotalPaidPerDays);
  }

  ///
  ShipmentsCountResponse? shipmentsCountResponse;
  List<CountPerDateDto>? totalShipmentsPerDaysList;
  List<AmountPerDateDto>? totalPaidPerDaysList;

  Future<FutureOr<void>> _initHome(InitHome event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    await _getUserProfile(emit);
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  _getUserProfile(Emitter<HomeState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, ClientGetDto> result = await getUserProfileUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getUserProfile $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_USER_PROFILE)));
    } else {
      final ClientGetDto? rightResult = (result as Right).value;
      log("right getUserProfile $rightResult");
      if (rightResult != null) {
        ///
        emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED), clientDto: rightResult));
        if (rightResult.phoneNo != null) {
          getIt<SharedPrefService>().setClientPhone(rightResult.phoneNo!);
        }
      } else {
        emit(state.copyWith(
          stateHelper:
              const StateHelper(requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_USER_PROFILE),
        ));
      }
    }
  }

  FutureOr<void> _refreshEvent(RefreshEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }

  FutureOr<void> _getTotalStatusShipmentsCount(GetTotalStatusShipmentsCount event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, ShipmentsCountResponse> result =
        await getShipmentsStatusTotalCountUseCase(event.dataRangeDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_SHIPMENTS_COUNTS)));
    } else {
      final ShipmentsCountResponse? rightResult = (result as Right).value;
      if (rightResult != null) {
        ///
        shipmentsCountResponse = rightResult;
        emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED),
            shipmentsCountResponse: rightResult,
            totalPaidPerDaysList: state.totalPaidPerDaysList,
            totalShipmentsPerDaysList: state.totalShipmentsPerDaysList));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_SHIPMENTS_COUNTS),
        ));
      }
    }
  }

  FutureOr<void> _getTotalShipmentsPerDays(GetTotalShipmentsPerDays event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<CountPerDateDto>> result = await getTotalShipmentPerDaysUseCase(event.dataRangeDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_SHIPMENTS_PER_DAYS)));
    } else {
      final List<CountPerDateDto>? rightResult = (result as Right).value;
      if (rightResult != null) {
        ///
        totalShipmentsPerDaysList = rightResult;
        emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED),
            totalShipmentsPerDaysList: rightResult,
            totalPaidPerDaysList: state.totalPaidPerDaysList,
            shipmentsCountResponse: state.shipmentsCountResponse));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_SHIPMENTS_PER_DAYS),
        ));
      }
    }
  }

  FutureOr<void> _getTotalPaidPerDays(GetTotalPaidPerDays event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AmountPerDateDto>> result = await getTotalPaidPerDaysUseCase(event.dataRangeDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_PAID_PER_DAYS)));
    } else {
      final List<AmountPerDateDto>? rightResult = (result as Right).value;
      if (rightResult != null) {
        ///
        totalPaidPerDaysList = rightResult;
        emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED),
            totalPaidPerDaysList: rightResult,
            shipmentsCountResponse: state.shipmentsCountResponse,
            totalShipmentsPerDaysList: state.totalShipmentsPerDaysList));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_PAID_PER_DAYS),
        ));
      }
    }
  }
}
