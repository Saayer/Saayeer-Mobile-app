// ignore_for_file: no_leading_underscores_for_local_identifiers

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
import 'package:saayer/common/address_widgets/core/utils/enums/enums.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_cities_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_countries_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_governorate_usecase.dart';
import 'package:saayer/features/address/addresses_book/core/utils/enums/enums.dart';
import 'package:saayer/features/address/addresses_book/domain/use_cases/delete_address_usecase.dart';
import 'package:saayer/features/address/addresses_book/domain/use_cases/edit_address_usecase.dart';
import 'package:saayer/features/address/addresses_book/domain/use_cases/get_addresses_usecase.dart';

part 'addresses_book_event.dart';

part 'addresses_book_state.dart';

@Injectable()
class AddressesBookBloc extends Bloc<AddressesBookEvent, AddressesBookState> {
  final GetAddressesUseCase getAddressesUseCase;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernoratesUseCase getGovernoratesUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final EditAddressesUseCase editAddressesUseCase;
  final DeleteAddressesUseCase deleteAddressesUseCase;

  AddressesBookBloc({
    required this.getAddressesUseCase,
    required this.getCountriesUseCase,
    required this.getGovernoratesUseCase,
    required this.getCitiesUseCase,
    required this.editAddressesUseCase,
    required this.deleteAddressesUseCase,
  }) : super(const AddressesBookState()) {
    on<GetAddresses>(_getAddresses);
    on<GetCountries>(_getCountries);
    on<GetGovernorates>(_getGovernorates);
    on<GetCities>(_getCities);
    on<OnFilterTextChange>(_onTextChange);
    on<OnItemSelectedFromDropDown>(_onItemSelectedFromDropDown);
    on<OnAddressDelete>(_onAddressDelete);
    on<OnScrollPagination>(_onScrollPagination);
    on<ResetList>(_resetList);
  }

  ///
  final TextEditingController searchController = TextEditingController();
  final TextEditingController shipmentDateFromController = TextEditingController();
  final TextEditingController shipmentDateToController = TextEditingController();
  final TextEditingController totalShipmentsMin = TextEditingController();
  final TextEditingController totalShipmentsMax = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  ///
  late DateTime? shipmentDateFrom;
  late DateTime? shipmentDateTo;
  String mobile = "";
  AddressLookUpDto? selectedCountry;
  AddressLookUpDto? selectedGovernorate;
  AddressLookUpDto? selectedCity;

  ///pagination util
  final _pageSize = 10;

  ///
  List<CustomerGetDto> addressesList = [];
  final List<AddressLookUpDto> countriesList = [];
  final List<AddressLookUpDto> governoratesList = [];
  final List<AddressLookUpDto> citiesList = [];
  final List<AddressLookUpDto> areasList = [];
  final Map<AddAddressFieldsTypes, bool> addAddressFieldsValidMap = {};

  Future<FutureOr<void>> _getAddresses(GetAddresses event, Emitter<AddressesBookState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING),
        customerQuery: CustomerQuery((b) => b
          ..general = searchController.text.isEmpty ? null : searchController.text
          ..phone = mobile.isEmpty ? null : mobile
          ..countryId = selectedCountry?.id
          ..cityId = selectedCity?.id
          ..governorateId = selectedGovernorate?.id
          ..totalShipmentsMin = totalShipmentsMin.text.isEmpty ? null : int.parse(totalShipmentsMin.text)
          ..totalShipmentsMax = totalShipmentsMax.text.isEmpty ? null : int.parse(totalShipmentsMax.text)
          ..skip = addressesList.length
          ..take = _pageSize)));

    await getAddressesUseCase(state.customerQuery).then((result) {
      if (result.isLeft()) {
        final Failure leftResult = (result as Left).value;
        log("left getAddresses $leftResult");
        emit(state.copyWith(
            stateHelper: state.stateHelper.copyWith(
                requestState: RequestState.ERROR, errorStatus: AddressesBookErrorStatus.ERROR_GET_ADDRESSES)));
      } else {
        final List<CustomerGetDto>? rightResult = (result as Right).value;

        log("right getAddresses $rightResult");
        if (rightResult != null) {
          log("${rightResult.length}", name: "getAddresses");
          if (rightResult.length < _pageSize) {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
                hasNextPage: false));
          } else {
            emit(state.copyWith(
                stateHelper: const StateHelper(requestState: RequestState.LOADING, loadingMessage: ""),
                hasNextPage: true));
          }
          for (var item in rightResult) {
            addressesList.putIfAbsent(item);
          }
          emit(state.copyWith(
              stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
              addresses: addressesList));
        } else {
          log("", name: "getAddresses error");
          emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.ERROR, errorStatus: AddressesBookErrorStatus.ERROR_GET_ADDRESSES),
          ));
        }
      }
    });
  }

  Future<FutureOr<void>> _getCountries(GetCountries event, Emitter<AddressesBookState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressLookUpDto>> result = await getCountriesUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getCountries $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddressWidgetsErrorStatus.ERROR_GET_COUNTRIES)));
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
          // emit(state.copyWith(
          //   stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          // ));
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

  FutureOr<void> _getGovernorates(GetGovernorates event, Emitter<AddressesBookState> emit) async {
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

  Future<FutureOr<void>> _getCities(GetCities event, Emitter<AddressesBookState> emit) async {
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

  FutureOr<void> _onTextChange(OnFilterTextChange event, Emitter<AddressesBookState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final bool isPhone = (event.addAddressFieldsType == AddAddressFieldsTypes.MOBILE);
    if (!isPhone) {
      event.textEditingController!.text = event.str ?? "";
      TextSelection previousSelection = event.textEditingController!.selection;
      event.textEditingController!.selection = previousSelection;
    } else {
      mobile = event.phoneNumber?.phoneNumber == '+966' ? "" : event.phoneNumber?.phoneNumber ?? "";
    }
    log("onTextChange ${event.str}", name: "onTextChange");
    addAddressFieldsValidMap[event.addAddressFieldsType] =
        !isPhone ? (event.str?.isNotEmpty ?? false) : (event.phoneNumber?.phoneNumber?.isNotEmpty ?? false);
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  FutureOr<void> _onItemSelectedFromDropDown(OnItemSelectedFromDropDown event, Emitter<AddressesBookState> emit) {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));
    addAddressFieldsValidMap[event.addAddressFieldsType] = true;
    if (event.addAddressFieldsType == AddAddressFieldsTypes.COUNTRY) {
      selectedCountry = event.item;
      emit(state.copyWith(countryId: event.item.id));
      selectedGovernorate = null;
      selectedCity = null;
      governoratesList.clear();
      citiesList.clear();
      areasList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.GOVERNORATE) {
      selectedGovernorate = event.item;
      emit(state.copyWith(governorateId: event.item.id));
      selectedCity = null;
      citiesList.clear();
      areasList.clear();
    } else if (event.addAddressFieldsType == AddAddressFieldsTypes.CITY) {
      selectedCity = event.item;
      emit(state.copyWith(cityId: event.item.id));
      areasList.clear();
    }
    emit(state.copyWith(
      stateHelper: const StateHelper(requestState: RequestState.LOADED),
    ));
  }

  Future<FutureOr<void>> _onAddressDelete(OnAddressDelete event, Emitter<AddressesBookState> emit) async {
    emit(state.copyWith(stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, void> result = await deleteAddressesUseCase(event.deleteAddress.customerId ?? 0);

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left DeleteAddresses $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper
              .copyWith(requestState: RequestState.ERROR, errorStatus: AddressesBookErrorStatus.ERROR_DELETE_ADDRESS)));
    } else {
      final rightResult = (result as Right).value;
      log("right DeleteAddresses $rightResult");
      log("$rightResult", name: "DeleteAddresses");

      ///
      SaayerToast().showSuccessToast(msg: "address_deleted_successfully".tr());

      ///
      addressesList.removeWhere((item) => item.customerId == event.deleteAddress.customerId);
      emit(state.copyWith(
          stateHelper: const StateHelper(requestState: RequestState.LOADED, loadingMessage: ""),
          addresses: addressesList));
    }
  }

  FutureOr<void> _onScrollPagination(OnScrollPagination event, Emitter<AddressesBookState> emit) {
    if (!scrollController.hasClients) return null;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (state.hasNextPage ?? false) {
        add(const GetAddresses());
      }
    }
  }

  @override
  Future<void> close() {
    scrollController..removeListener(()=>_onScrollPagination)..dispose();
    return super.close();
  }

  FutureOr<void> _resetList(ResetList event, Emitter<AddressesBookState> emit) {
    addressesList = [];
  }
}
