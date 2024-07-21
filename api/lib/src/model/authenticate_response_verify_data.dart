//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate_response_verify_data.g.dart';

/// AuthenticateResponseVerifyData
///
/// Properties:
/// * [otp] 
/// * [message] 
@BuiltValue()
abstract class AuthenticateResponseVerifyData implements Built<AuthenticateResponseVerifyData, AuthenticateResponseVerifyDataBuilder> {
  @BuiltValueField(wireName: r'Otp')
  String? get otp;

  @BuiltValueField(wireName: r'Message')
  String? get message;

  AuthenticateResponseVerifyData._();

  factory AuthenticateResponseVerifyData([void updates(AuthenticateResponseVerifyDataBuilder b)]) = _$AuthenticateResponseVerifyData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticateResponseVerifyDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticateResponseVerifyData> get serializer => _$AuthenticateResponseVerifyDataSerializer();
}

class _$AuthenticateResponseVerifyDataSerializer implements PrimitiveSerializer<AuthenticateResponseVerifyData> {
  @override
  final Iterable<Type> types = const [AuthenticateResponseVerifyData, _$AuthenticateResponseVerifyData];

  @override
  final String wireName = r'AuthenticateResponseVerifyData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticateResponseVerifyData object, {
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
    AuthenticateResponseVerifyData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthenticateResponseVerifyDataBuilder result,
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
  AuthenticateResponseVerifyData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticateResponseVerifyDataBuilder();
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

