//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cost_response_dto.g.dart';

/// CostResponseDto
///
/// Properties:
/// * [shipperCode] 
/// * [name] 
/// * [icon] 
/// * [featuereName] 
/// * [deliverDays] 
/// * [deliverDaysPharse] 
/// * [totalPrice] 
@BuiltValue()
abstract class CostResponseDto implements Built<CostResponseDto, CostResponseDtoBuilder> {
  @BuiltValueField(wireName: r'ShipperCode')
  String? get shipperCode;

  @BuiltValueField(wireName: r'Name')
  String? get name;

  @BuiltValueField(wireName: r'Icon')
  String? get icon;

  @BuiltValueField(wireName: r'FeatuereName')
  String? get featuereName;

  @BuiltValueField(wireName: r'DeliverDays')
  int? get deliverDays;

  @BuiltValueField(wireName: r'DeliverDaysPharse')
  String? get deliverDaysPharse;

  @BuiltValueField(wireName: r'TotalPrice')
  double? get totalPrice;

  CostResponseDto._();

  factory CostResponseDto([void updates(CostResponseDtoBuilder b)]) = _$CostResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CostResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CostResponseDto> get serializer => _$CostResponseDtoSerializer();
}

class _$CostResponseDtoSerializer implements PrimitiveSerializer<CostResponseDto> {
  @override
  final Iterable<Type> types = const [CostResponseDto, _$CostResponseDto];

  @override
  final String wireName = r'CostResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CostResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.shipperCode != null) {
      yield r'ShipperCode';
      yield serializers.serialize(
        object.shipperCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'Name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.icon != null) {
      yield r'Icon';
      yield serializers.serialize(
        object.icon,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.featuereName != null) {
      yield r'FeatuereName';
      yield serializers.serialize(
        object.featuereName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deliverDays != null) {
      yield r'DeliverDays';
      yield serializers.serialize(
        object.deliverDays,
        specifiedType: const FullType(int),
      );
    }
    if (object.deliverDaysPharse != null) {
      yield r'DeliverDaysPharse';
      yield serializers.serialize(
        object.deliverDaysPharse,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalPrice != null) {
      yield r'TotalPrice';
      yield serializers.serialize(
        object.totalPrice,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CostResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CostResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ShipperCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.shipperCode = valueDes;
          break;
        case r'Name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'Icon':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.icon = valueDes;
          break;
        case r'FeatuereName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.featuereName = valueDes;
          break;
        case r'DeliverDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.deliverDays = valueDes;
          break;
        case r'DeliverDaysPharse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deliverDaysPharse = valueDes;
          break;
        case r'TotalPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.totalPrice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CostResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CostResponseDtoBuilder();
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

