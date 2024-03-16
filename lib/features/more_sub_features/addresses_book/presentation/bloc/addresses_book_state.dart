part of 'addresses_book_bloc.dart';

@immutable
class AddressesBookState extends Equatable {
  final StateHelper stateHelper;
  final List<AddressInfoEntity>? addresses;

  const AddressesBookState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.addresses});

  AddressesBookState copyWith({
    StateHelper? stateHelper,
    List<AddressInfoEntity>? addresses,
  }) {
    return AddressesBookState(
      stateHelper: stateHelper ?? this.stateHelper,
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  List<Object?> get props => [stateHelper, addresses];
}
