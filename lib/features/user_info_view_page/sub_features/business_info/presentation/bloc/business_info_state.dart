part of 'business_info_bloc.dart';

abstract class BusinessInfoState extends Equatable {
  const BusinessInfoState();
}

class BusinessInfoInitial extends BusinessInfoState {
  @override
  List<Object> get props => [];
}
