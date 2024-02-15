import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'addresses_book_event.dart';

part 'addresses_book_state.dart';

@Injectable()
class AddressesBookBloc extends Bloc<AddressesBookEvent, AddressesBookState> {
  AddressesBookBloc() : super(const AddressesBookState()) {
    on<AddressesBookEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
