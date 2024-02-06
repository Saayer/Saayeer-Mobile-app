import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_card_event.dart';
part 'user_card_state.dart';

class UserCardBloc extends Bloc<UserCardEvent, UserCardState> {
  UserCardBloc() : super(UserCardInitial()) {
    on<UserCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
