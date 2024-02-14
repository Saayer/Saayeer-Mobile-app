part of 'addresses_book_bloc.dart';

@immutable
class AddressesBookState extends Equatable {
  final StateHelper stateHelper;

  const AddressesBookState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  AddressesBookState copyWith({
    StateHelper? stateHelper,
  }) {
    return AddressesBookState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object> get props => [stateHelper];
}
