part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final StateHelper stateHelper;
  final ClientGetDto? clientDto;

  const HomeState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.clientDto});

  HomeState copyWith({
    StateHelper? stateHelper,
    ClientGetDto? clientDto,
  }) {
    return HomeState(
      stateHelper: stateHelper ?? this.stateHelper,
      clientDto: clientDto ?? this.clientDto,
    );
  }

  @override
  List<Object?> get props => [stateHelper, clientDto];
}
