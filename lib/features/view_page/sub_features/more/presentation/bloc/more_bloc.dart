import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'more_event.dart';

part 'more_state.dart';

@Injectable()
class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(const MoreState()) {
    on<RefreshEvent>(_refreshEvent);
  }

  Future<FutureOr<void>> _refreshEvent(RefreshEvent event, Emitter<MoreState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED)));
  }
}
