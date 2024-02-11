import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'contact_us_event.dart';

part 'contact_us_state.dart';

@Injectable()
class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc() : super(const ContactUsState()) {
    on<ContactUsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
