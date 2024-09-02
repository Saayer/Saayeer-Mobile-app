part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitHome extends HomeEvent {
  @override
  List<Object> get props => [];
}

class RefreshEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}