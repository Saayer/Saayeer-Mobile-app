import 'package:equatable/equatable.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';

class ShipmentSummaryStateHelper<T> extends Equatable {
  final ShipmentSummaryRequestState requestState;
  final String errorMessage, successMessage, loadingMessage;
  final T? errorStatus;

  const ShipmentSummaryStateHelper(
      {this.requestState = ShipmentSummaryRequestState.LOADING_SENDER,
      this.errorMessage = "something_went_wrong",
      this.successMessage = "success",
      this.loadingMessage = "",
      this.errorStatus});

  ShipmentSummaryStateHelper copyWith(
      {ShipmentSummaryRequestState? requestState,
      String? errorMessage,
      String? successMessage,
      String? loadingMessage,
      T? errorStatus}) {
    return ShipmentSummaryStateHelper(
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
