part of 'user_info_view_page_bloc.dart';

class UserInfoViewPageState extends Equatable {
  final StateHelper stateHelper;

  const UserInfoViewPageState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
  });

  UserInfoViewPageState copyWith({
    StateHelper? stateHelper,
  }) {
    return UserInfoViewPageState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];
}
