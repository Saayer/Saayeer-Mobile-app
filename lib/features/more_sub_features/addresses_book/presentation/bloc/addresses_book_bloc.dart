import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/error/failure.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/usecase/base_usecase.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/more_sub_features/addresses_book/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/addresses_book/domain/use_cases/get_addresses_usecase.dart';

part 'addresses_book_event.dart';

part 'addresses_book_state.dart';

@Injectable()
class AddressesBookBloc extends Bloc<AddressesBookEvent, AddressesBookState> {
  final GetAddressesUseCase getAddressesUseCase;

  AddressesBookBloc({required this.getAddressesUseCase})
      : super(const AddressesBookState()) {
    on<GetAddresses>(_getAddresses);
  }

  Future<FutureOr<void>> _getAddresses(
      GetAddresses event, Emitter<AddressesBookState> emit) async {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final Either<Failure, List<AddressInfoEntity>> result =
        await getAddressesUseCase(const NoParameters());

    if (result.isLeft()) {
      final Failure leftResult = (result as Left).value;
      log("left getAddresses $leftResult");
      emit(state.copyWith(
          stateHelper: state.stateHelper.copyWith(
              requestState: RequestState.ERROR,
              errorStatus: AddressesBookErrorStatus.ERROR_GET_ADDRESSES)));
    } else {
      final List<AddressInfoEntity>? rightResult = (result as Right).value;
      log("right getAddresses $rightResult");
      if (rightResult != null) {
        log("${rightResult.length}", name: "getAddresses");
        emit(state.copyWith(
            stateHelper: const StateHelper(
                requestState: RequestState.LOADED, loadingMessage: ""),
            addresses: rightResult));
      } else {
        log("", name: "getAddresses error");
        emit(state.copyWith(
          stateHelper: const StateHelper(
              requestState: RequestState.ERROR,
              errorStatus: AddressesBookErrorStatus.ERROR_GET_ADDRESSES),
        ));
      }
    }
  }
}
