import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'business_info_event.dart';
part 'business_info_state.dart';

class BusinessInfoBloc extends Bloc<BusinessInfoEvent, BusinessInfoState> {
  BusinessInfoBloc() : super(BusinessInfoInitial()) {
    on<BusinessInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
