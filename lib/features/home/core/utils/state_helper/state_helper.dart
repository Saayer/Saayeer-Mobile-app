import 'package:equatable/equatable.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';

class HomeStateHelper<T> extends Equatable {
  final HomeRequestState requestState;
  final String errorMessage, successMessage, loadingMessage;
  final T? errorStatus;

  const HomeStateHelper(
      {this.requestState = HomeRequestState.LOADING_SHIPMENTS_COUNT,
      this.errorMessage = "something_went_wrong",
      this.successMessage = "success",
      this.loadingMessage = "",
      this.errorStatus});

  HomeStateHelper copyWith(
      {HomeRequestState? requestState,
      String? errorMessage,
      String? successMessage,
      String? loadingMessage,
      T? errorStatus}) {
    return HomeStateHelper(
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
