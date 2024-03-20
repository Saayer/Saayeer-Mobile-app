import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/common/address_widgets/core/utils/enums/enums.dart';
import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';
import 'package:saayer/common/address_widgets/domain/use_cases/get_cities_usecase.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';

part 'address_widgets_event.dart';

part 'address_widgets_state.dart';

@Injectable()
class AddressWidgetsBloc
    extends Bloc<AddressWidgetsEvent, AddressWidgetsState> {
  final GetCitiesUseCase getCitiesUseCase;

  AddressWidgetsBloc({required this.getCitiesUseCase})
      : super(const AddressWidgetsState()) {
    on<GetCities>(_getCities);
  }

  final List<CityEntity> cityEntityList = [];

  Future<FutureOr<void>> _getCities(
      GetCities event, Emitter<AddressWidgetsState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<CityEntity>> result =
        await getCitiesUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitLogInData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES)));
    } else {
      final List<CityEntity>? rightResult = (result as Right).value;
      log("right submitLogInData $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          final bool isEnglish = Localization.isEnglish();
          cityEntityList.addAll(rightResult);
          cityEntityList.sort((a, b) => (isEnglish ? a.nameEn : a.nameAr)
              .toLowerCase()
              .compareTo((isEnglish ? b.nameEn : b.nameAr).toLowerCase()));
          //cityEntityList = List.from(cityEntityList.reversed);
          log("${rightResult.length}", name: "getCities");
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES),
          ));
        }
      } else {
        log("", name: "SubmitLogInEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES),
        ));
      }
    }
  }
}
