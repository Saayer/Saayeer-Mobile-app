import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:built_collection/src/list.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/core/utils/state_helper/state_helper.dart';
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

  DateRangeDto dataRangeDto = DateRangeDto((b) => b
    ..startDate = DateTimeUtil.getFirstDayDateOfCurrentMonthUTC()
    ..endDate = DateTimeUtil.getLastDayDateOfCurrentMonthUTC());

  /// empty shipments list with current month length
  CountPerDateResponse shipmentsPerDaysList = CountPerDateResponse((b) => b
    ..total = 0
    ..counts = ListBuilder(List.generate(
        (DateTimeUtil.getDaysInMonth(DateTime.now().year, DateTime.now().month)),
        (index) => CountPerDateItemDto((b) => b
          ..count = 0
          ..date = DateTime.now().copyWith(day: index + 1)))));

  /// empty amounts list with current month length
  AmountPerDateResponse amountsPerDaysList = AmountPerDateResponse((b) => b
    ..total = 0
    ..amounts = ListBuilder(List.generate(
        (DateTimeUtil.getDaysInMonth(DateTime.now().year, DateTime.now().month)),
        (index) => AmountPerDateDto((b) => b
          ..amount = 0
          ..date = DateTime.now().copyWith(day: index + 1)))));

  ///
  ShipmentsCountResponse? shipmentsCountResponse;
  CountPerDateResponse? countPerDateResponse;
  AmountPerDateResponse? amountPerDateResponse;

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
    add(GetTotalStatusShipmentsCount(dataRangeDto: DateRangeDto()));
    add(GetTotalShipmentsPerDays(dataRangeDto: dataRangeDto));
    add(GetTotalPaidPerDays(dataRangeDto: dataRangeDto));
  }

  FutureOr<void> _getTotalStatusShipmentsCount(GetTotalStatusShipmentsCount event, Emitter<HomeState> emit) async {
    emit(state.copyWith(shipmentsCountStateHelper: const HomeStateHelper(requestState: HomeRequestState.LOADING_SHIPMENTS_COUNT)));

    final Either<Failure, ShipmentsCountResponse> result =
        await getShipmentsStatusTotalCountUseCase(event.dataRangeDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          shipmentsCountStateHelper: state.shipmentsCountStateHelper.copyWith(
              requestState: HomeRequestState.ERROR_SHIPMENTS_COUNT,
              errorStatus: HomeErrorStatus.ERROR_GET_SHIPMENTS_COUNTS)));
    } else {
      final ShipmentsCountResponse? rightResult = (result as Right).value;
      if (rightResult != null) {
        ///
        shipmentsCountResponse = rightResult;
        emit(state.copyWith(
            shipmentsCountStateHelper: const HomeStateHelper(requestState: HomeRequestState.LOADED_SHIPMENTS_COUNT),
            shipmentsCountResponse: rightResult));
      } else {
        emit(state.copyWith(
          shipmentsCountStateHelper: const HomeStateHelper(
              requestState: HomeRequestState.ERROR_SHIPMENTS_COUNT,
              errorStatus: HomeErrorStatus.ERROR_GET_SHIPMENTS_COUNTS),
        ));
      }
    }
  }

  FutureOr<void> _getTotalShipmentsPerDays(GetTotalShipmentsPerDays event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        shipmentsChartStateHelper: const HomeStateHelper(requestState: HomeRequestState.LOADING_SHIPMENTS_COUNT_PER_DAY)));

    final Either<Failure, CountPerDateResponse> result = await getTotalShipmentPerDaysUseCase(event.dataRangeDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          shipmentsChartStateHelper: state.shipmentsCountStateHelper.copyWith(
              requestState: HomeRequestState.ERROR_SHIPMENTS_COUNT_PER_DAY,
              errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_SHIPMENTS_PER_DAYS)));
    } else {
      final CountPerDateResponse? rightResult = (result as Right).value;
      if (rightResult != null) {
        countPerDateResponse = rightResult;
        if (rightResult.counts != null) {
          ///
          List<CountPerDateItemDto> shipmentList = shipmentsPerDaysList.counts!.toList();
          countPerDateResponse = rightResult;
          for (int i = 0; i < shipmentList.length; i++) {
            for (var item in countPerDateResponse!.counts!) {
              if (DateTimeUtil.convertUTCDateToLocalFullFormat(item.date!.toString())!
                  .isSameDay(shipmentList[i].date!)) {
                shipmentList[i] = CountPerDateItemDto((b) => b
                  ..count = item.count
                  ..date = DateTimeUtil.convertUTCDateToLocalFullFormat(item.date!.toString()));
              }
            }
          }
          shipmentsPerDaysList = CountPerDateResponse((b) => b
            ..total = countPerDateResponse!.total
            ..counts = ListBuilder(shipmentList));
        }

        emit(state.copyWith(
            shipmentsChartStateHelper: const HomeStateHelper(requestState: HomeRequestState.LOADED_SHIPMENTS_COUNT_PER_DAY),
            totalShipmentsPerDaysList: rightResult));
      } else {
        emit(state.copyWith(
          shipmentsChartStateHelper: const HomeStateHelper(
              requestState: HomeRequestState.ERROR_SHIPMENTS_COUNT_PER_DAY,
              errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_SHIPMENTS_PER_DAYS),
        ));
      }
    }
  }

  FutureOr<void> _getTotalPaidPerDays(GetTotalPaidPerDays event, Emitter<HomeState> emit) async {
    emit(state.copyWith(paidAmountsChartStateHelper: const HomeStateHelper(requestState: HomeRequestState.LOADING_PAID_COUNT_PER_DAY)));

    final Either<Failure, AmountPerDateResponse> result = await getTotalPaidPerDaysUseCase(event.dataRangeDto);

    if (result.isLeft()) {
      emit(state.copyWith(
          paidAmountsChartStateHelper: state.shipmentsCountStateHelper.copyWith(
              requestState: HomeRequestState.ERROR_PAID_COUNT_PER_DAY,
              errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_PAID_PER_DAYS)));
    } else {
      final AmountPerDateResponse? rightResult = (result as Right).value;
      if (rightResult != null) {
        amountPerDateResponse = rightResult;
        if (rightResult.amounts != null) {
          ///
          List<AmountPerDateDto> amountList = amountsPerDaysList.amounts!.toList();
          for (int i = 0; i < amountList.length; i++) {
            for (var item in amountPerDateResponse!.amounts!) {
              if (DateTimeUtil.convertUTCDateToLocalFullFormat(item.date!.toString())!.isSameDay(amountList[i].date!)) {
                amountList[i] = AmountPerDateDto((b) => b
                  ..amount = item.amount
                  ..date = DateTimeUtil.convertUTCDateToLocalFullFormat(item.date!.toString()));
              }
            }
          }

          emit(state.copyWith(
              paidAmountsChartStateHelper:
                  const HomeStateHelper(requestState: HomeRequestState.LOADED_PAID_COUNT_PER_DAY, loadingMessage: ''),
              totalPaidPerDaysList: rightResult));
        }
      } else {
        emit(state.copyWith(
          paidAmountsChartStateHelper: const HomeStateHelper(
              requestState: HomeRequestState.ERROR_PAID_COUNT_PER_DAY,
              errorStatus: HomeErrorStatus.ERROR_GET_TOTAL_PAID_PER_DAYS),
        ));
      }
    }
  }
}
