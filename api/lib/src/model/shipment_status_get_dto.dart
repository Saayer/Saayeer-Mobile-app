//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/shipment_status_enum.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_status_get_dto.g.dart';

/// ShipmentStatusGetDto
///
/// Properties:
/// * [status] 
/// * [description] 
/// * [createdAt] 
@BuiltValue()
abstract class ShipmentStatusGetDto implements Built<ShipmentStatusGetDto, ShipmentStatusGetDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  ShipmentStatusEnum? get status;
  // enum statusEnum {  Pending,  Paid,  Requested,  Picked,  OnTheWay,  Delivered,  NeedAction,  UnKnown,  Canceled,  HasError,  };

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  ShipmentStatusGetDto._();

  factory ShipmentStatusGetDto([void updates(ShipmentStatusGetDtoBuilder b)]) = _$ShipmentStatusGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentStatusGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentStatusGetDto> get serializer => _$ShipmentStatusGetDtoSerializer();
}

class _$ShipmentStatusGetDtoSerializer implements PrimitiveSerializer<ShipmentStatusGetDto> {
  @override
  final Iterable<Type> types = const [ShipmentStatusGetDto, _$ShipmentStatusGetDto];

  @override
  final String wireName = r'ShipmentStatusGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentStatusGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ShipmentStatusEnum),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentStatusGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentStatusGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ShipmentStatusEnum),
          ) as ShipmentStatusEnum;
          result.status = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentStatusGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentStatusGetDtoBuilder();
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

