import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/get_started/domain/entities/social_login_entity.dart';

part 'get_started_event.dart';

part 'get_started_state.dart';

class GetStartedBloc extends Bloc<GetStartedEvent, GetStartedState> {
  GetStartedBloc() : super(GetStartedState()) {

  }
}
