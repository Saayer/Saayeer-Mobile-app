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
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_cities_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_countries_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_governorate_usecase.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/submit_address_info_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/update_address_usecase.dart';
import 'package:saayer/features/address/add_edit_address/presentation/helper/init_address_helper.dart';

part 'add_edit_address_event.dart';

part 'add_edit_address_state.dart';

@Injectable()
class AddEditAddressBloc extends Bloc<AddEditAddressEvent, AddEditAddressState> {
  final SubmitAddressInfoUseCase submitAddressInfoUseCase;
  late final InitAddressHelper initAddressHelper;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernoratesUseCase getGovernoratesUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final UpdateAddressUseCase updateAddressUseCase;

  AddEditAddressBloc({
    required this.submitAddressInfoUseCase,
    required this.getCountriesUseCase,
    required this.getGovernoratesUseCase,
    required this.getCitiesUseCase,
    required this.updateAddressUseCase,
  }) : super(const AddEditAddressState()) {
    initAddressHelper = InitAddressHelper(state: state);
    on<InitAddAddress>(_initAddAddress);
    on<OnTextChange>(_onTextChange);
    on<OnItemSelectedFromDropDown>(_onItemSelectedFromDropDown);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitAddressData>(_submitAddressData);
    on<GetCountries>(_getCountries);
    on<GetGovernorates>(_getGovernorates);
    on<GetCities>(_getCities);
    on<SetUpdateValues>(_setUpdateValues);
    on<OnUpdateAddress>(_onUpdateAddress);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController alternativeMobileController = TextEditingController();
  PhoneNumber mobile = PhoneNumber(isoCode: 'SA', dialCode: '+966');
  PhoneNumber alternativeMobile = PhoneNumber(isoCode: 'SA', dialCode: '+966');
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  AddressLookUpDto? selectedCountry;
  AddressLookUpDto? selectedGovernorate;
  CityGetDto? selectedCity;
  final Map<AddAddressFieldsTypes, bool> addAddressFieldsValidMap = {};
  final List<AddressLookUpDto> countriesList = [];
  final List<AddressLookUpDto> governoratesList = [];
  List<CityGetDto> citiesList = [];

  Future<FutureOr<void>> _initAddAddress(InitAddAddress event, Emitter<AddEditAddressState> emit) async {
    emit(
      state.copyWith(isAddShipmentRequest: event.isAddShipmentRequest, addEditAddressType: event.addEditAddressType),
    );
    initAddressHelper.updateState(state);
    log("${citiesList.length}", name: "initAddAddress");
  }

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final bool isPhone = (event.addAddressFieldsType == AddAddressFieldsTypes.MOBILE);
    final bool isAlternativePhone = (event.addAddressFieldsType == AddAddressFieldsTypes.ALTERNATIVE_MOBILE);
    if (!isPhone) {
      // event.textEditingController!.text = event.str ?? "";
      // TextSelection previousSelection = event.textEditingController!.selection;
      // event.textEditingController!.selection = previousSelection;
    } else {
      mobile = event.phoneNumber!;
    }
    if (isAlternativePhone) {
      alternativeMobile = event.alternativePhoneNumber!;
    }
    log("onTextChange ${event.str}", name: "onTextChange");
    addAddressFieldsValidMap[event.addAddressFieldsType] =
        !isPhone ? (event.str?.isNotEmpty ?? false) : (event.phoneNumber?.phoneNumber?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _onItemSelectedFromDropDown(OnItemSelectedFromDropDown event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    addAddressFieldsValidMap[event.addAddressFieldsType] = true;
    if (event.addAddressFieldsType == AddAddressFieldsTypes.COUNTRY) {
      selectedCountry = event.item;
      emit(state.copyWith(countryId: event.item.id));
      selectedGovernorate = null;
      selectedCity = null;
      governoratesList.clear();
      citiesList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.GOVERNORATE) {
      selectedGovernorate = event.item;
      emit(state.copyWith(governorateId: event.item.id));
      selectedCity = null;
      citiesList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.CITY) {
      selectedCity = event.item;
      emit(state.copyWith(cityId: event.item.id));
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _toggleAutoValidate(ToggleAutoValidate event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitAddressData(SubmitAddressData event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        addressInfoEntity: CustomerAddDto((b) => b
          ..fullName = nameController.text
          ..email = emailController.text
          ..phoneNo = mobile.phoneNumber
          ..phoneNo2 = alternativeMobile.phoneNumber
          ..countryId = selectedCountry!.id
          ..cityId = selectedCity!.id
          ..governorateId = selectedGovernorate!.id
          ..areaId = 1
          ..addressDetails = addressController.text
          ..zipcode = zipCodeController.text)));
    await _uploadAddressData(emit);
  }

  Future<void> _uploadAddressData(Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, CustomerGetDto?> result = await submitAddressInfoUseCase(state.addressInfoEntity!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitPersonalInfoData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO)));
    } else {
      final CustomerGetDto? rightResult = (result as Right).value;
      log("right submitPersonalInfoData $rightResult");
      if (rightResult != null) {
        ///
        SaayerToast().showSuccessToast(msg: "address_added_successfully".tr());

        ///
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
          submitAddressInfoEntity: rightResult,
        ));
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_ADD_ADDRESS_INFO),
        ));
      }
    }
  }

  Future<FutureOr<void>> _getCountries(GetCountries event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressLookUpDto>> result = await getCountriesUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getCountries $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_COUNTRIES)));
    } else {
      final List<AddressLookUpDto>? rightResult = (result as Right).value;
      log("right getCountries $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          final bool isEnglish = Localization.isEnglish();
          countriesList.addAll(rightResult);
          countriesList.sort((a, b) => (isEnglish ? a.nameEn : a.nameAr)!
              .toLowerCase()
              .compareTo((isEnglish ? b.nameEn : b.nameAr)!.toLowerCase()));

          ///
          selectedCountry = countriesList.first;
          emit(state.copyWith(countryId: selectedCountry?.id));

          ///
          add(const GetGovernorates());
          log("${rightResult.length}", name: "getCountries");
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_COUNTRIES),
          ));
        }
      } else {
        log("", name: "getCountries error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_COUNTRIES),
        ));
      }
    }
  }

  FutureOr<void> _getGovernorates(GetGovernorates event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final int? countryId;
    if (state.addEditAddressType == AddEditAddressType.addAddress) {
      countryId = state.countryId;
    } else {
      countryId = selectedCountry?.id;
    }
    final Either<Failure, List<AddressLookUpDto>> result = await getGovernoratesUseCase(countryId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left Governorates $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_GOVERNORATES)));
    } else {
      final List<AddressLookUpDto>? rightResult = (result as Right).value;
      log("right Governorates $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          final bool isEnglish = Localization.isEnglish();
          governoratesList.addAll(rightResult);
          governoratesList.sort((a, b) => (isEnglish ? a.nameEn : a.nameAr)!
              .toLowerCase()
              .compareTo((isEnglish ? b.nameEn : b.nameAr)!.toLowerCase()));
          log("${rightResult.length}", name: "Governorates");
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_GOVERNORATES),
          ));
        }
      } else {
        log("", name: "getGovernorates error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_GOVERNORATES),
        ));
      }
    }
  }

  Future<FutureOr<void>> _getCities(GetCities event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final int? governorateId;
    if (state.addEditAddressType == AddEditAddressType.addAddress) {
      governorateId = state.governorateId;
    } else {
      governorateId = selectedGovernorate?.id;
    }
    final Either<Failure, List<CityGetDto>> result = await getCitiesUseCase(governorateId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getCities $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES)));
    } else {
      final List<CityGetDto>? rightResult = (result as Right).value;
      log("right getCities $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          final bool isEnglish = Localization.isEnglish();
          citiesList.addAll(rightResult);
          citiesList.sort((a, b) => (isEnglish ? a.nameEn : a.nameAr)!
              .toLowerCase()
              .compareTo((isEnglish ? b.nameEn : b.nameAr)!.toLowerCase()));
          log("${rightResult.length}", name: "getCities");
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES),
          ));
        }
      } else {
        log("", name: "GetCities error");
        emit(state.copyWith(
          stateHelper:
              const StateHelper(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES),
        ));
      }
    }
  }

  Future<FutureOr<void>> _setUpdateValues(SetUpdateValues event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        customerId: event.customerModel.customerId));
    nameController.text = event.customerModel.fullName ?? '';
    emailController.text = event.customerModel.email ?? '';
    addressController.text = event.customerModel.addressDetails ?? '';
    zipCodeController.text = event.customerModel.zipcode ?? '';
    mobileController.text = (event.customerModel.phoneNo ?? '').replaceAll('+966', '');
    alternativeMobileController.text = (event.customerModel.phoneNo2 ?? '').replaceAll('+966', '');
    mobile = PhoneNumber(
        isoCode: 'SA', dialCode: '+966', phoneNumber: (event.customerModel.phoneNo ?? '').replaceAll('+966', ''));
    alternativeMobile = PhoneNumber(
        isoCode: 'SA', dialCode: '+966', phoneNumber: (event.customerModel.phoneNo2 ?? '').replaceAll('+966', ''));
    selectedCountry = AddressLookUpDto((b) => b
      ..id = event.customerModel.countryId
      ..nameEn = event.customerModel.countryNameEn
      ..nameAr = event.customerModel.countryNameAr);
    selectedGovernorate = AddressLookUpDto((b) => b
      ..id = event.customerModel.governorateId
      ..nameEn = event.customerModel.governorateNameEn
      ..nameAr = event.customerModel.governorateNameAr);
    selectedCity = CityGetDto((b) => b
      ..id = event.customerModel.cityId
      ..nameEn = event.customerModel.cityNameEn
      ..nameAr = event.customerModel.cityNameAr);

    add(const GetCities());
  }

  Future<FutureOr<void>> _onUpdateAddress(OnUpdateAddress event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        addressInfoEntity: CustomerAddDto((b) => b
          ..fullName = nameController.text
          ..customerId = state.customerId
          ..email = emailController.text
          ..phoneNo = (mobile.phoneNumber == null || mobile.phoneNumber == '+966')
              ? null
              : "+966${mobile.phoneNumber!.replaceAll('+966', '')}"
          ..phoneNo2 = (alternativeMobile.phoneNumber == null || alternativeMobile.phoneNumber == '+966')
              ? null
              : "+966${alternativeMobile.phoneNumber!.replaceAll('+966', '')}"
          ..countryId = selectedCountry!.id
          ..cityId = selectedCity!.id
          ..governorateId = selectedGovernorate!.id
          ..areaId = 1
          ..addressDetails = addressController.text
          ..zipcode = zipCodeController.text)));

    ///
    final Either<Failure, void> result = await updateAddressUseCase(state.addressInfoEntity!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left UpdateAddress $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_UPDATE_ADDRESS)));
    } else {
      final rightResult = (result as Right).value;
      log("right UpdateAddress $rightResult");

      ///
      SaayerToast().showSuccessToast(msg: "address_updated_successfully".tr());

      ///
      emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: "")));
    }
  }
}
