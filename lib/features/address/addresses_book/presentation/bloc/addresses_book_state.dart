part of 'addresses_book_bloc.dart';

@immutable
class AddressesBookState extends Equatable {
  final StateHelper stateHelper;
  final List<CustomerGetDto>? addresses;
  final CustomerQuery? customerQuery;
  final int? countryId;
  final int? governorateId;
  final int? cityId;
  final bool? hasNextPage;

  const AddressesBookState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADING),
      this.addresses,
      this.customerQuery,
      this.countryId,
      this.governorateId,
      this.hasNextPage,
      this.cityId});

  AddressesBookState copyWith(
      {StateHelper? stateHelper,
      List<CustomerGetDto>? addresses,
      CustomerQuery? customerQuery,
      bool? hasNextPage,
      int? countryId,
      int? governorateId,
      int? cityId}) {
    return AddressesBookState(
        stateHelper: stateHelper ?? this.stateHelper,
        addresses: addresses ?? this.addresses,
        customerQuery: customerQuery ?? this.customerQuery,
        countryId: countryId ?? this.countryId,
        governorateId: governorateId ?? this.governorateId,
        hasNextPage: hasNextPage ?? this.hasNextPage,
        cityId: cityId ?? this.cityId);
  }

  @override
  List<Object?> get props => [
        stateHelper,
        addresses,
        customerQuery,
        countryId,
        governorateId,
        hasNextPage,
        cityId,
      ];
}
