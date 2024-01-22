import 'package:saayer/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class StateHelper<T> extends Equatable {
  final RequestState requestState;
  final String errorMessage, successMessage, loadingMessage;
  final T? errorStatus;

  const StateHelper(
      {this.requestState = RequestState.LOADING,
      this.errorMessage = "something_went_wrong",
      this.successMessage = "success",
      this.loadingMessage = "",
      this.errorStatus});

  StateHelper copyWith(
      {RequestState? requestState,
      String? errorMessage,
      String? successMessage,
      String? loadingMessage,
      T? errorStatus}) {
    return StateHelper(
        requestState: requestState ?? this.requestState,
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage ?? this.successMessage,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        errorStatus: errorStatus);
  }

  @override
  List<Object?> get props =>
      [requestState, errorMessage, successMessage, loadingMessage, errorStatus];
}
