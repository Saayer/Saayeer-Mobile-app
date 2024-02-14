import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'shipping_rates_event.dart';

part 'shipping_rates_state.dart';

@Injectable()
class ShippingRatesBloc extends Bloc<ShippingRatesEvent, ShippingRatesState> {
  ShippingRatesBloc() : super(const ShippingRatesState()) {
    on<ShippingRatesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
