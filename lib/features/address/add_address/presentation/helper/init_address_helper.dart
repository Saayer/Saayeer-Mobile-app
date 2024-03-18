import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';

class InitAddressHelper {

  AddAddressState state;

  InitAddressHelper({
    required this.state,
  });

  void updateState(AddAddressState state) {
    this.state = state;
  }

  // getCities(void Function(List<CityEntity>) addCities,
  //     Emitter<AddAddressState> emit) async {
  //   emit(state.copyWith(
  //       stateHelper: const StateHelper(requestState: RequestState.LOADING)));
  //
  //   final Either<Failure, List<CityEntity>> result =
  //       await getCitiesUseCase(const NoParameters());
  //
  //   if (result.isLeft()) {
  //     final Failure leftResult = (result as Left).value;
  //     log("left submitLogInData $leftResult");
  //     emit(state.copyWith(
  //         stateHelper: state.stateHelper.copyWith(
  //             requestState: RequestState.ERROR,
  //             errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES)));
  //   } else {
  //     final List<CityEntity>? rightResult = (result as Right).value;
  //     log("right submitLogInData $rightResult");
  //     if (rightResult != null) {
  //       if (rightResult.isNotEmpty) {
  //         addCities(rightResult);
  //         log("${rightResult.length}", name: "getCities");
  //         emit(state.copyWith(
  //           stateHelper: const StateHelper(
  //               requestState: RequestState.LOADED, loadingMessage: ""),
  //         ));
  //       } else {
  //         emit(state.copyWith(
  //           stateHelper: const StateHelper(
  //               requestState: RequestState.ERROR,
  //               errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES),
  //         ));
  //       }
  //     } else {
  //       log("", name: "SubmitLogInEvent error");
  //       emit(state.copyWith(
  //         stateHelper: const StateHelper(
  //             requestState: RequestState.ERROR,
  //             errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES),
  //       ));
  //     }
  //   }
  // }
}
