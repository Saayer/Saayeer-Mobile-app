// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ShipmentStatus _$pending = const ShipmentStatus._('pending');
const ShipmentStatus _$paid = const ShipmentStatus._('paid');
const ShipmentStatus _$requested = const ShipmentStatus._('requested');

ShipmentStatus _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'paid':
      return _$paid;
    case 'requested':
      return _$requested;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ShipmentStatus> _$values =
    new BuiltSet<ShipmentStatus>(const <ShipmentStatus>[
  _$pending,
  _$paid,
  _$requested,
]);

class _$ShipmentStatusMeta {
  const _$ShipmentStatusMeta();
  ShipmentStatus get pending => _$pending;
  ShipmentStatus get paid => _$paid;
  ShipmentStatus get requested => _$requested;
  ShipmentStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ShipmentStatus> get values => _$values;
}

abstract class _$ShipmentStatusMixin {
  // ignore: non_constant_identifier_names
  _$ShipmentStatusMeta get ShipmentStatus => const _$ShipmentStatusMeta();
}

Serializer<ShipmentStatus> _$shipmentStatusSerializer =
    new _$ShipmentStatusSerializer();

class _$ShipmentStatusSerializer
    implements PrimitiveSerializer<ShipmentStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'Pending',
    'paid': 'Paid',
    'requested': 'Requested',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Pending': 'pending',
    'Paid': 'paid',
    'Requested': 'requested',
  };

  @override
  final Iterable<Type> types = const <Type>[ShipmentStatus];
  @override
  final String wireName = 'ShipmentStatus';

  @override
  Object serialize(Serializers serializers, ShipmentStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ShipmentStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ShipmentStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
