part of 'clients_bloc.dart';

@immutable
class ClientsState extends Equatable {
  final StateHelper stateHelper;
  final ClientsQuery? clientsQuery;
  final bool? hasNextPage;
  final List<ClientGetDto>? clientsList;

  const ClientsState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.clientsQuery,
    this.hasNextPage,
    this.clientsList,
  });

  ClientsState copyWith({
    StateHelper? stateHelper,
    ClientsQuery? clientsQuery,
    bool? hasNextPage,
    List<ClientGetDto>? clientsList,
  }) {
    return ClientsState(
      stateHelper: stateHelper ?? this.stateHelper,
      clientsQuery: clientsQuery ?? this.clientsQuery,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      clientsList: clientsList ?? this.clientsList,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        clientsQuery,
        hasNextPage,
        clientsList,
      ];
}
