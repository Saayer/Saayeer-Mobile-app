//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address_logistics.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_cost_obj.g.dart';

/// ShipmentCostObj
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
abstract class ShipmentCostObj implements Built<ShipmentCostObj, ShipmentCostObjBuilder> {
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

  @BuiltValueField(wireName: r'senderAddress')
  AddressLogistics? get senderAddress;

  @BuiltValueField(wireName: r'receiverAddress')
  AddressLogistics? get receiverAddress;

  ShipmentCostObj._();

  factory ShipmentCostObj([void updates(ShipmentCostObjBuilder b)]) = _$ShipmentCostObj;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentCostObjBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentCostObj> get serializer => _$ShipmentCostObjSerializer();
}

class _$ShipmentCostObjSerializer implements PrimitiveSerializer<ShipmentCostObj> {
  @override
  final Iterable<Type> types = const [ShipmentCostObj, _$ShipmentCostObj];

  @override
  final String wireName = r'ShipmentCostObj';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentCostObj object, {
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
      yield r'senderAddress';
      yield serializers.serialize(
        object.senderAddress,
        specifiedType: const FullType.nullable(AddressLogistics),
      );
    }
    if (object.receiverAddress != null) {
      yield r'receiverAddress';
      yield serializers.serialize(
        object.receiverAddress,
        specifiedType: const FullType.nullable(AddressLogistics),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentCostObj object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentCostObjBuilder result,
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
        case r'senderAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AddressLogistics),
          ) as AddressLogistics?;
          if (valueDes == null) continue;
          result.senderAddress.replace(valueDes);
          break;
        case r'receiverAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AddressLogistics),
          ) as AddressLogistics?;
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
  ShipmentCostObj deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentCostObjBuilder();
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

