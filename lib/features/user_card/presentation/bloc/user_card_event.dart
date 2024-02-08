part of 'user_card_bloc.dart';

abstract class UserCardEvent extends Equatable {
  const UserCardEvent();
}

class InitUserCard extends UserCardEvent {
  @override
  List<Object> get props => [];
}
