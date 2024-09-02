import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more/core/enums/enums.dart';
import 'package:saayer/features/more/domain/use_cases/delete_account_usecase.dart';

part 'more_event.dart';

part 'more_state.dart';

@Injectable()
class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final DeleteAccountUseCase deleteAccountUseCase;

  MoreBloc({required this.deleteAccountUseCase}) : super(const MoreState()) {
    on<RefreshEvent>(_refreshEvent);
    on<LogOutEvent>(_logOutEvent);
    on<OnDeleteAccount>(_onDeleteAccount);
  }

  Future<FutureOr<void>> _refreshEvent(RefreshEvent event, Emitter<MoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED), isRefreshed: true));
  }

  Future<FutureOr<void>> _logOutEvent(LogOutEvent event, Emitter<MoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    getIt<LoggedInCheckerService>().logOut();

    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED), isLoggedOut: true));
  }

  FutureOr<void> _onDeleteAccount(OnDeleteAccount event, Emitter<MoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final Either<Failure, void> result = await deleteAccountUseCase(const NoParameters());

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: MoreErrorStatus.ERROR_DELETE_ACCOUNT)));
    } else {
      ///
      SaayerToast().showSuccessToast(msg: "account_deleted_successfully".tr());

      ///
      add(LogOutEvent());

      ///
      //emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: "")));
    }
  }
}
