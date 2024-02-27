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
import 'package:saayer/features/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/add_address/domain/entities/city_entity.dart';
import 'package:saayer/features/add_address/domain/entities/submit_address_info_entity.dart';
import 'package:saayer/features/add_address/domain/use_cases/submit_address_info_usecase.dart';

part 'add_address_event.dart';

part 'add_address_state.dart';

@Injectable()
class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final SubmitAddressInfoUseCase submitAddressInfoUseCase;

  AddAddressBloc({required this.submitAddressInfoUseCase})
      : super(const AddAddressState()) {
    on<OnTextChange>(_onTextChange);
    on<OnItemSelectedFromDropDown>(_onItemSelectedFromDropDown);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitAddressData>(_submitAddressData);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  //final TextEditingController countryController = TextEditingController();
  CityEntity? selectedCityEntity;
  final Map<AddAddressFieldsTypes, bool> addAddressFieldsValidMap = {};

  FutureOr<void> _onTextChange(
      OnTextChange event, Emitter<AddAddressState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    event.textEditingController!.text = event.str ?? "";
    TextSelection previousSelection = event.textEditingController!.selection;
    event.textEditingController!.selection = previousSelection;
    log("onTextChange ${event.str}", name: "onTextChange");
    addAddressFieldsValidMap[event.addAddressFieldsType] =
        (event.str?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _onItemSelectedFromDropDown(
      OnItemSelectedFromDropDown event, Emitter<AddAddressState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    addAddressFieldsValidMap[event.addAddressFieldsType] = true;
    if (event.item is CityEntity) {
      selectedCityEntity = event.item;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _toggleAutoValidate(
      ToggleAutoValidate event, Emitter<AddAddressState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitAddressData(
      SubmitAddressData event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        addressInfoEntity: AddressInfoEntity(
            name: nameController.text,
            email: emailController.text,
            mobile: mobileController.text,
            address: addressController.text,
            district: districtController.text,
            city: selectedCityEntity!.id,
            country: "")));
    await _uploadAddressData(emit);
  }

  Future<void> _uploadAddressData(Emitter<AddAddressState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, SubmitAddressInfoEntity?> result =
        await submitAddressInfoUseCase(
            AddressInfoParameters(addressInfoEntity: state.addressInfoEntity!));

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitPersonalInfoData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO)));
    } else {
      final SubmitAddressInfoEntity? rightResult = (result as Right).value;
      log("right submitPersonalInfoData $rightResult");
      if (rightResult != null) {
        if (rightResult.isSuccess) {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.SUCCESS, loadingMessage: ""),
            submitAddressInfoEntity: rightResult,
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR,
                errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO),
            submitAddressInfoEntity: rightResult,
          ));
        }
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO),
        ));
      }
    }
  }
}
