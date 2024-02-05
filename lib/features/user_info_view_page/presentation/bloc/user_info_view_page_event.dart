part of 'user_info_view_page_bloc.dart';

abstract class UserInfoViewPageEvent extends Equatable {
  const UserInfoViewPageEvent();
}

class InitUserInfoViewPageEvent extends UserInfoViewPageEvent {
  final int currentPage;

  const InitUserInfoViewPageEvent({
    required this.currentPage,
  });

  @override
  List<Object> get props => [currentPage];
}
