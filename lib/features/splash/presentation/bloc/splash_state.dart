part of 'splash_bloc.dart';

@immutable
class SplashState extends Equatable {
  final RequestState requestState;
  final SplashUserEntity? splashUserEntity;

  const SplashState(
      {this.requestState = RequestState.LOADED, this.splashUserEntity});

  SplashState copyWith(
      {RequestState? requestState, SplashUserEntity? splashUserEntity}) {
    return SplashState(
        requestState: requestState ?? this.requestState,
        splashUserEntity: splashUserEntity ?? this.splashUserEntity);
  }

  @override
  List<Object> get props => [requestState];
}
