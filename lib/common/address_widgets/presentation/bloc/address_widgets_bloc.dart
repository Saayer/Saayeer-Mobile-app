import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_cities_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_countries_usecase.dart';
import 'package:saayer/features/address/add_edit_address/domain/use_cases/get_governorate_usecase.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'address_widgets_event.dart';

part 'address_widgets_state.dart';

@Injectable()
class AddressWidgetsBloc extends Bloc<AddressWidgetsEvent, AddressWidgetsState> {
  final GetCitiesUseCase getCitiesUseCase;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernoratesUseCase getGovernoratesUseCase;

  AddressWidgetsBloc(
      {required this.getCitiesUseCase, required this.getCountriesUseCase, required this.getGovernoratesUseCase})
      : super(const AddressWidgetsState()) {}

  final List<AddressLookUpDto> cityEntityList = [];
  final List<AddressLookUpDto> countriesList = [];
  final List<AddressLookUpDto> governoratesList = [];
}
