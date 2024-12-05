//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'error_codes.g.dart';

class ErrorCodes extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Save_Payment')
  static const ErrorCodes savePayment = _$savePayment;
  @BuiltValueEnumConst(wireName: r'Update_Shipment_Status')
  static const ErrorCodes updateShipmentStatus = _$updateShipmentStatus;
  @BuiltValueEnumConst(wireName: r'Logistics_API')
  static const ErrorCodes logisticsAPI = _$logisticsAPI;
  @BuiltValueEnumConst(wireName: r'Payment_Already_Exist')
  static const ErrorCodes paymentAlreadyExist = _$paymentAlreadyExist;

  static Serializer<ErrorCodes> get serializer => _$errorCodesSerializer;

  const ErrorCodes._(String name): super(name);

  static BuiltSet<ErrorCodes> get values => _$values;
  static ErrorCodes valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ErrorCodesMixin = Object with _$ErrorCodesMixin;

