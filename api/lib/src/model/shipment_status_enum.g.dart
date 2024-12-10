// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_status_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ShipmentStatusEnum _$pending = const ShipmentStatusEnum._('pending');
const ShipmentStatusEnum _$paid = const ShipmentStatusEnum._('paid');
const ShipmentStatusEnum _$requested = const ShipmentStatusEnum._('requested');
const ShipmentStatusEnum _$picked = const ShipmentStatusEnum._('picked');
const ShipmentStatusEnum _$onTheWay = const ShipmentStatusEnum._('onTheWay');
const ShipmentStatusEnum _$delivered = const ShipmentStatusEnum._('delivered');
const ShipmentStatusEnum _$needAction =
    const ShipmentStatusEnum._('needAction');
const ShipmentStatusEnum _$unKnown = const ShipmentStatusEnum._('unKnown');
const ShipmentStatusEnum _$canceled = const ShipmentStatusEnum._('canceled');
const ShipmentStatusEnum _$hasError = const ShipmentStatusEnum._('hasError');
const ShipmentStatusEnum _$ignored = const ShipmentStatusEnum._('ignored');

ShipmentStatusEnum _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'paid':
      return _$paid;
    case 'requested':
      return _$requested;
    case 'picked':
      return _$picked;
    case 'onTheWay':
      return _$onTheWay;
    case 'delivered':
      return _$delivered;
    case 'needAction':
      return _$needAction;
    case 'unKnown':
      return _$unKnown;
    case 'canceled':
      return _$canceled;
    case 'hasError':
      return _$hasError;
    case 'ignored':
      return _$ignored;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ShipmentStatusEnum> _$values =
    new BuiltSet<ShipmentStatusEnum>(const <ShipmentStatusEnum>[
  _$pending,
  _$paid,
  _$requested,
  _$picked,
  _$onTheWay,
  _$delivered,
  _$needAction,
  _$unKnown,
  _$canceled,
  _$hasError,
  _$ignored,
]);

class _$ShipmentStatusEnumMeta {
  const _$ShipmentStatusEnumMeta();
  ShipmentStatusEnum get pending => _$pending;
  ShipmentStatusEnum get paid => _$paid;
  ShipmentStatusEnum get requested => _$requested;
  ShipmentStatusEnum get picked => _$picked;
  ShipmentStatusEnum get onTheWay => _$onTheWay;
  ShipmentStatusEnum get delivered => _$delivered;
  ShipmentStatusEnum get needAction => _$needAction;
  ShipmentStatusEnum get unKnown => _$unKnown;
  ShipmentStatusEnum get canceled => _$canceled;
  ShipmentStatusEnum get hasError => _$hasError;
  ShipmentStatusEnum get ignored => _$ignored;
  ShipmentStatusEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<ShipmentStatusEnum> get values => _$values;
}

abstract class _$ShipmentStatusEnumMixin {
  // ignore: non_constant_identifier_names
  _$ShipmentStatusEnumMeta get ShipmentStatusEnum =>
      const _$ShipmentStatusEnumMeta();
}

Serializer<ShipmentStatusEnum> _$shipmentStatusEnumSerializer =
    new _$ShipmentStatusEnumSerializer();

class _$ShipmentStatusEnumSerializer
    implements PrimitiveSerializer<ShipmentStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'Pending',
    'paid': 'Paid',
    'requested': 'Requested',
    'picked': 'Picked',
    'onTheWay': 'OnTheWay',
    'delivered': 'Delivered',
    'needAction': 'NeedAction',
    'unKnown': 'UnKnown',
    'canceled': 'Canceled',
    'hasError': 'HasError',
    'ignored': 'Ignored',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Pending': 'pending',
    'Paid': 'paid',
    'Requested': 'requested',
    'Picked': 'picked',
    'OnTheWay': 'onTheWay',
    'Delivered': 'delivered',
    'NeedAction': 'needAction',
    'UnKnown': 'unKnown',
    'Canceled': 'canceled',
    'HasError': 'hasError',
    'Ignored': 'ignored',
  };

  @override
  final Iterable<Type> types = const <Type>[ShipmentStatusEnum];
  @override
  final String wireName = 'ShipmentStatusEnum';

  @override
  Object serialize(Serializers serializers, ShipmentStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ShipmentStatusEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ShipmentStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
