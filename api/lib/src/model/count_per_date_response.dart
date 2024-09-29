//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/count_per_date_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'count_per_date_response.g.dart';

/// CountPerDateResponse
///
/// Properties:
/// * [total] 
/// * [counts] 
@BuiltValue()
abstract class CountPerDateResponse implements Built<CountPerDateResponse, CountPerDateResponseBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'counts')
  BuiltList<CountPerDateItemDto>? get counts;

  CountPerDateResponse._();

  factory CountPerDateResponse([void updates(CountPerDateResponseBuilder b)]) = _$CountPerDateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CountPerDateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CountPerDateResponse> get serializer => _$CountPerDateResponseSerializer();
}

class _$CountPerDateResponseSerializer implements PrimitiveSerializer<CountPerDateResponse> {
  @override
  final Iterable<Type> types = const [CountPerDateResponse, _$CountPerDateResponse];

  @override
  final String wireName = r'CountPerDateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CountPerDateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.counts != null) {
      yield r'counts';
      yield serializers.serialize(
        object.counts,
        specifiedType: const FullType.nullable(BuiltList, [FullType(CountPerDateItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CountPerDateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CountPerDateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'counts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CountPerDateItemDto)]),
          ) as BuiltList<CountPerDateItemDto>?;
          if (valueDes == null) continue;
          result.counts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CountPerDateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CountPerDateResponseBuilder();
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

