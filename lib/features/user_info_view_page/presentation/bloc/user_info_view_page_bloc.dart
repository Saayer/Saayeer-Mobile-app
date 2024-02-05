import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_info_view_page_event.dart';
part 'user_info_view_page_state.dart';

class UserInfoViewPageBloc extends Bloc<UserInfoViewPageEvent, UserInfoViewPageState> {
  UserInfoViewPageBloc() : super(UserInfoViewPageInitial()) {
    on<UserInfoViewPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
