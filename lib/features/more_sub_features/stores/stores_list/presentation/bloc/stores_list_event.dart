part of 'stores_list_bloc.dart';

abstract class StoresListEvent extends Equatable {
  const StoresListEvent();
}

class GetStores extends StoresListEvent {
  const GetStores();

  @override
  List<Object> get props => [];
}

class ResetList extends StoresListEvent {
  const ResetList();

  @override
  List<Object?> get props => [];
}

class OnStoreDelete extends StoresListEvent {
  final StoreGetDto storeDto;
  const OnStoreDelete({required this.storeDto});

  @override
  List<Object?> get props => [storeDto];
}
