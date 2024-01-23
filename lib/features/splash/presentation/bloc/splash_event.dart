part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object> get props => [];
}

class GetUserStatus extends SplashEvent{
  const GetUserStatus();
  @override
  List<Object> get props => [];
}
