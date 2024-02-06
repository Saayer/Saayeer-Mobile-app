part of 'user_card_bloc.dart';

abstract class UserCardState extends Equatable {
  const UserCardState();
}

class UserCardInitial extends UserCardState {
  @override
  List<Object> get props => [];
}
