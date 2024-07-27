import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/address_widgets/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/domain/use_cases/get_areas_usecase.dart';
import 'package:saayer/features/address/add_address/domain/use_cases/get_cities_usecase.dart';
import 'package:saayer/features/address/add_address/domain/use_cases/get_countries_usecase.dart';
import 'package:saayer/features/address/add_address/domain/use_cases/get_governorate_usecase.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/domain/use_cases/submit_address_info_usecase.dart';
import 'package:saayer/features/address/add_address/presentation/helper/init_address_helper.dart';

part 'add_address_event.dart';

part 'add_address_state.dart';

@Injectable()
class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final SubmitAddressInfoUseCase submitAddressInfoUseCase;
  late final InitAddressHelper initAddressHelper;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernoratesUseCase getGovernoratesUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final GetAreasUseCase getAreasUseCase;

  AddAddressBloc(
      {required this.submitAddressInfoUseCase,
      required this.getCountriesUseCase,
      required this.getGovernoratesUseCase,
      required this.getCitiesUseCase,
      required this.getAreasUseCase})
      : super(const AddAddressState()) {
    initAddressHelper = InitAddressHelper(state: state);
    on<InitAddAddress>(_initAddAddress);
    on<OnTextChange>(_onTextChange);
    on<OnItemSelectedFromDropDown>(_onItemSelectedFromDropDown);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<SubmitAddressData>(_submitAddressData);
    on<GetCountries>(_getCountries);
    on<GetGovernorates>(_getGovernorates);
    on<GetCities>(_getCities);
    on<GetAreas>(_getAreas);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String mobile = "";
  String alternativeMobile = "";
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  AddressLookUpDto? selectedCountry;
  AddressLookUpDto? selectedGovernorate;
  AddressLookUpDto? selectedCity;
  AddressLookUpDto? selectedArea;
  final Map<AddAddressFieldsTypes, bool> addAddressFieldsValidMap = {};
  final List<AddressLookUpDto> countriesList = [];
  final List<AddressLookUpDto> governoratesList = [];
  List<AddressLookUpDto> citiesList = [];
  final List<AddressLookUpDto> areasList = [];

  Future<FutureOr<void>> _initAddAddress(InitAddAddress event, Emitter<AddAddressState> emit) async {
    emit(
      state.copyWith(isAddShipmentRequest: event.isAddShipmentRequest),
    );
    initAddressHelper.updateState(state);
    log("${citiesList.length}", name: "initAddAddress");
  }

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<AddAddressState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final bool isPhone = (event.addAddressFieldsType == AddAddressFieldsTypes.MOBILE);
    final bool isAlternativePhone = (event.addAddressFieldsType == AddAddressFieldsTypes.ALTERNATIVE_MOBILE);
    if (!isPhone) {
      event.textEditingController!.text = event.str ?? "";
      TextSelection previousSelection = event.textEditingController!.selection;
      event.textEditingController!.selection = previousSelection;
    } else {
      mobile = event.phoneNumber?.phoneNumber ?? "";
    }
    if (isAlternativePhone) {
      alternativeMobile = event.alternativePhoneNumber?.phoneNumber ?? "";
    }
    log("onTextChange ${event.str}", name: "onTextChange");
    addAddressFieldsValidMap[event.addAddressFieldsType] =
        !isPhone ? (event.str?.isNotEmpty ?? false) : (event.phoneNumber?.phoneNumber?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _onItemSelectedFromDropDown(OnItemSelectedFromDropDown event, Emitter<AddAddressState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    addAddressFieldsValidMap[event.addAddressFieldsType] = true;
    if (event.addAddressFieldsType == AddAddressFieldsTypes.COUNTRY) {
      selectedCountry = event.item;
      emit(state.copyWith(countryId: event.item.id));
      selectedGovernorate = null;
      selectedCity = null;
      selectedArea = null;
      governoratesList.clear();
      citiesList.clear();
      areasList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.GOVERNORATE) {
      selectedGovernorate = event.item;
      emit(state.copyWith(governorateId: event.item.id));
      selectedCity = null;
      selectedArea = null;
      citiesList.clear();
      areasList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.CITY) {
      selectedCity = event.item;
      emit(state.copyWith(cityId: event.item.id));
      selectedArea = null;
      areasList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.AREA) {
      selectedArea = event.item;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _toggleAutoValidate(ToggleAutoValidate event, Emitter<AddAddressState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), autoValidateMode: AutovalidateMode.always));
  }

  Future<FutureOr<void>> _submitAddressData(SubmitAddressData event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        addressInfoEntity: CustomerAddDto((b) => b
          ..fullName = nameController.text
          ..email = emailController.text
          ..phoneNo = mobile
          ..phoneNo2 = alternativeMobile
          ..countryId = selectedCountry!.id
          ..cityId = selectedCity!.id
          ..governorateId = selectedGovernorate!.id
          ..areaId = selectedArea!.id
          ..addressDetails = addressController.text
          ..zipcode = zipCodeController.text)));
    await _uploadAddressData(emit);
  }

  Future<void> _uploadAddressData(Emitter<AddAddressState> emit) async {
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

  Future<FutureOr<void>> _getCountries(GetCountries event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressLookUpDto>> result = await getCountriesUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getCountries $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES)));
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
          log("${rightResult.length}", name: "getCountries");
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_COUNTRIES),
          ));
        }
      } else {
        log("", name: "getCountries error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_COUNTRIES),
        ));
      }
    }
  }

  FutureOr<void> _getGovernorates(GetGovernorates event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressLookUpDto>> result = await getGovernoratesUseCase(state.countryId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left Governorates $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_GOVERNORATES)));
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
                requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_GOVERNORATES),
          ));
        }
      } else {
        log("", name: "getGovernorates error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_GOVERNORATES),
        ));
      }
    }
  }

  Future<FutureOr<void>> _getCities(GetCities event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressLookUpDto>> result = await getCitiesUseCase(state.governorateId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getCities $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES)));
    } else {
      final List<AddressLookUpDto>? rightResult = (result as Right).value;
      log("right getCities $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          final bool isEnglish = Localization.isEnglish();
          citiesList.addAll(rightResult);
          citiesList.sort((a, b) => (isEnglish ? a.nameEn : a.nameAr)!
              .toLowerCase()
              .compareTo((isEnglish ? b.nameEn : b.nameAr)!.toLowerCase()));
          //cityEntityList = List.from(cityEntityList.reversed);
          log("${rightResult.length}", name: "getCities");
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES),
          ));
        }
      } else {
        log("", name: "GetCities error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_CITIES),
        ));
      }
    }
  }

  FutureOr<void> _getAreas(GetAreas event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressLookUpDto>> result = await getAreasUseCase(state.cityId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left Areas $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_AREAS)));
    } else {
      final List<AddressLookUpDto>? rightResult = (result as Right).value;
      log("right Areas $rightResult");
      if (rightResult != null) {
        if (rightResult.isNotEmpty) {
          final bool isEnglish = Localization.isEnglish();
          areasList.addAll(rightResult);
          areasList.sort((a, b) => (isEnglish ? a.nameEn : a.nameAr)!
              .toLowerCase()
              .compareTo((isEnglish ? b.nameEn : b.nameAr)!.toLowerCase()));
          log("${rightResult.length}", name: "Areas");
          emit(state.copyWith(
            stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          ));
        } else {
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_AREAS),
          ));
        }
      } else {
        log("", name: "getAreas error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_AREAS),
        ));
      }
    }
  }
}
