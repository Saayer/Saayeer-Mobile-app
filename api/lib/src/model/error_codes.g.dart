// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_codes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ErrorCodes _$savePayment = const ErrorCodes._('savePayment');
const ErrorCodes _$updateShipmentStatus =
    const ErrorCodes._('updateShipmentStatus');
const ErrorCodes _$logisticsAPI = const ErrorCodes._('logisticsAPI');

ErrorCodes _$valueOf(String name) {
  switch (name) {
    case 'savePayment':
      return _$savePayment;
    case 'updateShipmentStatus':
      return _$updateShipmentStatus;
    case 'logisticsAPI':
      return _$logisticsAPI;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ErrorCodes> _$values =
    new BuiltSet<ErrorCodes>(const <ErrorCodes>[
  _$savePayment,
  _$updateShipmentStatus,
  _$logisticsAPI,
]);

class _$ErrorCodesMeta {
  const _$ErrorCodesMeta();
  ErrorCodes get savePayment => _$savePayment;
  ErrorCodes get updateShipmentStatus => _$updateShipmentStatus;
  ErrorCodes get logisticsAPI => _$logisticsAPI;
  ErrorCodes valueOf(String name) => _$valueOf(name);
  BuiltSet<ErrorCodes> get values => _$values;
}

abstract class _$ErrorCodesMixin {
  // ignore: non_constant_identifier_names
  _$ErrorCodesMeta get ErrorCodes => const _$ErrorCodesMeta();
}

Serializer<ErrorCodes> _$errorCodesSerializer = new _$ErrorCodesSerializer();

class _$ErrorCodesSerializer implements PrimitiveSerializer<ErrorCodes> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'savePayment': 'Save_Payment',
    'updateShipmentStatus': 'Update_Shipment_Status',
    'logisticsAPI': 'Logistics_API',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Save_Payment': 'savePayment',
    'Update_Shipment_Status': 'updateShipmentStatus',
    'Logistics_API': 'logisticsAPI',
  };

  @override
  final Iterable<Type> types = const <Type>[ErrorCodes];
  @override
  final String wireName = 'ErrorCodes';

  @override
  Object serialize(Serializers serializers, ErrorCodes object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ErrorCodes deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ErrorCodes.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
