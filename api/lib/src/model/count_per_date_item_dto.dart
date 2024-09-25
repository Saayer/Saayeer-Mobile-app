//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'count_per_date_item_dto.g.dart';

/// CountPerDateItemDto
///
/// Properties:
/// * [date] 
/// * [count] 
@BuiltValue()
abstract class CountPerDateItemDto implements Built<CountPerDateItemDto, CountPerDateItemDtoBuilder> {
  @BuiltValueField(wireName: r'date')
  DateTime? get date;

  @BuiltValueField(wireName: r'count')
  int? get count;

  CountPerDateItemDto._();

  factory CountPerDateItemDto([void updates(CountPerDateItemDtoBuilder b)]) = _$CountPerDateItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CountPerDateItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CountPerDateItemDto> get serializer => _$CountPerDateItemDtoSerializer();
}

class _$CountPerDateItemDtoSerializer implements PrimitiveSerializer<CountPerDateItemDto> {
  @override
  final Iterable<Type> types = const [CountPerDateItemDto, _$CountPerDateItemDto];

  @override
  final String wireName = r'CountPerDateItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CountPerDateItemDto object, {
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
    CountPerDateItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CountPerDateItemDtoBuilder result,
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
  CountPerDateItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CountPerDateItemDtoBuilder();
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

