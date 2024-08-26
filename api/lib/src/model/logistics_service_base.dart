//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logistics_service_base.g.dart';

/// LogisticsServiceBase
///
/// Properties:
/// * [name] 
/// * [company] 
@BuiltValue()
abstract class LogisticsServiceBase implements Built<LogisticsServiceBase, LogisticsServiceBaseBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'company')
  String? get company;

  LogisticsServiceBase._();

  factory LogisticsServiceBase([void updates(LogisticsServiceBaseBuilder b)]) = _$LogisticsServiceBase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogisticsServiceBaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogisticsServiceBase> get serializer => _$LogisticsServiceBaseSerializer();
}

class _$LogisticsServiceBaseSerializer implements PrimitiveSerializer<LogisticsServiceBase> {
  @override
  final Iterable<Type> types = const [LogisticsServiceBase, _$LogisticsServiceBase];

  @override
  final String wireName = r'LogisticsServiceBase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogisticsServiceBase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.company != null) {
      yield r'company';
      yield serializers.serialize(
        object.company,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LogisticsServiceBase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogisticsServiceBaseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'company':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.company = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LogisticsServiceBase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogisticsServiceBaseBuilder();
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

