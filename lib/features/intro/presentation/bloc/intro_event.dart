part of 'intro_bloc.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();
}

class InitIntro extends IntroEvent {
  @override
  List<Object> get props => [];
}

class ChangeCurrentPage extends IntroEvent {
  final int currentPage;

  const ChangeCurrentPage({
    required this.currentPage,
  });

  @override
  List<Object> get props => [currentPage];
}
