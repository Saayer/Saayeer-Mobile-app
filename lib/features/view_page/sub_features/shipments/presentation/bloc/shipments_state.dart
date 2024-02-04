part of 'shipments_bloc.dart';

abstract class ShipmentsState extends Equatable {
  const ShipmentsState();
}

class ShipmentsInitial extends ShipmentsState {
  @override
  List<Object> get props => [];
}
