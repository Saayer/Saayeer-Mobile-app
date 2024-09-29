//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'count_per_date_dto.g.dart';

/// CountPerDateDto
///
/// Properties:
/// * [date] 
/// * [count] 
@BuiltValue()
abstract class CountPerDateDto implements Built<CountPerDateDto, CountPerDateDtoBuilder> {
  @BuiltValueField(wireName: r'date')
  DateTime? get date;

  @BuiltValueField(wireName: r'count')
  int? get count;

  CountPerDateDto._();

  factory CountPerDateDto([void updates(CountPerDateDtoBuilder b)]) = _$CountPerDateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CountPerDateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CountPerDateDto> get serializer => _$CountPerDateDtoSerializer();
}

class _$CountPerDateDtoSerializer implements PrimitiveSerializer<CountPerDateDto> {
  @override
  final Iterable<Type> types = const [CountPerDateDto, _$CountPerDateDto];

  @override
  final String wireName = r'CountPerDateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CountPerDateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.count != null) {
      yield r'count';
      yield serializers.serialize(
        object.count,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CountPerDateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CountPerDateDtoBuilder result,
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
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.count = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CountPerDateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CountPerDateDtoBuilder();
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

