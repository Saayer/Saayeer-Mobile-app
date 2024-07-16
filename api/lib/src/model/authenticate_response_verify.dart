//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate_response_verify.g.dart';

/// AuthenticateResponseVerify
///
/// Properties:
/// * [otp] 
/// * [message] 
@BuiltValue()
abstract class AuthenticateResponseVerify implements Built<AuthenticateResponseVerify, AuthenticateResponseVerifyBuilder> {
  @BuiltValueField(wireName: r'Otp')
  String? get otp;

  @BuiltValueField(wireName: r'Message')
  String? get message;

  AuthenticateResponseVerify._();

  factory AuthenticateResponseVerify([void updates(AuthenticateResponseVerifyBuilder b)]) = _$AuthenticateResponseVerify;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticateResponseVerifyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticateResponseVerify> get serializer => _$AuthenticateResponseVerifySerializer();
}

class _$AuthenticateResponseVerifySerializer implements PrimitiveSerializer<AuthenticateResponseVerify> {
  @override
  final Iterable<Type> types = const [AuthenticateResponseVerify, _$AuthenticateResponseVerify];

  @override
  final String wireName = r'AuthenticateResponseVerify';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticateResponseVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.otp != null) {
      yield r'Otp';
      yield serializers.serialize(
        object.otp,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.message != null) {
      yield r'Message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthenticateResponseVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthenticateResponseVerifyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Otp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.otp = valueDes;
          break;
        case r'Message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthenticateResponseVerify deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticateResponseVerifyBuilder();
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

