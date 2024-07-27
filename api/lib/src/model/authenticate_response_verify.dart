//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/authenticate_response_verify_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate_response_verify.g.dart';

/// AuthenticateResponseVerify
///
/// Properties:
/// * [reqSecureKey] 
/// * [success] 
/// * [data] 
/// * [errorMessage] 
@BuiltValue()
abstract class AuthenticateResponseVerify implements Built<AuthenticateResponseVerify, AuthenticateResponseVerifyBuilder> {
  @BuiltValueField(wireName: r'reqSecureKey')
  String? get reqSecureKey;

  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'data')
  AuthenticateResponseVerifyData? get data;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

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
    if (object.reqSecureKey != null) {
      yield r'reqSecureKey';
      yield serializers.serialize(
        object.reqSecureKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.success != null) {
      yield r'success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AuthenticateResponseVerifyData),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
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
        case r'reqSecureKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reqSecureKey = valueDes;
          break;
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.success = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AuthenticateResponseVerifyData),
          ) as AuthenticateResponseVerifyData;
          result.data.replace(valueDes);
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
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

