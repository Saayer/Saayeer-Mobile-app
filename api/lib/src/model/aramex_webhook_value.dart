//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'aramex_webhook_value.g.dart';

/// AramexWebhookValue
///
/// Properties:
/// * [waybillNumber] 
/// * [updateCode] 
/// * [updateDateTime] 
/// * [updateLocation] 
/// * [comments] 
/// * [problemCode] 
/// * [orderNumber] 
@BuiltValue()
abstract class AramexWebhookValue implements Built<AramexWebhookValue, AramexWebhookValueBuilder> {
  @BuiltValueField(wireName: r'waybillNumber')
  String? get waybillNumber;

  @BuiltValueField(wireName: r'updateCode')
  String? get updateCode;

  @BuiltValueField(wireName: r'updateDateTime')
  String? get updateDateTime;

  @BuiltValueField(wireName: r'updateLocation')
  String? get updateLocation;

  @BuiltValueField(wireName: r'comments')
  String? get comments;

  @BuiltValueField(wireName: r'problemCode')
  String? get problemCode;

  @BuiltValueField(wireName: r'orderNumber')
  String? get orderNumber;

  AramexWebhookValue._();

  factory AramexWebhookValue([void updates(AramexWebhookValueBuilder b)]) = _$AramexWebhookValue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AramexWebhookValueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AramexWebhookValue> get serializer => _$AramexWebhookValueSerializer();
}

class _$AramexWebhookValueSerializer implements PrimitiveSerializer<AramexWebhookValue> {
  @override
  final Iterable<Type> types = const [AramexWebhookValue, _$AramexWebhookValue];

  @override
  final String wireName = r'AramexWebhookValue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AramexWebhookValue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.waybillNumber != null) {
      yield r'waybillNumber';
      yield serializers.serialize(
        object.waybillNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updateCode != null) {
      yield r'updateCode';
      yield serializers.serialize(
        object.updateCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updateDateTime != null) {
      yield r'updateDateTime';
      yield serializers.serialize(
        object.updateDateTime,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updateLocation != null) {
      yield r'updateLocation';
      yield serializers.serialize(
        object.updateLocation,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.comments != null) {
      yield r'comments';
      yield serializers.serialize(
        object.comments,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.problemCode != null) {
      yield r'problemCode';
      yield serializers.serialize(
        object.problemCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.orderNumber != null) {
      yield r'orderNumber';
      yield serializers.serialize(
        object.orderNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AramexWebhookValue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AramexWebhookValueBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'waybillNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.waybillNumber = valueDes;
          break;
        case r'updateCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updateCode = valueDes;
          break;
        case r'updateDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updateDateTime = valueDes;
          break;
        case r'updateLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updateLocation = valueDes;
          break;
        case r'comments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.comments = valueDes;
          break;
        case r'problemCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.problemCode = valueDes;
          break;
        case r'orderNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.orderNumber = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AramexWebhookValue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AramexWebhookValueBuilder();
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

