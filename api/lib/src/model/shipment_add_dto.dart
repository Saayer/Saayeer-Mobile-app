//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_add_dto.g.dart';

/// ShipmentAddDto
///
/// Properties:
/// * [shipmentId] 
/// * [length] 
/// * [height] 
/// * [weight] 
/// * [contentDesc] 
/// * [contentValue] 
/// * [senderCustomerId] 
/// * [receiverCustomerId] 
/// * [senderStoreId] 
/// * [receiverStoreId] 
@BuiltValue()
abstract class ShipmentAddDto implements Built<ShipmentAddDto, ShipmentAddDtoBuilder> {
  @BuiltValueField(wireName: r'shipmentId')
  int? get shipmentId;

  @BuiltValueField(wireName: r'length')
  int? get length;

  @BuiltValueField(wireName: r'height')
  int? get height;

  @BuiltValueField(wireName: r'weight')
  int? get weight;

  @BuiltValueField(wireName: r'contentDesc')
  int? get contentDesc;

  @BuiltValueField(wireName: r'contentValue')
  int? get contentValue;

  @BuiltValueField(wireName: r'senderCustomerId')
  int? get senderCustomerId;

  @BuiltValueField(wireName: r'receiverCustomerId')
  int? get receiverCustomerId;

  @BuiltValueField(wireName: r'senderStoreId')
  int? get senderStoreId;

  @BuiltValueField(wireName: r'receiverStoreId')
  int? get receiverStoreId;

  ShipmentAddDto._();

  factory ShipmentAddDto([void updates(ShipmentAddDtoBuilder b)]) = _$ShipmentAddDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentAddDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentAddDto> get serializer => _$ShipmentAddDtoSerializer();
}

class _$ShipmentAddDtoSerializer implements PrimitiveSerializer<ShipmentAddDto> {
  @override
  final Iterable<Type> types = const [ShipmentAddDto, _$ShipmentAddDto];

  @override
  final String wireName = r'ShipmentAddDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.shipmentId != null) {
      yield r'shipmentId';
      yield serializers.serialize(
        object.shipmentId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.length != null) {
      yield r'length';
      yield serializers.serialize(
        object.length,
        specifiedType: const FullType(int),
      );
    }
    if (object.height != null) {
      yield r'height';
      yield serializers.serialize(
        object.height,
        specifiedType: const FullType(int),
      );
    }
    if (object.weight != null) {
      yield r'weight';
      yield serializers.serialize(
        object.weight,
        specifiedType: const FullType(int),
      );
    }
    if (object.contentDesc != null) {
      yield r'contentDesc';
      yield serializers.serialize(
        object.contentDesc,
        specifiedType: const FullType(int),
      );
    }
    if (object.contentValue != null) {
      yield r'contentValue';
      yield serializers.serialize(
        object.contentValue,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.senderCustomerId != null) {
      yield r'senderCustomerId';
      yield serializers.serialize(
        object.senderCustomerId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.receiverCustomerId != null) {
      yield r'receiverCustomerId';
      yield serializers.serialize(
        object.receiverCustomerId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.senderStoreId != null) {
      yield r'senderStoreId';
      yield serializers.serialize(
        object.senderStoreId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.receiverStoreId != null) {
      yield r'receiverStoreId';
      yield serializers.serialize(
        object.receiverStoreId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentAddDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'shipmentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.shipmentId = valueDes;
          break;
        case r'length':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.length = valueDes;
          break;
        case r'height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.height = valueDes;
          break;
        case r'weight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weight = valueDes;
          break;
        case r'contentDesc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.contentDesc = valueDes;
          break;
        case r'contentValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.contentValue = valueDes;
          break;
        case r'senderCustomerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.senderCustomerId = valueDes;
          break;
        case r'receiverCustomerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.receiverCustomerId = valueDes;
          break;
        case r'senderStoreId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.senderStoreId = valueDes;
          break;
        case r'receiverStoreId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.receiverStoreId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentAddDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentAddDtoBuilder();
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
