import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/user_card/core/utils/enums/enums.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';
import 'package:saayer/features/user_card/domain/use_cases/user_card_usecase.dart';

part 'user_card_event.dart';

part 'user_card_state.dart';

@Injectable()
class UserCardBloc extends Bloc<UserCardEvent, UserCardState> {
  final UserCardUseCase userCardUseCase;

  UserCardBloc({required this.userCardUseCase}) : super(const UserCardState()) {
    on<InitUserCard>(_initUserCard);
  }

  Future<FutureOr<void>> _initUserCard(
      InitUserCard event, Emitter<UserCardState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final UserCardEntity? userCardEntity =
        await SecureStorageService().getUserCardInfo();
    if (userCardEntity != null) {
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED),
          userCardEntity: userCardEntity));
    } else {
      await _getProfileStatus(emit);
    }
  }

  _getProfileStatus(Emitter<UserCardState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final Either<Failure, UserCardEntity?> result =
        await userCardUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getProfileStatus $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: UserCardErrorStatus.ERROR_USER_CARD)));
    } else {
      final UserCardEntity? rightResult = (result as Right).value;
      log("right getProfileStatus $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          log("right getProfileStatus success $rightResult");
          await SecureStorageService().setUserCardInfo(rightResult);
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
            userCardEntity: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: UserCardErrorStatus.ERROR_USER_CARD),
            userCardEntity: rightResult,
          ));
        }
      } else {
        log("", name: "getProfileStatus error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: UserCardErrorStatus.ERROR_USER_CARD),
        ));
      }
    }
  }
}
