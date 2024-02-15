part of 'user_info_view_page_bloc.dart';

@immutable
class UserInfoViewPageState extends Equatable {
  final StateHelper stateHelper;
  final int currentPage;

  const UserInfoViewPageState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.currentPage = 0});

  UserInfoViewPageState copyWith({
    StateHelper? stateHelper,
    int? currentPage,
  }) {
    return UserInfoViewPageState(
      stateHelper: stateHelper ?? this.stateHelper,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [stateHelper, currentPage];
}
