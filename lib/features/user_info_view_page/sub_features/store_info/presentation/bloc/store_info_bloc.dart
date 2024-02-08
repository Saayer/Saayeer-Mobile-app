import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/entities/submit_store_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/domain/use_cases/submit_store_info_usecase.dart';

part 'store_info_event.dart';

part 'store_info_state.dart';

@Injectable()
class StoreInfoBloc extends Bloc<StoreInfoEvent, StoreInfoState> {
  final SubmitStoreInfoUseCase submitStoreInfoUseCase;

  StoreInfoBloc({required this.submitStoreInfoUseCase})
      : super(const StoreInfoState()) {
    on<OnTextChange>(_onTextChange);
    on<SubmitStoreInfoData>(_submitStoreInfoData);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitStoreInfo>(_submitStoreInfo);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController maroofIdController = TextEditingController();
  final TextEditingController commercialRegistrationNoController =
      TextEditingController();
  Map<StoreInfoFieldsTypes, bool> storeInfoFieldsValidMap = {};

  FutureOr<void> _onTextChange(
      OnTextChange event, Emitter<StoreInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    event.textEditingController!.text = event.str ?? "";
    TextSelection previousSelection = event.textEditingController!.selection;
    event.textEditingController!.selection = previousSelection;
    log("onTextChange ${event.str}", name: "onTextChange");
    storeInfoFieldsValidMap[event.storeInfoFieldsType] =
        (event.str?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  Future<FutureOr<void>> _submitStoreInfoData(
      SubmitStoreInfoData event, Emitter<StoreInfoState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        storeInfoEntity: StoreInfoEntity(
          name: nameController.text,
          url: urlController.text,
          maroofId: maroofIdController.text,
          commercialRegistrationNo: commercialRegistrationNoController.text,
        )));
    await _submitStoreInfo(SubmitStoreInfo(), emit);
  }

  FutureOr<void> _toggleAutoValidate(
      ToggleAutoValidate event, Emitter<StoreInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitStoreInfo(
      SubmitStoreInfo event, Emitter<StoreInfoState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, SubmitStoreInfoEntity?> result =
        await submitStoreInfoUseCase(
            StoreInfoParameters(storeInfoEntity: state.storeInfoEntity!));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitPersonalInfoData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO)));
    } else {
      final SubmitStoreInfoEntity? rightResult = (result as Right).value;
      log("right submitPersonalInfoData $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
            submitStoreInfoEntity: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO),
            submitStoreInfoEntity: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO),
        ));
      }
    }
  }
}
