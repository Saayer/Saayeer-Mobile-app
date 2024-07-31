part of 'address_details_bloc.dart';

@immutable
class AddressDetailsState extends Equatable {
  final StateHelper stateHelper;
  final CustomerGetDto? addressInfoEntity;

  const AddressDetailsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.addressInfoEntity});

  AddressDetailsState copyWith({
    StateHelper? stateHelper,
    CustomerGetDto? addressInfoEntity,
  }) {
    return AddressDetailsState(
      stateHelper: stateHelper ?? this.stateHelper,
      addressInfoEntity: addressInfoEntity ?? this.addressInfoEntity,
    );
  }

  @override
  List<Object?> get props => [stateHelper, addressInfoEntity];
}
