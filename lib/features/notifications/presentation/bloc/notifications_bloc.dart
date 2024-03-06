import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/notifications/domain/entities/notification_entity.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

@Injectable()
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<InitNotifications>(_initNotifications);
  }

  FutureOr<void> _initNotifications(
      InitNotifications event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADING)));

    final List<NotificationEntity> notificationsList = List.generate(
        10,
        (index) => NotificationEntity(
            id: "$index",
            title: "title_$index",
            description: "description_$index",
            date: Constants.formattedNowDate));

    emit(state.copyWith(
        stateHelper: const StateHelper(requestState: RequestState.LOADED),
        notificationsList: notificationsList));
  }
}
