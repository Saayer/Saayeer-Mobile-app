part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final StateHelper stateHelper;
  final UserProfileEntity? userProfileEntity;

  const HomeState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.userProfileEntity});

  HomeState copyWith({
    StateHelper? stateHelper,
    UserProfileEntity? userProfileEntity,
  }) {
    return HomeState(
      stateHelper: stateHelper ?? this.stateHelper,
      userProfileEntity: userProfileEntity ?? this.userProfileEntity,
    );
  }

  @override
  List<Object?> get props => [stateHelper, userProfileEntity];
}
