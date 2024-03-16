import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/profile_sub_features/info/core/utils/enums/enums.dart';
import 'package:saayer/features/profile_sub_features/info/domain/entities/info_entity.dart';

part 'info_event.dart';

part 'info_state.dart';

@Injectable()
class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(const InfoState()) {
    on<InitInfo>(_initInfo);
  }

  FutureOr<void> _initInfo(InitInfo event, Emitter<InfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        infoEntity: event.infoEntity));
  }
}
