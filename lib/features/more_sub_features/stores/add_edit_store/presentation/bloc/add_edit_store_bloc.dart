import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_areas_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_cities_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_countries_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_governorate_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/domain/use_cases/edit_store_usecase.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/domain/use_cases/submit_store_info_usecase.dart';

part 'add_edit_store_event.dart';

part 'add_edit_store_state.dart';

@Injectable()
class AddEditStoreBloc extends Bloc<AddEditStoreEvent, AddEditStoreState> {
  final SubmitStoreInfoUseCase submitStoreInfoUseCase;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernoratesUseCase getGovernoratesUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final GetAreasUseCase getAreasUseCase;
  final EditStoreUseCase editStoreUseCase;

  AddEditStoreBloc({
    required this.submitStoreInfoUseCase,
    required this.getCountriesUseCase,
    required this.getGovernoratesUseCase,
    required this.getCitiesUseCase,
    required this.getAreasUseCase,
    required this.editStoreUseCase,
  }) : super(const AddEditStoreState()) {
    on<InitAddEditStore>(_initAddEditStore);
    on<OnTextChange>(_onTextChange);
    on<OnItemSelectedFromDropDown>(_onItemSelectedFromDropDown);
    on<SubmitStoreInfoData>(_submitStoreInfoData);
    on<ToggleAutoValidate>(_toggleAutoValidate);
    on<GetCountries>(_getCountries);
    on<GetGovernorates>(_getGovernorates);
    on<GetCities>(_getCities);
    on<GetAreas>(_getAreas);
    on<SetValuesInEditType>(_setValuesInEditType);
    on<OnUpdateStore>(_onUpdateStore);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController financialRecordNoController = TextEditingController();
  final TextEditingController freelanceCertificateNoController = TextEditingController();
  AddressLookUpDto? selectedCountry;
  AddressLookUpDto? selectedGovernorate;
  AddressLookUpDto? selectedCity;
  AddressLookUpDto? selectedArea;
  final List<AddressLookUpDto> countriesList = [];
  final List<AddressLookUpDto> governoratesList = [];
  List<AddressLookUpDto> citiesList = [];
  final List<AddressLookUpDto> areasList = [];
  Map<StoreInfoFieldsTypes, bool> storeInfoFieldsValidMap = {};

  Future<FutureOr<void>> _initAddEditStore(InitAddEditStore event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(addEditStoreType: event.addEditStoreType));
  }

  FutureOr<void> _onTextChange(OnTextChange event, Emitter<AddEditStoreState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    event.textEditingController!.text = event.str ?? "";
    TextSelection previousSelection = event.textEditingController!.selection;
    event.textEditingController!.selection = previousSelection;
    log("onTextChange ${event.str}", name: "onTextChange");
    storeInfoFieldsValidMap[event.storeInfoFieldsType] = (event.str?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  Future<FutureOr<void>> _submitStoreInfoData(SubmitStoreInfoData event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        storeAddDto: StoreAddDto((b) => b
          ..name = nameController.text
          ..countryId = selectedCountry!.id
          ..governorateId = selectedGovernorate!.id
          ..cityId = selectedCity!.id
          ..areaId = selectedArea!.id
          ..addressDetails = addressController.text
          ..zipcode = zipCodeController.text
          ..financialRecordNumber = financialRecordNoController.text
          ..freelanceCertificateNumber = freelanceCertificateNoController.text)));
    await _submitStoreInfo(SubmitStoreInfo(), emit);
  }

  Future<FutureOr<void>> _submitStoreInfo(SubmitStoreInfo event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, StoreGetDto?> result = await submitStoreInfoUseCase(state.storeAddDto!);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left submitPersonalInfoData $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO)));
    } else {
      final StoreGetDto? rightResult = (result as Right).value;
      log("right submitPersonalInfoData $rightResult");
      if (rightResult != null) {
        ///
        SaayerToast().showSuccessToast(msg: "store_added_successfully".tr());

        /// save last storeId added to use it in request shipment to view it in autoSelected
        if (rightResult.storeId != null) {
          getIt<SharedPrefService>().setLastStoreAddedId(rightResult.storeId!);
        }

        ///
        emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: ""),
          storeGetDto: rightResult,
        ));
      } else {
        log("", name: "SubmitPersonalInfoEvent error");
        emit(state.copyWith(
          stateHelper:
              const StateHelper(requestState: RequestState.ERROR, errorStatus: StoreInfoErrorStatus.ERROR_STORE_INFO),
        ));
      }
    }
  }

  FutureOr<void> _toggleAutoValidate(ToggleAutoValidate event, Emitter<AddEditStoreState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED), autoValidateMode: AutovalidateMode.always));
  }

  FutureOr<void> _onItemSelectedFromDropDown(
      OnItemSelectedFromDropDown<dynamic> event, Emitter<AddEditStoreState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    storeInfoFieldsValidMap[event.storeInfoFieldsType] = true;
    if (event.storeInfoFieldsType == StoreInfoFieldsTypes.COUNTRY) {
      selectedCountry = event.item;
      emit(state.copyWith(countryId: event.item.id));
      selectedGovernorate = null;
      selectedCity = null;
      selectedArea = null;
      governoratesList.clear();
      citiesList.clear();
      areasList.clear();
    } else if (event.storeInfoFieldsType == StoreInfoFieldsTypes.GOVERNORATE) {
      selectedGovernorate = event.item;
      emit(state.copyWith(governorateId: event.item.id));
      selectedCity = null;
      selectedArea = null;
      citiesList.clear();
      areasList.clear();
    } else if (event.storeInfoFieldsType == StoreInfoFieldsTypes.CITY) {
      selectedCity = event.item;
      emit(state.copyWith(cityId: event.item.id));
      selectedArea = null;
      areasList.clear();
    } else if (event.storeInfoFieldsType == StoreInfoFieldsTypes.AREA) {
      selectedArea = event.item;
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _getCountries(GetCountries event, Emitter<AddEditStoreState> emit) async {
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

  FutureOr<void> _getGovernorates(GetGovernorates event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final int? countryId;
    if (state.addEditStoreType == AddEditStoreType.addStore) {
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

  FutureOr<void> _getCities(GetCities event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final int? governorateId;
    if (state.addEditStoreType == AddEditStoreType.addStore) {
      governorateId = state.governorateId;
    } else {
      governorateId = selectedGovernorate?.id;
    }
    final Either<Failure, List<AddressLookUpDto>> result = await getCitiesUseCase(governorateId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getCities $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_CITIES)));
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

  FutureOr<void> _getAreas(GetAreas event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    final int? cityId;
    if (state.addEditStoreType == AddEditStoreType.addStore) {
      cityId = state.cityId;
    } else {
      cityId = selectedCity?.id;
    }
    final Either<Failure, List<AddressLookUpDto>> result = await getAreasUseCase(cityId);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left Areas $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_AREAS)));
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
            stateHelper:
                const StateHelper(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_AREAS),
          ));
        }
      } else {
        log("", name: "getAreas error");
        emit(state.copyWith(
          stateHelper:
              const StateHelper(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_GET_AREAS),
        ));
      }
    }
  }

  FutureOr<void> _setValuesInEditType(SetValuesInEditType event, Emitter<AddEditStoreState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING), storeId: event.storeDto.storeId));
    nameController.text = event.storeDto.name ?? '';
    addressController.text = event.storeDto.addressDetails ?? '';
    zipCodeController.text = event.storeDto.zipcode ?? '';
    freelanceCertificateNoController.text = event.storeDto.freelanceCertificateNumber ?? '';
    financialRecordNoController.text = event.storeDto.financialRecordNumber ?? '';
    selectedCountry = AddressLookUpDto((b) => b
      ..id = event.storeDto.countryId
      ..nameEn = event.storeDto.countryNameEn
      ..nameAr = event.storeDto.countryNameAr);
    selectedGovernorate = AddressLookUpDto((b) => b
      ..id = event.storeDto.governorateId
      ..nameEn = event.storeDto.governorateNameEn
      ..nameAr = event.storeDto.governorateNameAr);
    selectedCity = AddressLookUpDto((b) => b
      ..id = event.storeDto.cityId
      ..nameEn = event.storeDto.cityNameEn
      ..nameAr = event.storeDto.cityNameAr);
    selectedArea = AddressLookUpDto((b) => b
      ..id = event.storeDto.areaId
      ..nameEn = event.storeDto.areaNameEn
      ..nameAr = event.storeDto.areaNameAr);

    add(const GetCities());
    add(const GetAreas());
  }

  FutureOr<void> _onUpdateStore(OnUpdateStore event, Emitter<AddEditStoreState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        storeAddDto: StoreAddDto((b) => b
          ..name = nameController.text
          ..storeId = state.storeId
          ..countryId = selectedCountry!.id
          ..cityId = selectedCity!.id
          ..governorateId = selectedGovernorate!.id
          ..areaId = selectedArea!.id
          ..addressDetails = addressController.text
          ..zipcode = zipCodeController.text
          ..financialRecordNumber = financialRecordNoController.text
          ..freelanceCertificateNumber = freelanceCertificateNoController.text)));

    ///
    final Either<Failure, void> result = await editStoreUseCase(state.storeAddDto!);

    if (result.isLeft()) {
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddAddressErrorStatus.ERROR_UPDATE_ADDRESS)));
    } else {
      ///
      SaayerToast().showSuccessToast(msg: "store_updated_successfully".tr());

      ///
      emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.SUCCESS, loadingMessage: "")));
    }
  }
}
