//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipments_count_response_l_admin.g.dart';

/// ShipmentsCountResponseLAdmin
///
/// Properties:
/// * [totalShipments] 
/// * [requestedShipments] 
/// * [pickedShipments] 
/// * [onTheWayShipments] 
/// * [deliveredShipments] 
/// * [clientsCount] 
@BuiltValue()
abstract class ShipmentsCountResponseLAdmin implements Built<ShipmentsCountResponseLAdmin, ShipmentsCountResponseLAdminBuilder> {
  @BuiltValueField(wireName: r'totalShipments')
  int? get totalShipments;

  @BuiltValueField(wireName: r'requestedShipments')
  int? get requestedShipments;

  @BuiltValueField(wireName: r'pickedShipments')
  int? get pickedShipments;

  @BuiltValueField(wireName: r'onTheWayShipments')
  int? get onTheWayShipments;

  @BuiltValueField(wireName: r'deliveredShipments')
  int? get deliveredShipments;

  @BuiltValueField(wireName: r'clientsCount')
  int? get clientsCount;

  ShipmentsCountResponseLAdmin._();

  factory ShipmentsCountResponseLAdmin([void updates(ShipmentsCountResponseLAdminBuilder b)]) = _$ShipmentsCountResponseLAdmin;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentsCountResponseLAdminBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentsCountResponseLAdmin> get serializer => _$ShipmentsCountResponseLAdminSerializer();
}

class _$ShipmentsCountResponseLAdminSerializer implements PrimitiveSerializer<ShipmentsCountResponseLAdmin> {
  @override
  final Iterable<Type> types = const [ShipmentsCountResponseLAdmin, _$ShipmentsCountResponseLAdmin];

  @override
  final String wireName = r'ShipmentsCountResponseLAdmin';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentsCountResponseLAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.totalShipments != null) {
      yield r'totalShipments';
      yield serializers.serialize(
        object.totalShipments,
        specifiedType: const FullType(int),
      );
    }
    if (object.requestedShipments != null) {
      yield r'requestedShipments';
      yield serializers.serialize(
        object.requestedShipments,
        specifiedType: const FullType(int),
      );
    }
    if (object.pickedShipments != null) {
      yield r'pickedShipments';
      yield serializers.serialize(
        object.pickedShipments,
        specifiedType: const FullType(int),
      );
    }
    if (object.onTheWayShipments != null) {
      yield r'onTheWayShipments';
      yield serializers.serialize(
        object.onTheWayShipments,
        specifiedType: const FullType(int),
      );
    }
    if (object.deliveredShipments != null) {
      yield r'deliveredShipments';
      yield serializers.serialize(
        object.deliveredShipments,
        specifiedType: const FullType(int),
      );
    }
    if (object.clientsCount != null) {
      yield r'clientsCount';
      yield serializers.serialize(
        object.clientsCount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentsCountResponseLAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentsCountResponseLAdminBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'totalShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalShipments = valueDes;
          break;
        case r'requestedShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.requestedShipments = valueDes;
          break;
        case r'pickedShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pickedShipments = valueDes;
          break;
        case r'onTheWayShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.onTheWayShipments = valueDes;
          break;
        case r'deliveredShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.deliveredShipments = valueDes;
          break;
        case r'clientsCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.clientsCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentsCountResponseLAdmin deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentsCountResponseLAdminBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

