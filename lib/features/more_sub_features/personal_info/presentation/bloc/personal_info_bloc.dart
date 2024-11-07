import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/use_cases/edit_personal_info_usecase.dart';
import 'package:saayer/features/more_sub_features/personal_info/domain/use_cases/get_personal_info_usecase.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

@Injectable()
class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final EditPersonalInfoUseCase submitPersonalInfoUseCase;
  final GetPersonalInfoUseCase getPersonalInfoUseCase;

  PersonalInfoBloc({required this.submitPersonalInfoUseCase, required this.getPersonalInfoUseCase})
      : super(const PersonalInfoState()) {
    on<GetClientInfo>(_getClientInfo);
    on<OnTextChange>(_onTextChange);
    on<EditClientData>(_editClientData);
    on<ToggleAutoValidate>(_toggleAutoValidate);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  PhoneNumber mobile = PhoneNumber(isoCode: 'SA', dialCode: '+966');
  Map<PersonalInfoFieldsTypes, bool> personalInfoFieldsValidMap = {};

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final bool isPhone = (event.personalInfoFieldsType == PersonalInfoFieldsTypes.PHONE);
    if (isPhone) {
      mobile = event.phoneNumber!;
    }
    personalInfoFieldsValidMap[event.personalInfoFieldsType] = (event.str?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  Future<FutureOr<void>> _editClientData(EditClientData event, Emitter<PersonalInfoState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        clientEditRequest: ClientAddDto((b) => b
          ..fullName = nameController.text
          ..phoneNo = mobile.phoneNumber
          ..email = emailController.text
          ..businessName = businessNameController.text)));
    await _submitPersonalInfo(SubmitPersonalInfo(), emit);
  }

  Future<FutureOr<void>> _submitPersonalInfo(SubmitPersonalInfo event, Emitter<PersonalInfoState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, void> result = await submitPersonalInfoUseCase(state.clientEditRequest!);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: PersonalInfoErrorStatus.ERROR_PERSONAL_INFO)));
    } else {
      ///
      SaayerToast().showSuccessToast(msg: "profile_updated_successfully".tr());

      ///
      emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: "")));
    }
  }

  Future<FutureOr<void>> _getClientInfo(GetClientInfo event, Emitter<PersonalInfoState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final Either<Failure, void> result = await getPersonalInfoUseCase(const NoParameters());

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: PersonalInfoErrorStatus.ERROR_PERSONAL_INFO)));
    } else {
      final ClientGetDto? rightResult = (result as Right).value;
      if (rightResult != null) {
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
          clientGetDto: rightResult,
        ));

        ///
        _setValues();

        ///
        emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: "")));
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: PersonalInfoErrorStatus.ERROR_PERSONAL_INFO),
        ));
      }
    }
  }

  FutureOr<void> _toggleAutoValidate(ToggleAutoValidate event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), autoValidateMode: AutovalidateMode.always));
  }

  void _setValues() {
    nameController.text = state.clientGetDto!.fullName ?? '';
    emailController.text = state.clientGetDto!.email ?? '';
    businessNameController.text = state.clientGetDto!.businessName ?? '';
    phoneController.text = (state.clientGetDto!.phoneNo ?? '').replaceAll('+966', '');
    mobile = PhoneNumber(
        isoCode: 'SA', dialCode: '+966', phoneNumber: (state.clientGetDto!.phoneNo ?? '').replaceAll('+966', ''));
  }
}
