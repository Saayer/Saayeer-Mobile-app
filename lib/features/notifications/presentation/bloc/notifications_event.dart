part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();
}

class InitNotifications extends NotificationsEvent {
  const InitNotifications();

  @override
  List<Object> get props => [];
}
