//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/amount_per_date_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'amount_per_date_response.g.dart';

/// AmountPerDateResponse
///
/// Properties:
/// * [total] 
/// * [amounts] 
@BuiltValue()
abstract class AmountPerDateResponse implements Built<AmountPerDateResponse, AmountPerDateResponseBuilder> {
  @BuiltValueField(wireName: r'total')
  double? get total;

  @BuiltValueField(wireName: r'amounts')
  BuiltList<AmountPerDateDto>? get amounts;

  AmountPerDateResponse._();

  factory AmountPerDateResponse([void updates(AmountPerDateResponseBuilder b)]) = _$AmountPerDateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AmountPerDateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AmountPerDateResponse> get serializer => _$AmountPerDateResponseSerializer();
}

class _$AmountPerDateResponseSerializer implements PrimitiveSerializer<AmountPerDateResponse> {
  @override
  final Iterable<Type> types = const [AmountPerDateResponse, _$AmountPerDateResponse];

  @override
  final String wireName = r'AmountPerDateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AmountPerDateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(double),
      );
    }
    if (object.amounts != null) {
      yield r'amounts';
      yield serializers.serialize(
        object.amounts,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AmountPerDateDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AmountPerDateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AmountPerDateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.total = valueDes;
          break;
        case r'amounts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AmountPerDateDto)]),
          ) as BuiltList<AmountPerDateDto>?;
          if (valueDes == null) continue;
          result.amounts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AmountPerDateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AmountPerDateResponseBuilder();
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

