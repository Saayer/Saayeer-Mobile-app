//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/addressable_add_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_cost_request.g.dart';

/// ShipmentCostRequest
///
/// Properties:
/// * [length] 
/// * [height] 
/// * [weight] 
/// * [width] 
/// * [contentDesc] 
/// * [contentValue] 
/// * [senderAddress] 
/// * [receiverAddress] 
@BuiltValue()
abstract class ShipmentCostRequest implements Built<ShipmentCostRequest, ShipmentCostRequestBuilder> {
  @BuiltValueField(wireName: r'length')
  double? get length;

  @BuiltValueField(wireName: r'height')
  double? get height;

  @BuiltValueField(wireName: r'weight')
  double? get weight;

  @BuiltValueField(wireName: r'width')
  double? get width;

  @BuiltValueField(wireName: r'contentDesc')
  String? get contentDesc;

  @BuiltValueField(wireName: r'contentValue')
  double? get contentValue;

  @BuiltValueField(wireName: r'sender_Address')
  AddressableAddDto? get senderAddress;

  @BuiltValueField(wireName: r'receiver_Address')
  AddressableAddDto? get receiverAddress;

  ShipmentCostRequest._();

  factory ShipmentCostRequest([void updates(ShipmentCostRequestBuilder b)]) = _$ShipmentCostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentCostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentCostRequest> get serializer => _$ShipmentCostRequestSerializer();
}

class _$ShipmentCostRequestSerializer implements PrimitiveSerializer<ShipmentCostRequest> {
  @override
  final Iterable<Type> types = const [ShipmentCostRequest, _$ShipmentCostRequest];

  @override
  final String wireName = r'ShipmentCostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentCostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.length != null) {
      yield r'length';
      yield serializers.serialize(
        object.length,
        specifiedType: const FullType(double),
      );
    }
    if (object.height != null) {
      yield r'height';
      yield serializers.serialize(
        object.height,
        specifiedType: const FullType(double),
      );
    }
    if (object.weight != null) {
      yield r'weight';
      yield serializers.serialize(
        object.weight,
        specifiedType: const FullType(double),
      );
    }
    if (object.width != null) {
      yield r'width';
      yield serializers.serialize(
        object.width,
        specifiedType: const FullType(double),
      );
    }
    if (object.contentDesc != null) {
      yield r'contentDesc';
      yield serializers.serialize(
        object.contentDesc,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentValue != null) {
      yield r'contentValue';
      yield serializers.serialize(
        object.contentValue,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.senderAddress != null) {
      yield r'sender_Address';
      yield serializers.serialize(
        object.senderAddress,
        specifiedType: const FullType.nullable(AddressableAddDto),
      );
    }
    if (object.receiverAddress != null) {
      yield r'receiver_Address';
      yield serializers.serialize(
        object.receiverAddress,
        specifiedType: const FullType.nullable(AddressableAddDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentCostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentCostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'length':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.length = valueDes;
          break;
        case r'height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.height = valueDes;
          break;
        case r'weight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.weight = valueDes;
          break;
        case r'width':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.width = valueDes;
          break;
        case r'contentDesc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contentDesc = valueDes;
          break;
        case r'contentValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.contentValue = valueDes;
          break;
        case r'sender_Address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AddressableAddDto),
          ) as AddressableAddDto?;
          if (valueDes == null) continue;
          result.senderAddress.replace(valueDes);
          break;
        case r'receiver_Address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AddressableAddDto),
          ) as AddressableAddDto?;
          if (valueDes == null) continue;
          result.receiverAddress.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentCostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentCostRequestBuilder();
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

