part of 'address_widgets_bloc.dart';

@immutable
class AddressWidgetsState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;

  const AddressWidgetsState(
      {this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
      this.autoValidateMode = AutovalidateMode.disabled});

  AddressWidgetsState copyWith(
      {StateHelper? stateHelper, AutovalidateMode? autoValidateMode}) {
    return AddressWidgetsState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
    );
  }

  @override
  List<Object?> get props => [stateHelper, autoValidateMode];
}
