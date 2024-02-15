import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'why_saayer_event.dart';
part 'why_saayer_state.dart';

@Injectable()
class WhySaayerBloc extends Bloc<WhySaayerEvent, WhySaayerState> {
  WhySaayerBloc() : super(const WhySaayerState()) {
    on<WhySaayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
