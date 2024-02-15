part of 'contact_us_bloc.dart';

@immutable
class ContactUsState extends Equatable {
  final StateHelper stateHelper;

  const ContactUsState(
      {this.stateHelper =
          const StateHelper(requestState: RequestState.LOADING)});

  ContactUsState copyWith({
    StateHelper? stateHelper,
  }) {
    return ContactUsState(
      stateHelper: stateHelper ?? this.stateHelper,
    );
  }

  @override
  List<Object?> get props => [stateHelper];
}
