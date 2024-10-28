import 'package:equatable/equatable.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/data/core/utils/enums.dart';

class PaymentStateHelper<T> extends Equatable {
  final PaymentRequestState requestState;
  final String errorMessage, successMessage, loadingMessage;
  final T? errorStatus;

  const PaymentStateHelper(
      {this.requestState = PaymentRequestState.PAYMENTLOADING,
      this.errorMessage = "something_went_wrong",
      this.successMessage = "success",
      this.loadingMessage = "",
      this.errorStatus});

  PaymentStateHelper copyWith(
      {PaymentRequestState? requestState,
      String? errorMessage,
      String? successMessage,
      String? loadingMessage,
      T? errorStatus}) {
    return PaymentStateHelper(
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
