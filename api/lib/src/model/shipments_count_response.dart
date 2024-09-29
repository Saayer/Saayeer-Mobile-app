//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipments_count_response.g.dart';

/// ShipmentsCountResponse
///
/// Properties:
/// * [totalShipments] 
/// * [requestedShipments] 
/// * [pickedShipments] 
/// * [onTheWayShipments] 
/// * [deliveredShipments] 
@BuiltValue()
abstract class ShipmentsCountResponse implements Built<ShipmentsCountResponse, ShipmentsCountResponseBuilder> {
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

  ShipmentsCountResponse._();

  factory ShipmentsCountResponse([void updates(ShipmentsCountResponseBuilder b)]) = _$ShipmentsCountResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentsCountResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentsCountResponse> get serializer => _$ShipmentsCountResponseSerializer();
}

class _$ShipmentsCountResponseSerializer implements PrimitiveSerializer<ShipmentsCountResponse> {
  @override
  final Iterable<Type> types = const [ShipmentsCountResponse, _$ShipmentsCountResponse];

  @override
  final String wireName = r'ShipmentsCountResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentsCountResponse object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentsCountResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentsCountResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentsCountResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentsCountResponseBuilder();
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

