import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/entities/submit_business_info_entity.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/domain/use_cases/submit_business_info_usecase.dart';

part 'business_info_event.dart';

part 'business_info_state.dart';

@Injectable()
class BusinessInfoBloc extends Bloc<BusinessInfoEvent, BusinessInfoState> {
  final SubmitBusinessInfoUseCase submitBusinessInfoUseCase;

  BusinessInfoBloc({required this.submitBusinessInfoUseCase})
      : super(const BusinessInfoState()) {
    on<OnTextChange>(_onTextChange);
    on<SubmitBusinessInfoData>(_submitBusinessInfoData);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitBusinessInfo>(_submitBusinessInfo);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController commercialRegistrationNoController =
      TextEditingController();
  final TextEditingController shortAddressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  Map<BusinessInfoFieldsTypes, bool> businessInfoFieldsValidMap = {};

  FutureOr<void> _onTextChange(
      OnTextChange event, Emitter<BusinessInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final bool isPhone =
        (event.businessInfoFieldsType == BusinessInfoFieldsTypes.MOBILE_NUMBER);
    if (!isPhone) {
      event.textEditingController!.text = event.str ?? "";
      TextSelection previousSelection = event.textEditingController!.selection;
      event.textEditingController!.selection = previousSelection;
    }
    log("onTextChange ${event.str}", name: "onTextChange");
    businessInfoFieldsValidMap[event.businessInfoFieldsType] = !isPhone
        ? (event.str?.isNotEmpty ?? false)
        : (event.phoneNumber?.phoneNumber?.isNotEmpty ?? false);
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        businessInfoEntity: isPhone
            ? (state.businessInfoEntity
                    ?.copyWith(mobileNumber: event.phoneNumber?.phoneNumber) ??
                BusinessInfoEntity(
                    mobileNumber: event.phoneNumber?.phoneNumber ?? ""))
            : state.businessInfoEntity));
  }

  Future<FutureOr<void>> _submitBusinessInfoData(
      SubmitBusinessInfoData event, Emitter<BusinessInfoState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        businessInfoEntity: BusinessInfoEntity(
            companyName: companyNameController.text,
            email: emailController.text,
            mobileNumber: mobileNumberController.text,
            commercialRegistrationNo: commercialRegistrationNoController.text,
            shortAddress: shortAddressController.text,
            district: districtController.text,
            governorate: governorateController.text)));
    await _submitBusinessInfo(SubmitBusinessInfo(), emit);
  }

  FutureOr<void> _toggleAutoValidate(
      ToggleAutoValidate event, Emitter<BusinessInfoState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitBusinessInfo(
      SubmitBusinessInfo event, Emitter<BusinessInfoState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final result = await submitBusinessInfoUseCase(
        BusinessInfoParameters(businessInfoEntity: state.businessInfoEntity!));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitBusinessInfoData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: BusinessInfoErrorStatus.ERROR_BUSINESS_INFO)));
    } else {
      final SubmitBusinessInfoEntity? rightResult = (result as Right).value;
      log("right submitBusinessInfoData $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
            submitBusinessInfoEntity: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: BusinessInfoErrorStatus.ERROR_BUSINESS_INFO),
            submitBusinessInfoEntity: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitBusinessInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: BusinessInfoErrorStatus.ERROR_BUSINESS_INFO),
        ));
      }
    }
  }
}
