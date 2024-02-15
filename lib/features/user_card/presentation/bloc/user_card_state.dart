part of 'user_card_bloc.dart';

@immutable
class UserCardState extends Equatable {
  final StateHelper stateHelper;
  final UserCardEntity? userCardEntity;

  const UserCardState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
        this.userCardEntity});

  UserCardState copyWith({
    StateHelper? stateHelper,
    UserCardEntity? userCardEntity,
  }) {
    return UserCardState(
      stateHelper: stateHelper ?? this.stateHelper,
      userCardEntity: userCardEntity ?? this.userCardEntity,
    );
  }

  @override
  List<Object?> get props => [stateHelper, userCardEntity];
}
