part of 'user_card_bloc.dart';

@immutable
class UserCardState extends Equatable {
  final StateHelper stateHelper;
  final UserCardEntity? userCardEntity;
  final bool isGuest;

  const UserCardState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.userCardEntity,
      this.isGuest = true});

  UserCardState copyWith({
    StateHelper? stateHelper,
    UserCardEntity? userCardEntity,
    bool? isGuest,
  }) {
    return UserCardState(
      stateHelper: stateHelper ?? this.stateHelper,
      userCardEntity: userCardEntity ?? this.userCardEntity,
      isGuest: isGuest ?? this.isGuest,
    );
  }

  @override
  List<Object?> get props => [stateHelper, userCardEntity, isGuest];
}
