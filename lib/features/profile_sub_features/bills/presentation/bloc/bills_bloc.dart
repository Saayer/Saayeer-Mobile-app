import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'bills_event.dart';

part 'bills_state.dart';

@Injectable()
class BillsBloc extends Bloc<BillsEvent, BillsState> {
  BillsBloc() : super(const BillsState()) {
    on<BillsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
