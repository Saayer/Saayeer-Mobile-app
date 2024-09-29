//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'date_range_dto.g.dart';

/// DateRangeDto
///
/// Properties:
/// * [startDate] 
/// * [endDate] 
@BuiltValue()
abstract class DateRangeDto implements Built<DateRangeDto, DateRangeDtoBuilder> {
  @BuiltValueField(wireName: r'startDate')
  DateTime? get startDate;

  @BuiltValueField(wireName: r'endDate')
  DateTime? get endDate;

  DateRangeDto._();

  factory DateRangeDto([void updates(DateRangeDtoBuilder b)]) = _$DateRangeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DateRangeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DateRangeDto> get serializer => _$DateRangeDtoSerializer();
}

class _$DateRangeDtoSerializer implements PrimitiveSerializer<DateRangeDto> {
  @override
  final Iterable<Type> types = const [DateRangeDto, _$DateRangeDto];

  @override
  final String wireName = r'DateRangeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DateRangeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.startDate != null) {
      yield r'startDate';
      yield serializers.serialize(
        object.startDate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.endDate != null) {
      yield r'endDate';
      yield serializers.serialize(
        object.endDate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DateRangeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DateRangeDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'startDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startDate = valueDes;
          break;
        case r'endDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DateRangeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DateRangeDtoBuilder();
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

