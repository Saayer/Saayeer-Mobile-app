part of 'intro_bloc.dart';

@immutable
class IntroState extends Equatable {
  final RequestState requestState;
  final int currentPage;

  const IntroState(
      {this.requestState = RequestState.LOADED, this.currentPage = 0});

  @override
  List<Object> get props => [requestState];

  IntroState copyWith({
    RequestState? requestState,
    int? currentPage,
  }) {
    return IntroState(
      requestState: requestState ?? this.requestState,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
