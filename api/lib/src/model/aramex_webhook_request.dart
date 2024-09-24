//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/aramex_webhook_value.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'aramex_webhook_request.g.dart';

/// AramexWebhookRequest
///
/// Properties:
/// * [key] 
/// * [value] 
@BuiltValue()
abstract class AramexWebhookRequest implements Built<AramexWebhookRequest, AramexWebhookRequestBuilder> {
  @BuiltValueField(wireName: r'key')
  String? get key;

  @BuiltValueField(wireName: r'value')
  AramexWebhookValue? get value;

  AramexWebhookRequest._();

  factory AramexWebhookRequest([void updates(AramexWebhookRequestBuilder b)]) = _$AramexWebhookRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AramexWebhookRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AramexWebhookRequest> get serializer => _$AramexWebhookRequestSerializer();
}

class _$AramexWebhookRequestSerializer implements PrimitiveSerializer<AramexWebhookRequest> {
  @override
  final Iterable<Type> types = const [AramexWebhookRequest, _$AramexWebhookRequest];

  @override
  final String wireName = r'AramexWebhookRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AramexWebhookRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType.nullable(AramexWebhookValue),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AramexWebhookRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AramexWebhookRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.key = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AramexWebhookValue),
          ) as AramexWebhookValue?;
          if (valueDes == null) continue;
          result.value.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AramexWebhookRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AramexWebhookRequestBuilder();
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

