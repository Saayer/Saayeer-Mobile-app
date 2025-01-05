//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logistic_service_post_dto.g.dart';

/// LogisticServicePostDto
///
/// Properties:
/// * [logisticServiceId] 
/// * [isEnabled] 
@BuiltValue()
abstract class LogisticServicePostDto implements Built<LogisticServicePostDto, LogisticServicePostDtoBuilder> {
  @BuiltValueField(wireName: r'logisticServiceId')
  int? get logisticServiceId;

  @BuiltValueField(wireName: r'isEnabled')
  bool? get isEnabled;

  LogisticServicePostDto._();

  factory LogisticServicePostDto([void updates(LogisticServicePostDtoBuilder b)]) = _$LogisticServicePostDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogisticServicePostDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogisticServicePostDto> get serializer => _$LogisticServicePostDtoSerializer();
}

class _$LogisticServicePostDtoSerializer implements PrimitiveSerializer<LogisticServicePostDto> {
  @override
  final Iterable<Type> types = const [LogisticServicePostDto, _$LogisticServicePostDto];

  @override
  final String wireName = r'LogisticServicePostDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogisticServicePostDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.logisticServiceId != null) {
      yield r'logisticServiceId';
      yield serializers.serialize(
        object.logisticServiceId,
        specifiedType: const FullType(int),
      );
    }
    if (object.isEnabled != null) {
      yield r'isEnabled';
      yield serializers.serialize(
        object.isEnabled,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LogisticServicePostDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogisticServicePostDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'logisticServiceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.logisticServiceId = valueDes;
          break;
        case r'isEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isEnabled = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LogisticServicePostDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogisticServicePostDtoBuilder();
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

