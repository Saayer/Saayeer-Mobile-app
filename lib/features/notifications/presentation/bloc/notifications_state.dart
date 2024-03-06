part of 'notifications_bloc.dart';

@immutable
class NotificationsState extends Equatable {
  final StateHelper stateHelper;
  final List<NotificationEntity>? notificationsList;

  const NotificationsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
        this.notificationsList});

  NotificationsState copyWith({
    StateHelper? stateHelper,
    List<NotificationEntity>? notificationsList,
  }) {
    return NotificationsState(
      stateHelper: stateHelper ?? this.stateHelper,
      notificationsList: notificationsList ?? this.notificationsList,
    );
  }

  @override
  List<Object?> get props => [stateHelper, notificationsList];
}