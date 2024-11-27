part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();
}

class RefreshEvent extends MoreEvent {
  @override
  List<Object> get props => [];
}

class LogOutEvent extends MoreEvent {
  @override
  List<Object> get props => [];
}

class OnDeleteAccount extends MoreEvent {
  @override
  List<Object> get props => [];
}