import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/domain/usecases/get_saayer_gain_usecase.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/domain/usecases/update_saayer_gain_usecase.dart';

part 'saayer_gain_event.dart';

part 'saayer_gain_state.dart';

@Injectable()
class SaayerGainBloc extends Bloc<SaayerGainEvent, SaayerGainState> {
  final GetSaayerGainUseCase getSaayerGainUseCase;
  final UpdateSaayerGainUseCase updateSaayerGainUseCase;

  SaayerGainBloc({required this.getSaayerGainUseCase, required this.updateSaayerGainUseCase})
      : super(const SaayerGainState()) {
    on<GetSaayerGain>(_getSaayerGain);
    on<UpdateSaayerGain>(_updateSaayerGain);
    on<OnChangeSaayerGainPercentage>(_onChangeSaayerGainPercentage);
  }

  ///
  final formKey = GlobalKey<FormState>();
  int saayerGainPercentage = 0;
  final TextEditingController saayerGainController = TextEditingController();

  FutureOr<void> _getSaayerGain(GetSaayerGain event, Emitter<SaayerGainState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await getSaayerGainUseCase(const NoParameters()).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: SaayerGainErrorStatus.ERROR_GET_SAAYER_GAIN)));
      } else {
        final num? rightResult = (result as Right).value;

        if (rightResult != null) {
          emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: "")));

          saayerGainPercentage = (rightResult * 100).round();
          saayerGainController.text = saayerGainPercentage.toString();
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
            saayerGainPercentage: saayerGainPercentage,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: SaayerGainErrorStatus.ERROR_GET_SAAYER_GAIN),
          ));
        }
      }
    });
  }

  FutureOr<void> _updateSaayerGain(UpdateSaayerGain event, Emitter<SaayerGainState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await updateSaayerGainUseCase(event.gainRatioPost).then((result) {
      if (result.isLeft()) {
        emit(state.copyWith(
            stateHelper: state.stateHelper
                .copyWith(requestState: RequestState.ERROR, errorStatus: SaayerGainErrorStatus.ERROR_GET_SAAYER_GAIN)));
      } else {
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
        ));
      }
    });
  }

  FutureOr<void> _onChangeSaayerGainPercentage(
      OnChangeSaayerGainPercentage event, Emitter<SaayerGainState> emit) {
    saayerGainPercentage = event.saayerGain;
    saayerGainController.text = saayerGainPercentage.toString();
  }
}
