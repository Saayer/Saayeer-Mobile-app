import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';

part 'user_card_event.dart';
part 'user_card_state.dart';

class UserCardBloc extends Bloc<UserCardEvent, UserCardState> {
  UserCardBloc() : super(const UserCardState()) {
    on<UserCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
