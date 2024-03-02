import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';

part 'address_details_event.dart';

part 'address_details_state.dart';

@Injectable()
class AddressDetailsBloc
    extends Bloc<AddressDetailsEvent, AddressDetailsState> {
  AddressDetailsBloc() : super(const AddressDetailsState()) {
    on<InitAddressDetails>(_initAddressDetails);
  }

  FutureOr<void> _initAddressDetails(
      InitAddressDetails event, Emitter<AddressDetailsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        addressInfoEntity: event.addressInfoEntity));
  }
}
