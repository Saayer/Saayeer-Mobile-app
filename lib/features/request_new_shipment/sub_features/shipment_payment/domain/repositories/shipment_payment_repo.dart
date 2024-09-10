import 'package:dartz/dartz.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/error/failure.dart';

abstract class ShipmentPaymentRepo {
  Future<Either<Failure, CreatePaymentResponse>> createPayment(PaymentAddDto paymentDto);
}
