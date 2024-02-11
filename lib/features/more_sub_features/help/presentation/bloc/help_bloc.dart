import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'help_event.dart';

part 'help_state.dart';

@Injectable()
class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc() : super(const HelpState()) {
    on<HelpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
