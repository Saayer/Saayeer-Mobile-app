// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shipment_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateShipmentStatus _$pickupNotCreated =
    const CreateShipmentStatus._('pickupNotCreated');

CreateShipmentStatus _$valueOf(String name) {
  switch (name) {
    case 'pickupNotCreated':
      return _$pickupNotCreated;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateShipmentStatus> _$values =
    new BuiltSet<CreateShipmentStatus>(const <CreateShipmentStatus>[
  _$pickupNotCreated,
]);

class _$CreateShipmentStatusMeta {
  const _$CreateShipmentStatusMeta();
  CreateShipmentStatus get pickupNotCreated => _$pickupNotCreated;
  CreateShipmentStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<CreateShipmentStatus> get values => _$values;
}

abstract class _$CreateShipmentStatusMixin {
  // ignore: non_constant_identifier_names
  _$CreateShipmentStatusMeta get CreateShipmentStatus =>
      const _$CreateShipmentStatusMeta();
}

Serializer<CreateShipmentStatus> _$createShipmentStatusSerializer =
    new _$CreateShipmentStatusSerializer();

class _$CreateShipmentStatusSerializer
    implements PrimitiveSerializer<CreateShipmentStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pickupNotCreated': 'Pickup_Not_Created',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Pickup_Not_Created': 'pickupNotCreated',
  };

  @override
  final Iterable<Type> types = const <Type>[CreateShipmentStatus];
  @override
  final String wireName = 'CreateShipmentStatus';

  @override
  Object serialize(Serializers serializers, CreateShipmentStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateShipmentStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateShipmentStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
