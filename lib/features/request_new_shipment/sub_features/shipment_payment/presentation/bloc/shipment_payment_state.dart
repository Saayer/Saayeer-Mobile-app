part of 'shipment_payment_bloc.dart';

@immutable
class ShipmentPaymentState extends Equatable {
  final PaymentStateHelper stateHelper;
  final PaymentAddDto? paymentAddDto;
  final CreatePaymentResponse? createPaymentResponse;

  const ShipmentPaymentState({
    this.stateHelper = const PaymentStateHelper(requestState: PaymentRequestState.PAYMENTLOADING),
    this.paymentAddDto,
    this.createPaymentResponse,
  });

  ShipmentPaymentState copyWith({
    PaymentStateHelper? stateHelper,
    PaymentAddDto? paymentAddDto,
    CreatePaymentResponse? createPaymentResponse,
  }) {
    return ShipmentPaymentState(
      stateHelper: stateHelper ?? this.stateHelper,
      paymentAddDto: paymentAddDto ?? this.paymentAddDto,
      createPaymentResponse: createPaymentResponse ?? this.createPaymentResponse,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        paymentAddDto,
        createPaymentResponse,
      ];
}
