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
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/entities/submit_personal_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/domain/use_cases/submit_personal_info_usecase.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

@Injectable()
class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final SubmitPersonalInfoUseCase submitPersonalInfoUseCase;

  PersonalInfoBloc({required this.submitPersonalInfoUseCase})
      : super(const PersonalInfoState()) {
    on<OnTextChange>(_onTextChange);
    on<SubmitPersonalInfoData>(_submitPersonalInfoData);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitPersonalInfo>(_submitPersonalInfo);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIDController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  Map<PersonalInfoFieldsTypes, bool> personalInfoFieldsValidMap = {};

  FutureOr<void> _onTextChange(
      OnTextChange event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    event.textEditingController!.text = event.str ?? "";
    TextSelection previousSelection = event.textEditingController!.selection;
    event.textEditingController!.selection = previousSelection;
    log("onTextChange ${event.str}", name: "onTextChange");
    personalInfoFieldsValidMap[event.personalInfoFieldsType] =
        (event.str?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _submitPersonalInfoData(
      SubmitPersonalInfoData event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        personalInfoEntity: PersonalInfoEntity(
            name: nameController.text,
            email: emailController.text,
            nationalId: nationalIDController.text,
            address: addressController.text,
            district: districtController.text,
            governorate: governorateController.text)));
  }

  FutureOr<void> _toggleAutoValidate(
      ToggleAutoValidate event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitPersonalInfo(
      SubmitPersonalInfo event, Emitter<PersonalInfoState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final result = await submitPersonalInfoUseCase(
        PersonalInfoParameters(personalInfoEntity: state.personalInfoEntity!));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitPersonalInfoData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: PersonalInfoErrorStatus.ERROR_PERSONAL_INFO)));
    } else {
      final SubmitPersonalInfoEntity? rightResult = (result as Right).value;
      log("right submitPersonalInfoData $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
            submitPersonalInfoEntity: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: PersonalInfoErrorStatus.ERROR_PERSONAL_INFO),
            submitPersonalInfoEntity: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: PersonalInfoErrorStatus.ERROR_PERSONAL_INFO),
        ));
      }
    }
  }
}
