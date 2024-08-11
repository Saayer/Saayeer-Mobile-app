import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'reports_event.dart';

part 'reports_state.dart';

@Injectable()
class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(const ReportsState()) {
    on<ReportsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
