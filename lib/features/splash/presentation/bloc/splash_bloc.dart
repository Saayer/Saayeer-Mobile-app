import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/splash/domain/entities/splash_user_entity.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<GetUserStatus>(_getUserStatus);
  }

  FutureOr<void> _getUserStatus(
      GetUserStatus event, Emitter<SplashState> emit) {
   emit(state.copyWith(requestState: RequestState.LOADED));
  }
}
