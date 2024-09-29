//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'amount_per_date_dto.g.dart';

/// AmountPerDateDto
///
/// Properties:
/// * [date] 
/// * [amount] 
@BuiltValue()
abstract class AmountPerDateDto implements Built<AmountPerDateDto, AmountPerDateDtoBuilder> {
  @BuiltValueField(wireName: r'date')
  DateTime? get date;

  @BuiltValueField(wireName: r'amount')
  double? get amount;

  AmountPerDateDto._();

  factory AmountPerDateDto([void updates(AmountPerDateDtoBuilder b)]) = _$AmountPerDateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AmountPerDateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AmountPerDateDto> get serializer => _$AmountPerDateDtoSerializer();
}

class _$AmountPerDateDtoSerializer implements PrimitiveSerializer<AmountPerDateDto> {
  @override
  final Iterable<Type> types = const [AmountPerDateDto, _$AmountPerDateDto];

  @override
  final String wireName = r'AmountPerDateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AmountPerDateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AmountPerDateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AmountPerDateDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.date = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.amount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AmountPerDateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AmountPerDateDtoBuilder();
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

