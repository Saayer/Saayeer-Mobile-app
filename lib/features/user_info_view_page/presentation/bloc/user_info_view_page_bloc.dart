import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';

part 'user_info_view_page_event.dart';
part 'user_info_view_page_state.dart';

class UserInfoViewPageBloc extends Bloc<UserInfoViewPageEvent, UserInfoViewPageState> {
  UserInfoViewPageBloc() : super(const UserInfoViewPageState()) {
    on<UserInfoViewPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
